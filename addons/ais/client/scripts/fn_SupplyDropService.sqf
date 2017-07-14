private["_vic","_vicStartingPosition", "_dropType", "_destination", "_driver", "_flyHeight", "_markerType", "_airVic"];
params["_items", "_vicClass", ["_spawnPostitions", []], ["_requiredGear", []]];

_inheritance = _vicClass call GetInheritance;
_group = createGroup INDEPENDENT;
_dropType = "Air";
_wpDestination = [];
_flyHeight = 200;
_markerType = "b_plane";
_markerText = " Supply Plane";

if("SmokeShell" in _requiredGear) then {
	_reinforcementRequest = player addEventHandler ["Fired", {  
		_isSmoke = false;
		_magazineType = _this select 4;
		if(_magazineType == "SmokeShell") then {
			_isSmoke = true;
		}
		else {
			_inheritance = _magazineType call GetInheritance;					
			_type = _inheritance select (count _inheritance - 2);
			if(_type == "SmokeShell") then {
				_isSmoke = true;
			};
		};

		if(_isSmoke) then {
			[_this select 6] spawn {
				_smoke = _this select 0;  				
				sleep 4;
				smokeOut = true; 	
				player setVariable["AIS_smoke_out", true];
				player setVariable["AIS_smoke_position", getPosASL  _smoke]; 
			}			
		}
	}];
};

_destination = [position player, (random [5, 10 ,25]), (random 360)] call BIS_fnc_relPos;   

	_posarray = [];		
	_airfields = [];	
	_selectedAirfield = 0;  

if("Land" in _inheritance) then {
	_dropType = "Land";
	_destination = [position player, (random [15, 25 , 35]), (random 360)] call BIS_fnc_relPos;   
	_randPosition = [position player, (random [150, 200 , 300]), (random 360)] call BIS_fnc_relPos;		
	_vicStartingPosition = [_randPosition, 1, 150, 3, 0, 20, 0] call BIS_fnc_findSafePos;				
	_vic = createVehicle [_vicClass, _vicStartingPosition, [], 0, "NONE"];			
	_driver = _group createUnit ["B_Helipilot_F", [0,0,1], [], 0, "CAN_COLLIDE"];
	_dir = _vic getRelDir player;
	_vic setDir (_dir); 
	_markerType = "b_unknown";
	_markerText = " Supply Truck";
	createVehicleCrew _vic;
	{
		[_x] joinSilent _group;
		_x allowDamage (_allowDamage);  		
	} forEach crew _vic;	
};

if("Air" in _inheritance) then { 
	_airVic = [_vicClass, AIS_Resupply_IncludePrimaryMapAirSpawnPoints, AIS_Resupply_IncludeSecondaryMapAirSpawnPoints, _spawnPostitions] call AIS_Client_fnc_CreateAirVehicle;
	_vic = _airVic select 0; 
}; 

_vic = _airVic select 0;
_spawnProperties = _airVic select 1; 
_finalDestination = _spawnProperties select 0;	
_special = if (count _spawnProperties > 3) then [{_spawnProperties select 3 }, {"NONE"}];	

_vic setVehicleLock "LOCKED"; 
_vic setVariable ["missionComplete", false];

[_vic] spawn {
	params["_vic"];
	while{alive _vic && getDammage _vic < .8 && !(_vic getVariable ["missionComplete", false]) && alive player} do {
		sleep 2;
	};
  
	if!(alive _vic) then {		
		["ErrorTitleAndText", ["AI Support - Resupply", "Your resupply vehicle was destroyed."]] call ExileClient_gui_toaster_addTemplateToast;		
	};
};
 
if("Plane" in _inheritance) then { 
	_vic flyInHeight 200; 
}; 

if("SmokeShell" in _requiredGear) then {
	_wp = group _vic addWaypoint [getPos player, 0]; 
	_wp setWaypointType "LOITER"; 	
	_wp setWaypointCombatMode "BLUE";
	group _vic setCurrentWaypoint _wp; 		
} else {
	_vic doMove _destination;
};
	

