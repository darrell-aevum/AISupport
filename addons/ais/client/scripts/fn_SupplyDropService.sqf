private["_vic","_vicStartingPosition", "_dropType", "_destination", "_driver", "_flyHeight", "_markerType"];
params["_items", "_vicClass"];

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
};

if("Air" in _inheritance) then { 
	_primaryAirfieldss = getarray (configfile >> "CfgWorlds" >> worldName >> "ilsTaxiIn");		

	if("Plane" in _inheritance) then {		
		_airfields = _airfields + _primaryAirfieldss; 					
	};
	if("Helicopter" in _inheritance) then {
		_airfields = _airfields + _primaryAirfieldss;
					_secondaryAirfields = [(configfile >> "CfgWorlds" >> worldName >> "SecondaryAirports" ),1, true, true ] call BIS_fnc_returnChildren;
					{
						_airfields = _airfields + getarray(_x select 3);
					} forEach _secondaryAirfields;	
		_flyHeight = 100; 
		_markerType = "b_air";
		_markerText = " Supply Helicopter";
	};

	for "_i" from 0 to (count _airfields - 1) step 2 do {
		_posarray set [count _posarray,[_airfields select _i, (_airfields select _i + 1)]];
	};

	_selectedAirfield =  random ((count _posarray)-1);
	_vicStartingPosition = _posarray select _selectedAirfield;

	_loop = 0;
    while {count (nearestObjects [_vicStartingPosition, ["Air"], 150]) > 0} do { 				
		if(_loop > 10) then {
			["infoTitleAndText",    
				[
					"AI Support - Resupply",  
					format["Waiting for runway to clear before launching resupply mission."]
				]
			] call ExileClient_gui_toaster_addTemplateToast; 
			_loop = 0;			
		};
		sleep 1;
		_loop = _loop + 1;
    };	
 

	_vic = createVehicle [_vicClass, _vicStartingPosition, [], 0, "None"]; 
	_driver = _group createUnit ["I_crew_F", [0,0,1], [], 0, "CAN_COLLIDE"]; 
	_vic flyInHeight _flyHeight; 
}; 

_driver moveInDriver _vic;
_vic setVehicleLock "LOCKED"; 
_vic doMove _destination;

	["successTitleAndText",    
		[
			"AI Support - Resupply",  
			format["Supplies are in route."]
		]
	] call ExileClient_gui_toaster_addTemplateToast; 

[_vic, player, 60*2] remoteExec ["AIS_Server_fnc_VehicleMonitor", 2];

_markerName = format["AIS_Resupply_Vic_%1", random 99999];

if(AIS_Cas_TrackAircraftOnMap) then {
	[_vic, _markerName, _markerType, _markerText] spawn {
		params ["_vic","_markerName","_markerType", "_markerText"];	 
		_marker = createMarker[_markerName, getPos _vic]; 
		While{not isnull _vic} do {	 
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

waitUntil {isnull _vic || !alive _driver || !alive player || unitReady _vic };

if(alive _driver) then {	
	[_vic, 'Box_NATO_Wps_F', _dropType,  _items] spawn AIS_Client_fnc_SupplyDrop;			
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
			sleep 3;
			_selectedAirfield =  random ((count _posarray)-1);
			_lz = _posarray select _selectedAirfield;
			_vic doMove _lz;
			
			waitUntil {isnull _vic || !alive _driver || !alive player || unitReady _vic };
			_vic land "LAND";	 
			
			waitUntil {isnull _vic || !alive _driver || !alive player || (unitReady _vic && isTouchingGround _vic)};
			sleep 15;
			_vic engineOn false;
			sleep 5;
			deleteVehicle _driver;
			deleteVehicle _vic;				
		};
	};
}	
else {

};


