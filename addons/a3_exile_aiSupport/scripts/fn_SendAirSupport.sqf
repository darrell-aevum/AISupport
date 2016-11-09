try
{	
	_vehicle = _this select 0;	 
	_group = _vehicle getVariable "group";
	_name = _vehicle getVariable "callSign";
	_homePoint = _vehicle getVariable "originalPosition";
	_callSign = _vehicle getVariable ["callSign", _vehicle];

	if (isNull _vehicle) exitWith
    {
        diag_log format["AISupport ERROR :: Null _vehicle in AISupport_Reinforcements (index %1). Parameters: %2", _forEachIndex, AISupport_Reinforcements deleteAt _forEachIndex];
    };

    if !(alive _vehicle) exitWith
    { 
		format["HeliParatroopers_Monitor :: Heli died before it could reach drop point. Parameters: %1", DMS_vehicleParatrooper_Arr deleteAt _forEachIndex] call DMS_fnc_DebugLog;
    };  
	
	_vehicle engineOn true; 

	if(_vehicle getVariable ["isContinuous", false]) then {		
		_originalWaypoints = waypoints _group;
  
		{
			deleteWaypoint _x;
		} foreach (waypoints _group);
	};
	 	
	_wp = _group addWaypoint [position player, 0];	
	_wp setWaypointBehaviour "COMBAT";
	_wp setWaypointCombatMode "RED"; 
	_wp setWaypointType "SAD";
	_group setCurrentWaypoint _wp;

	_playerGroup = group player;

 	_vehicle allowDamage (true);  
	{
 		_x allowDamage (true); 
	} forEach crew _vehicle; 

 	waitUntil{(_vehicle distance2D (getPos player)) <= 550}; 
	_wp setWaypointCombatMode "RED"; 

 	_vehicle allowDamage (true);  
	{
 		_x allowDamage (true); 
	} forEach crew _vehicle; 	    

	format ["[%2] %1, this is %2. We are on your position for support. Over.", (group player), _callSign] remoteExecCall ["systemChat"];
	sleep 2;
	format ["[%1] Roger %2. Out.", (group player), _callSign] remoteExecCall ["systemChat"];

	[(driver _vehicle)] joinSilent (group player);	



	[_vehicle] spawn {
		params["_vehicle"];
		_count = 0; 
		while{_count < 300} do { 	 
			{_vehicle reveal _x} forEach allUnits;
			{player reveal _x} forEach allUnits;
			_target = _vehicle findNearestEnemy _vehicle; 
			if(isNull _target) then {
				_target = player findNearestEnemy player; 
			};
			if(isNull _target) then {
				_target = (driver _vehicle) findNearestEnemy _vehicle; 
			};
			if(isNull _target) then {
				_target = (driver _vehicle) findNearestEnemy (position player); 
			};
			if(isNull _target) then {
				_target = cursorTarget;
				if(side _target != sideEnemy) then { 
					_target = _vehicle findNearestEnemy _vehicle;
				};
			};
			if!(isNull _target) then { 
				{			
					_vehicle reveal [_x,1];
					_vehicle doTarget _x; 
					_vehicle doFire _x; 
				}
				foreach units group _target;
			};
			sleep 1;
			_count = _count + 1;
		};
	};
 
	
	sleep 300;
	[(driver _vehicle)] joinSilent _group;	

	if(!alive _vehicle)
		exitWith{
			_vehicle setVariable ["missionComplete",true];
		};

	format ["[%2] %1, we are low on fuel and are returnign to base. Over.", (group player), _callSign] remoteExecCall ["systemChat"];
	sleep 2;
	format ["[%1] Copy %2. Thanks for the support. Out.", (group player), _callSign] remoteExecCall ["systemChat"];

	if(_vehicle getVariable ["isContinuous", false])
		exitWith{  
			_vehicle setVariable ["missionComplete",true];
			deleteWaypoint _wp;
			{
				_group addWaypoint _x;				
			} foreach _originalWaypoints;
			_group setCurrentWaypoint [_group, 0];
		}; 

	_vehicle setBehaviour "COMBAT";
	_vehicle setCombatMode "GREEN";
	_vehicle setFormation "LINE"; 

	_vehicle land "NONE"; 	
	_vehicle move (_homePoint); 
	sleep 3;

	while { ( (alive _vehicle) && !(unitReady _vehicle) ) } do
	{
			sleep 1;
	};

	if (alive _vehicle) then
	{
			_vehicle land "LAND";
			waitUntil {isTouchingGround _vehicle};
			sleep 5; 
 
			_vehicle setVariable ["missionComplete",true];
	}  
 }
catch
{	
	diag_log format ["AI SUPPORT ERROR :: Calling AISupport_fnc_RequestReinforcements with error: %1",_exception];
}