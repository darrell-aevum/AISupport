	private ["_marker", "_airVic"];
	params [
		["_aircraftType", "B_Plane_CAS_01_F"],
		["_spawnPostitions", []],
		["_duration", 35],	
		["_targetPosition", objNull, [objNull, []]],
		["_radius", 50, [0]],
		["_dir", random 360, [0]],
		["_height", 0, [0]]
	];
	_callSign = "Falcon 3-1";
	 
	_airVic = [_aircraftType, AIS_Cas_IncludePrimaryMapSpawnPoints, AIS_Cas_IncludeSecondaryMapSpawnPoints, _spawnPostitions] call AIS_Client_fnc_CreateAirVehicle;
   	
	_vic = _airVic select 0;
	_group = group _vic;
  
	_vic doMove (position player);
	
	["successTitleAndText",    
		[
			"AI Support - CAS",  
			format["Close Air Support is in route."]
		]
	] call ExileClient_gui_toaster_addTemplateToast; 
	
	//Add Marker
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
 
	//Wait for vic to get close
 	_inheritance = _aircraftType call GetInheritance;
 	if("Plane" in _inheritance) then {		
		waitUntil{(_vic distance2D (getPos player)) <= 2000};  	 	

	};
	if("Helicopter" in _inheritance) then {
		waitUntil{(_vic distance2D (getPos player)) <= 1250};  	 	
	};
 	 
	_spawnProperties = _airVic select 1; 

[_vic,_spawnProperties] spawn {
	params["_vic", "_spawnProperties"];
	while{!isNull _vic && alive _vic && getDammage _vic < .8 && !(_vic getVariable ["missionComplete", false]) && alive player} do {				
		_wp = group _vic addWaypoint [getPos player, 0]; 
		_wp setWaypointType "SAD"; 
		_wp setWaypointBehaviour "COMBAT";
		_wp setWaypointCombatMode "RED";
		group _vic setCurrentWaypoint _wp;
		hint format["Is Touching: %1", isTouchingGround _vic];
		sleep 5;
		deleteWaypoint _wp;
	};

	if(!alive _vic || isNull _vic) exitwith {		
		["ErrorTitleAndText", ["AI Support - CAS", "A CAS unit has been destroyed."]] call ExileClient_gui_toaster_addTemplateToast;		
	};
	if(getDammage _vic >= .8) exitwith {
		_vic setDamage  1;
	};

	["infoTitleAndText",    
		[
			"AI Support - CAS",  
			format["Low fuel, returning to base."]
		]
	] call ExileClient_gui_toaster_addTemplateToast; 

	(group _vic) setCombatMode "BLUE";
 
	sleep 3;

	_lz = _spawnProperties select 0;
	_vic doMove _lz;
	
	waitUntil {isnull _vic || getDammage _vic >= .8 || unitReady _vic };
	if(isnull _vic) exitwith{};
	if(getDammage _vic >= .8) exitwith {
		_vic setDamage  1;
	};

	_special = if (count _spawnProperties > 3) then [{_spawnProperties select 3 }, {"NONE"}];
	if(_special == "FLY") then {
		{ deleteVehicle _x } forEach (crew _vic); deleteVehicle _vic;
	}
	else {
		_vic land "LAND";	
		waitUntil {isnull _vic || isTouchingGround _vic};
		_vic engineOn false;
		_vic setFuel 0;
		sleep 10;
		{ deleteVehicle _x } forEach (crew _vic); deleteVehicle _vic;		 					 
	}   
};
 

_vic setFuel 1; 

//Sleep until CAS time is over
sleep 35;	
_vic setVariable["MissionComplete", true, true];


