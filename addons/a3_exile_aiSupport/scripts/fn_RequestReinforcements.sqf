 _canSupport = ["reinforcements"] call AIS_CanSupportPlayer;
 if(!_canSupport)
 	exitWith{  
		_supportLevel = [AIS_Reinforcements_SupportLevels] call AIS_GetPlayerSupportLevel;
		hint format["%1",_supportLevel];
		if(count _supportLevel <= 0) then {
			_minRespect = (AIS_Reinforcements_SupportLevels select 0) select 1;		
			["errorToaster", "AIS - Reinforcements", Format ["You do not have enoug respect to call for reinforcements. You need a minimum of %1 respect", _minRespect]] call AISupport_fnc_SendMessage;
		} else {
			_level = _supportLevel select 0; 
			_minTabs = _supportLevel select 2;

			["errorToaster", "AIS - Reinforcements", Format ["You are at level %1 support. To call level %1 support, you need %2 poptabs.", _level, _minTabs]] call AISupport_fnc_SendMessage;
		};
	};

	_requiredItems = _this select 0; 

	_smoke = true;
	if!(isNil "_requiredItems") then { 
		{
			if!(_x call IsItemInInventory) then {
				_smoke = false;
			};

		}foreach _requiredItems;  
	};  

	if(!_smoke)
		exitWith{
			["ErrorTitleAndText", ["AI Support - Reinforcements", "You need a smoke grenade to call in reinforcements."]] call ExileClient_gui_toaster_addTemplateToast;
		};
		 
	call AISupport_Message_Reinforcements_Request; 

	_playerTabs = player getVariable ["ExileLocker", 0];
	_playerRespect = player getVariable ["ExileScore", 0];

	if!(isDedicated) then {
		_playerTabs = 100;
		_playerRespect =  100;
	};

	_minCost = AIS_FireMission_MinPopTabs;
	_minRespect = AIS_FireMission_MinRespect;

	if(AIS_FireMission_RespectInfluencesCost) then {
		{
			_respect = _x select 0;
			_cost = _x select 1;
			if(_playerRespect <= _respect) then {
				_minCost = _cost;
			};									;
		} foreach AIS_FireMission_CostPerRespect;			
	};
	if(_playerTabs < _minCost || _playerRespect < _minRespect)
		exitWith {
			["ErrorTitleAndText", [format["AI Support - Reinforcements", "You need at least %1 PopTabs and %2 respect to call in reinforcements.", _minCost, _minRespect]]] call ExileClient_gui_toaster_addTemplateToast;
		};

 _canSupport = (count AISupport_InactiveReinforcementTeams > 0);
 
 if(!_canSupport)
	exitWith{  
		call AISupport_Message_Reinforcements_NoAvailableTeams;
	};
	 
 	_inactiveTeam =  AISupport_InactiveReinforcementTeams select floor random count AISupport_InactiveReinforcementTeams; 	

	//Move from Inactive to Active...
	AISupport_InactiveReinforcementTeams = AISupport_InactiveReinforcementTeams - [_inactiveTeam];
	AISupport_ActiveReinforcementTeams pushBack _inactiveTeam;
	 
	_callSign = _inactiveTeam getVariable ["callSign", _inactiveTeam];

	_callSign call AISupport_Message_Reinforcements_InRoute;
 
	[_inactiveTeam, getPosASL player] spawn AISupport_fnc_SendReinforcements;  