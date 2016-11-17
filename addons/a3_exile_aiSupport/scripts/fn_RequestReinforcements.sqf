 _canSupport = ["reinforcements"] call AIS_CanSupportPlayer;
 if(!_canSupport)
 	exitWith{  
		_supportLevel = [AIS_Reinforcements_SupportLevels] call AIS_GetPlayerSupportLevel;
		hint format["%1",_supportLevel];
		if(count _supportLevel <= 0) then {
			_minRespect = (AIS_Reinforcements_SupportLevels select 0) select 1;		
			["errorToaster", "AIS - Reinforcements", Format ["You do not have enoug respect to call for reinforcements. You need a minimum of %1 respect", _minRespect]] call AIS_fnc_SendMessage;
		} else {
			_level = _supportLevel select 0; 
			_minTabs = _supportLevel select 2;

			["errorToaster", "AIS - Reinforcements", Format ["You are at level %1 support. To call level %1 support, you need %2 poptabs.", _level, _minTabs]] call AIS_fnc_SendMessage;
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
		 
	call AIS_Message_Reinforcements_Request; 
    
	_canSupport = (count AIS_InactiveReinforcementTeams > 0);
 
	 if(!_canSupport)
		exitWith{  
			call AIS_Message_Reinforcements_NoAvailableTeams;
		};
	 
 	_inactiveTeam =  AIS_InactiveReinforcementTeams select floor random count AIS_InactiveReinforcementTeams; 	
	
	//Move from Inactive to Active...
	AIS_InactiveReinforcementTeams = AIS_InactiveReinforcementTeams - [_inactiveTeam];
	AIS_ActiveReinforcementTeams pushBack _inactiveTeam;
	
	_inactiveTeam setVariable ["assignedTo", player, true];
		
	publicVariable "AIS_InactiveReinforcementTeams";
	publicVariable "AIS_ActiveReinforcementTeams";
		
	_callSign = _inactiveTeam getVariable ["callSign", _inactiveTeam];
	

	[_inactiveTeam, getPosASL player] spawn AIS_fnc_SendReinforcements;  

	_callSign call AIS_Message_Reinforcements_InRoute;
