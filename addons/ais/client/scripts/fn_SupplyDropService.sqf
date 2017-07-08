private["_vic","_vicStartingPosition", "_dropType", "_destination", "_driver", "_flyHeight", "_markerType", "_airVic"];
params["_items", "_vicClass", ["_spawnPostitions", []]];

_inheritance = _vicClass call GetInheritance;
_group = createGroup INDEPENDENT;
_dropType = "Air";
_wpDestination = [];
_flyHeight = 200;
_markerType = "b_plane";
_markerText = " Supply Plane";

_destination = [position player, (random [5, 10 ,25]), (random 360)] call BIS_fnc_relPos;   

	_posarray = [];		
	_airfields = [];	
	_selectedAirfield = 0; 
//	{systemchat str _x} count allVariables player;

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
	_vic doMove _destination;
}; 
if("Helicopter" in _inheritance) then {  
	[_vic, getPosASL player, 30] spawn AIS_Client_fnc_DoCombatHover;
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
 
if("Helicopter" in _inheritance) then { 
	waitUntil {isnull _vic ||  getDammage _vic == 1 || _vic getVariable ["AIS_Combat_Hovering", false]}; 
	 
} else {
	waitUntil {isnull _vic ||  getDammage _vic == 1 || !alive player || unitReady _vic };
};

if(isnull _vic) exitwith{};
if(getDammage _vic >= .8) exitwith {
	_vic setDamage  1;
};

[_vic, 'Box_NATO_Wps_F', _dropType,  _items] spawn AIS_Client_fnc_SupplyDrop;
 sleep 3;
_vic setVariable ["missionComplete", true];

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
		_spawnProperties = _airVic select 1; 
		sleep 3;

		_lz = _spawnProperties select 0;
		_vic doMove _lz;
		
		waitUntil {isnull _vic || getDammage _vic >= .8 || unitReady _vic };
		if(isnull _vic) exitwith{};
		if(getDammage _vic >= .8) exitwith {
			_vic setDamage 1;
		};

		_special = if (count _spawnProperties > 3) then [{_spawnProperties select 3 }, {"NONE"}];
		if(_special == "FLY") then {
			{ deleteVehicle _x } forEach (crew _vic); deleteVehicle _vic;
		}
		else {
			_vic land "LAND";	
			waitUntil {isnull _vic || getDammage _vic >= .8 || isTouchingGround  _vic };
			if(isnull _vic) exitwith{};
			if(getDammage _vic >= .8) exitwith {
				_vic setDamage  1;
			};
			sleep 15;
			_vic engineOn false;
			sleep 5;
			{ deleteVehicle _x } forEach (crew _vic); deleteVehicle _vic;		 					 
		} 
	};
};
 


