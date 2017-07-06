	/*
		AIS_fnc_FireVirtualArtillery
		Created by DHarvey44
	
		Fires virtual artillery rounds.
	*/
	private ["_marker"];
	params [
		["_aircraftType", "B_Plane_CAS_01_F"],
		["_duration", 35],	
		["_targetPosition", objNull, [objNull, []]],
		["_radius", 50, [0]],
		["_dir", random 360, [0]],
		["_height", 0, [0]]
	];
	_callSign = "Falcon 3-1";
	_inheritance = _aircraftType call GetInheritance;		

 
	_posarray = [];	
	_airfields = [];
	_selectedAirfield = 0;
	_group = createGroup INDEPENDENT;
 
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
	};
 
	for "_i" from 0 to (count _airfields - 1) step 2 do {
		_posarray set [count _posarray,[_airfields select _i, (_airfields select _i + 1)]];
	};

	_selectedAirfield =  random ((count _posarray)-1);
	_pos = _posarray select _selectedAirfield;
 
 	_loop = 0;
    while {count (nearestObjects [_pos, ["Air"], 100]) > 0} do { 				
		if(_loop > 10) then {
			["infoTitleAndText",    
				[
					"AI Support - CAS",  
					format["Waiting for runway to clear before launching CAS"]
				]
			] call ExileClient_gui_toaster_addTemplateToast; 
			_loop = 0;			
		};
		sleep 1;
		_loop = _loop + 1;
    };	
 
	_vic = createVehicle [_aircraftType, _pos, [], 0, "None"];
 	_vic setVehicleLock "LOCKED"; 
	[_vic, player, 60*5] remoteExec ["AIS_Server_fnc_VehicleMonitor", 2];


 	createVehicleCrew _vic;
	createVehicleCrew _vic;
	{
		[_x] joinSilent _group;
		_x allowDamage true;		
	} forEach crew _vic;

	_vic doMove (position player);
	
	["successTitleAndText",    
		[
			"AI Support - CAS",  
			format["Close Air Support is in route."]
		]
	] call ExileClient_gui_toaster_addTemplateToast; 
	
	if(AIS_Resupply_MarkCrateOnMap) then {
		_markerName = format["AIS_Cas_Vic_%1", random 99999];
		[_vic, _markerName] spawn {
			params ["_vic","_markerName"];	 
			_marker = createMarker[_markerName, getPos _vic]; 
			While{not isnull _vic} do {	 
				deleteMarker _marker; 
				_marker = createMarker[_markerName, getPos _vic]; 
				_marker setMarkerType 'b_plane';
				_marker setMarkerSize[0.4, 0.4];
				_marker setMarkerColor 'ColorGreen';
				if(!alive _vic) then {
					_marker setMarkerColor 'ColorRed';
				};	
				_marker setMarkerText ' CAS'; 
				sleep .2;
			};		
			deleteMarker _marker;
		};
	}; 
 
 	if("Plane" in _inheritance) then {		
		waitUntil{(_vic distance2D (getPos player)) <= 2000};  	 	
	};
	if("Helicopter" in _inheritance) then {
		waitUntil{(_vic distance2D (getPos player)) <= 1250};  	 	
	};
 	
	createVehicleCrew _vic;
	{
		[_x] joinSilent (group player);
	} forEach crew _vic;

	(group player) setCombatMode "RED";
	_vic setFuel 1; 

	sleep _duration;
	
	if(isnull _vic || ({alive _x} count crew _vic == 0)) exitwith {

	};
	 

	createVehicleCrew _vic;
	{
		[_x] joinSilent _group;
	} forEach crew _vic;

	["infoTitleAndText",    
		[
			"AI Support - CAS",  
			format["Close Air Support is low on fuel and returning to base."]
		]
	] call ExileClient_gui_toaster_addTemplateToast; 

	_selectedAirfield =  random ((count _posarray)-1);
	_lz = _posarray select _selectedAirfield;
	_vic doMove _lz;
	
	waitUntil {isnull _vic || !alive player || unitReady _vic };
	if(isnull _vic || ({alive _x} count crew _vic == 0)) exitwith {};
	  
	_vic land "LAND";	 
	
	waitUntil {isnull _vic || !alive player || (unitReady _vic && isTouchingGround _vic)};

	if(isnull _vic || ({alive _x} count crew _vic == 0)) exitwith {};
	 
	sleep 15;
	_vic engineOn false;
	sleep 5; 
	deleteVehicle _vic;				
 
 
