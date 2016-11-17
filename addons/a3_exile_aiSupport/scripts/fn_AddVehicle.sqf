private _vehicle = [];

params
[
	"_vehicleProperties",
	"_drivers",
	"_gunners",
	"_crew",
	"_group",
	"_callSign",
	"_supportType",	
	["_special", "NONE"],
	["_wayPoints", []],
	["_randomizeWaypoints", false],
	["_isContinuous", false],
	["_resetTime", (60*60)]
] 
try
{
	diag_log format ["[AI SUPPORT] :: Adding Vehicles"];
	 	_origParams = [_vehicleProperties,_drivers,_gunners,_crew,_group,_callSign,_supportType,_special,_wayPoints,_randomizeWaypoints,_isContinuous,_resetTime];
 
		_vehicle = createVehicle [_vehicleProperties select 0,  _vehicleProperties select 1, [], 0, _special];		
		if(_special == "FLY") then { 
			_vehicle setVelocity [100, 0, 0]; 
		};
		if(_special == "NONE") then {
			_vehicle setPosASL (_vehicleProperties select 1);
			_vehicle engineOn false; 
		};
		_vehicle setVectorDirAndUp (_vehicleProperties select 2);
		_vehicle allowDamage (_vehicleProperties select 3);  
		_vehicle setFuel 1;
		_vehicle setdammage 0;
		_vehicle setVehicleLock "LOCKED"; 		 					

		if(!(isNil "_drivers")) then {				
			if(count _drivers > 0) then {
				_ai = _group createUnit [_drivers select 0, [0,0,0], [], 0, "CAN_COLLIDE"]; 
				_ai moveindriver _vehicle;

				if(count _drivers > 1) then {
					_ai = _group createUnit [_drivers select 1, [0,0,0], [], 0, "CAN_COLLIDE"]; 
					_ai moveInTurret [_vehicle, [0]]; 
				}
			}
		};
		if(!(isNil "_gunners")) then {
			{
				_ai = _group createUnit [_x, [0,0,0], [], 0, "CAN_COLLIDE"]; 
				_ai moveInTurret [_vehicle, [_forEachIndex + 1]];		
			}
			forEach _gunners;  	
		};
		if(!(isNil "_crew")) then {
			{ 
				_ai = _group createUnit [_crew select _forEachIndex, [0,0,0], [], 0, "CAN_COLLIDE"]; 
				_ai moveInCargo _vehicle;
				_ai setVariable ["isDeployable", true, true];
			}
			forEach _crew;  
		};

		if(count _wayPoints > 0) then {
			_wpsTemp = _wayPoints;

			while{count _wpsTemp > 0} do {
				_wpP =  _wpsTemp select floor random count _wpsTemp;
				_wp =_group addWaypoint [_wpP, 200];	
				_wp setWaypointBehaviour "COMBAT";
				_wp setWaypointCombatMode "BLUE"; 
				if(count _wpsTemp > 1) then {
					_wp setWaypointType "MOVE"
				}
				else {
					_wp setWaypointType "CYCLE"
				};	
				_wpsTemp = _wpsTemp - [_wpP];
			}; 

			_group setCurrentWaypoint [_group, 0];
		};
		
		_vehicle setVariable ["originalPosition", getPosASL _vehicle, true]; 
		_vehicle setVariable ["originalParameters", _origParams, true];
		_vehicle setVariable ["callSign", _callSign, true]; 
		_vehicle setVariable ["supportType", _supportType, true]; 
		_vehicle setVariable ["activeTime", 0, true];

		if(_isContinuous) then {
			_vehicle setVariable ["isContinuous", _isContinuous, true];
			_vehicle setVariable ["resetTime", _resetTime, true];
		};
}
catch
{
	diag_log format ["AI SUPPORT  ERROR :: Calling AIS_fnc_AddVehicles with invalid parameter: %1",_exception];
}; 

_vehicle;