["successTitleAndText",    
	[
		"AI Support - Resupply",  
		format["Supplies are in route."]
	]
] call ExileClient_gui_toaster_addTemplateToast; 
  
 
if(AIS_Cas_TrackAircraftOnMap) then {
	_markerName = format["AIS_Resupply_Vic_%1", random 99999];
	[_vic, _markerName, _markerType, _markerText] spawn {		
		params ["_vic","_markerName","_markerType", "_markerText"];	 
		_marker = createMarker[_markerName, getPos _vic]; 
		While{not isnull _vic && !(_vic getVariable ["missionComplete", false])} do {	 
			deleteMarker _marker; 
			_marker = createMarker[_markerName, getPos _vic]; 
			_marker setMarkerType _markerType;
			_marker setMarkerSize[0.4, 0.4];
			_marker setMarkerColor 'ColorBlue';
			if(!alive _vic) then {
				_marker setMarkerColor 'ColorRed';
			};			
			_marker setMarkerText _markerText; 
			sleep .2;
		};		
		deleteMarker _marker;
	};
}; 
 
if("SmokeShell" in _requiredGear) then { 
	[_airVic] spawn {
		params["_airVic"];
		_vic = _airVic select 0;
		_spawnProperties = _airVic select 1; 
		_finalDestination = _spawnProperties select 0;		
		_special = if (count _spawnProperties > 3) then [{_spawnProperties select 3 }, {"NONE"}];		

		_count = 0;
		while {!isnull _vic && alive _vic && (_vic distance2D (getPos player) <= 1500) && !(player getVariable["AIS_smoke_out", false]);} do {
			["infoTitleAndText",    
				[
					"AI Support - Resupply",  
					format["Supply aircraft is on location. They need some smoke to drop the package.."]
				]				
			] call ExileClient_gui_toaster_addTemplateToast; 
			sleep 25;						
			if(_count > 5 && !isnull _vic && alive _vic && !(player getVariable["AIS_smoke_out", false])) then {
				_vic setVariable ["missionComplete", true];		 
				[_vic, _finalDestination, _special] spawn AIS_Client_fnc_AirVicRTB;	

				["errorTitleAndText",    
					[
						"AI Support - Resupply",  
						format["The supply aircraft is low on fuel and has to return to base."]
					]				
				] call ExileClient_gui_toaster_addTemplateToast; 						
			};
			_count = _count + 1;
		};
	};

	waitUntil {isnull _vic ||  getDammage _vic == 1 || player getVariable["AIS_smoke_out", false]};  		
	sleep 4;
	//player setVariable["AIS_smoke_out", true];
 
	_smokePosition = player getVariable["AIS_smoke_position", nil]; 
	_wp1 = group _vic addWaypoint [_smokePosition, 0]; 
	_wp1 setWaypointType "Move"; 	
	_wp1 setWaypointCombatMode "BLUE"; 
	_vic setVariable['AIS_supply_items', _items];
	_wp1 setWaypointScript "
		hint 'hello'; 
	";
 
	group _vic setCurrentWaypoint _wp1;

	_vic setVariable ["missionComplete", true];		 

	
} else {
	waitUntil {isnull _vic ||  getDammage _vic == 1 || !alive player || unitReady _vic };
	if(isnull _vic) exitwith{};
	[_vic, 'Box_NATO_Wps_F', _dropType,  _items] spawn AIS_Client_fnc_SupplyDrop;	
}; 

 
if(getDammage _vic >= .8) exitwith {
	_vic setDamage  1;
};

sleep 3;
_vic setVariable ["missionComplete", true];

while {(count (waypoints (group _vic))) > 0} do
{
	deleteWaypoint ((waypoints (group _vic)) select 0);
};		


switch(_dropType) do {
	case "Land": {
		_randPosition = [position player, (random [150, 200 , 300]), (random 360)] call BIS_fnc_relPos;		
		_vic doMove _randPosition;

		waitUntil {isnull _vic || !alive _driver || !alive player || (unitReady _vic)};
		sleep 5;
		_vic engineOn false;
		sleep 3;
		deleteVehicle _driver;
		deleteVehicle _vic;				
	};
	case "Air": { 
		_special = if (count _spawnProperties > 3) then [{_spawnProperties select 3 }, {"NONE"}];
		[_vic, _finalDestination, _special] spawn AIS_Client_fnc_AirVicRTB;	
	};
};
 


