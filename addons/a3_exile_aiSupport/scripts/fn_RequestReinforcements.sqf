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

 _canSupport = (count AISupport_InactiveAirInsertionTeams > 0);
 
 if(!_canSupport)
	exitWith{  
		call AISupport_Message_Reinforcements_NoAvailableTeams;
	};
	 
 	_inactiveTeam =  AISupport_InactiveAirInsertionTeams select floor random count AISupport_InactiveAirInsertionTeams; 	

	//Move from Inactive to Active...
	AISupport_InactiveAirInsertionTeams = AISupport_InactiveAirInsertionTeams - [_inactiveTeam];
	AISupport_ActiveAirInsertionTeams pushBack _inactiveTeam;
	 
	_callSign = _inactiveTeam getVariable ["callSign", _inactiveTeam];

	_callSign call AISupport_Message_Reinforcements_InRoute;
 
	[_inactiveTeam, getPosASL player] spawn AISupport_fnc_SendReinforcements;  