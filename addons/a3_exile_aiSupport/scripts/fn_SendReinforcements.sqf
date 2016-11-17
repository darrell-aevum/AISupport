try
{	
	vic = (_this select 0);	
	smokeOut = false;
	[vic] spawn {
		params["_vic"];
		while{alive _vic && !(_vic getVariable ["missionComplete", false]) && alive player} do {
			sleep 2;
		};
		_vic setVariable ["missionComplete",true, true];
		_vic setVariable ["assignedTo", nil, true]; 
		
		{
			deleteWaypoint _x;
		} foreach (waypoints group _vic);
		
		vic land "NONE";
		vic engineOn false; 

		if!(alive _vic) then {		
			["ErrorTitleAndText", ["AI Support - Reinforcements", "Your reinforcements were shot down. Hopefully your guys got out before they blew up."]] call ExileClient_gui_toaster_addTemplateToast;		
		};
	};
    _group = group vic;  
	_homePoint = vic getVariable "originalPosition";
	_callSign = vic getVariable ["callSign", vic];

	if (isNull vic) exitWith
    {
        diag_log format["AISupport ERROR :: Null vic in AIS_Reinforcements (index %1). Parameters: %2", _forEachIndex, AIS_Reinforcements deleteAt _forEachIndex];
    };

    if !(alive vic) exitWith
    { 
		
    }; 

	vic engineOn true; 

	if(vic getVariable ["isContinuous", false]) then {		
		_originalWaypoints = waypoints _group;
  
		{
			deleteWaypoint _x;
		} foreach (waypoints _group);
	};
	 	
	_wp = _group addWaypoint [position player, 0];	
	_wp setWaypointBehaviour "COMBAT";
	_wp setWaypointCombatMode "GREEN"; 
	_wp setWaypointType "MOVE";
	_group setCurrentWaypoint _wp;

	_playerGroup = group player;
	  
	_reinforcementRequest = player addEventHandler ["Fired", {  
		switch (_this select 4) do {
			case "SmokeShellRed";
			case "SmokeShellGreen";
			case "SmokeShellYellow";
			case "SmokeShellPurple";
			case "SmokeShellBlue";
			case "SmokeShellOrange";
			case "SmokeShell": { 		   
				[_this select 6] spawn {
					_smoke = _this select 0;  				
					sleep 2;
					smokeOut = true; 		
					[vic , 25, (getPosASL _smoke)] call AR_Rappel_All_Cargo;
				}
			};    
			default {  };
		};
	}];
	
 	waitUntil{(vic distance2D (getPos player)) <= 750};  
 	vic allowDamage (true);  
	{
 		_x allowDamage (true); 
	} forEach crew vic; 
	 

	_doHeliIntro = true;
	if(!smokeOut) then {
		_doHeliIntro = false;
			_callSign call AIS_Message_Reinforcements_PopSmoke;
		};
		_count = 1;
		_continueWithMission = true;
		while{!smokeOut && (alive vic)} do {
			sleep 10;
			if(smokeOut)
				exitWith{true};
			if(!(alive vic) || !(alive player) || !(alive (driver vic)))
				exitWith{_continueWithMission = false};

			if(_count == 1) then {
				_callSign call AIS_Message_Reinforcements_PopSmoke_Again;
			};
			if(_count == 2) then {
				_callSign call AIS_Message_Reinforcements_PopSmoke_Again;
			};
			if(_count == 3) then {
				_callSign call AIS_Message_Reinforcements_PopSmoke_LastTime;
			};
			if(_count == 4) then {
				_continueWithMission = false;
				_callSign call AIS_Message_Reinforcements_PopSmoke_RTB;
				["ErrorTitleAndText", ["AI Support - Reinforcements", "The insertion team is returning to base because they couldn't locate your smoke."]] call ExileClient_gui_toaster_addTemplateToast;
				vic land "NONE"; 	
				_group setCombatMode "BLUE";
				vic move (_homePoint); 
				sleep 3;

				while { ( (alive vic) && !(unitReady vic) ) } do
				{
						sleep 1;
				};

				if (alive vic) then
				{
						vic land "LAND";
						waitUntil {isTouchingGround vic};
						sleep 10;
						_activeSupportUnits = player getVariable ["ActiveSupportUnits", []];
						_activeSupportUnits = _activeSupportUnits - [vic];
						player setVariable ["ActiveSupportUnits", _activeSupportUnits];
						vic setVariable ["missionComplete",true, true];
						vic setVariable ["assignedTo", nil, true];
						
				}; 	
			};
			_count = _count + 1;
	};
	player removeEventHandler ["Fired", _reinforcementRequest];
	if(!_continueWithMission)
		exitWith{
		
		};
 
   if(alive vic) then {
	_callSign call AIS_Message_Reinforcements_OnLocation;
   };
	sleep 5; 
	if(alive vic) then {
		_rappelling = vic getVariable "AR_Units_Rappelling";
		while {!isNil "_rappelling"} do {
			_rappelling = vic getVariable "AR_Units_Rappelling";
			sleep 1;
		};  
		
		{
			_teamMembers = player getVariable ["teamMembers", []];
								
			if(!isPlayer _x) then {
				_teamMembers pushBack _x;
				_x setVariable ["assignedTo", player, true];
				AIS_ActiveReinforcementTeams pushBack _x;
				publicVariable "AIS_ActiveReinforcementTeams";
			};

			_teamMembers = player setVariable ["teamMembers", _teamMembers];
		} foreach (units group player);
	};

	(group player) setBehaviour "COMBAT";
	(group player) setCombatMode "RED";

	deleteWaypoint _wp;
	vic land "NONE"; 	
	vic move (_homePoint); 
	sleep 3;
	
	if(alive vic) then {
		waitUntil{(vic distance2D (_homePoint)) < 500};  
		_group setCombatMode "BLUE"; 
	 };

	while { ( (alive vic) && !(unitReady vic) ) } do
	{
			sleep 1;
	};

	if (alive vic) then
	{
			vic land "LAND";
	
			waitUntil {isTouchingGround vic}; 
			sleep 10; 
			vic setVariable ["missionComplete",true, true];
			vic setVariable ["assignedTo", nil, true];
	}; 	
 }
catch
{	
	diag_log format ["AI SUPPORT ERROR :: Calling AIS_fnc_RequestReinforcements with error: %1",_exception];
}