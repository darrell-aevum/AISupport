params ["_delay"];
 
while{true} do
{  
	waitUntil{!isNil "AIS_ActiveAirSupportUnits"};
	_readdUnit = {		
		params["_vehicle"]; 		
		_origParams = _vehicle getVariable "originalParameters";
		AIS_ActiveAirSupportUnits = AIS_ActiveAirSupportUnits - [_vehicle];
		publicVariable "AIS_ActiveAirSupportUnits";
			    
		sleep floor random[45, 120, 240];
		{
			deleteVehicle _x; 
		} forEach crew _vehicle; 
		
		{
			deleteWaypoint _x;
		} foreach (waypoints group _vehicle);

		deleteVehicle _vehicle; 

		deleteGroup group _vehicle;
		
		_group = createGroup AIS_Side; 
		_group setCombatMode "BLUE"; 
		_origParams set [4, _group];

		_newVehicle = _origParams call AIS_fnc_AddVehicle;			
		vic land "NONE";
		vic engineOn false;  
		
		AIS_InactiveAirSupportUnits pushBack _newVehicle;
		publicVariable "AIS_InactiveAirSupportUnits";
	};
 

	{
		_isContinuous = _x getVariable ["isContinuous", false];
		_activeTime = _x getVariable ["activeTime", 0];
		if(!(_isContinuous) && (_activeTime > AIS_MaxActiveTimeForVehicles)) exitWith {
			[_x] spawn _readdUnit; 
		};

		if(!alive (driver _x) || !alive _x) exitWith {
			[_x] spawn _readdUnit;			
		};
		if((_x getVariable ["missionComplete", false])) exitWith {
			if!(_isContinuous) exitWith {
				[_x] spawn _readdUnit; 
			};

			_resetTime = _x getVariable ["resetTime", (60 * 60)];			
			
			if(resetTime <= 0) exitWith {
				[_x] spawn _readdUnit;
			};
			 			
			_x setVariable ["resetTime", (_resetTime - _delay)];		
		};	

		_activeTime = _activeTime + _delay;
	}
	foreach	AIS_ActiveAirSupportUnits; 

	sleep _delay;
};