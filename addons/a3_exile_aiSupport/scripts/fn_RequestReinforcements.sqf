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

	disableUserInput true;
	player playActionNow "Medic";
	format ["[%1] Pegasus 6... Pegasus 6...", (group player)] remoteExecCall ["systemChat"]; 
	sleep 1;
	format ["[%1] This is %1.", (group player)] remoteExecCall ["systemChat"];
	sleep 1;
	format ["[%1] Requesting reinforcement insertion at location [%2, %3]. Over.", (group player), (position player select 1), (position player select 2)] remoteExecCall ["systemChat"];
	sleep 3;	 
	format ["[Pegasus 6] Roger %1.  Hang tight at your location. We will see if we have a team available. Over.", (group player)] remoteExecCall ["systemChat"];
	disableUserInput false;

 _canSupport = (count AISupport_InactiveAirInsertionTeams > 0);
 
 if(!_canSupport)
	exitWith{  
		sleep 4;
		format ["[Pegasus 6] %1, this is Pegasus 6. Over.", (group player)] remoteExecCall ["systemChat"];
		sleep 2;
		format ["[%1] Roger Pegasus 6, this is %1. Over.", (group player)] remoteExecCall ["systemChat"];
		sleep 2;
		format ["[Pegasus 6] %1, that's a negative on the reinforcements. Over.", (group player)] remoteExecCall ["systemChat"];
		sleep 3;
		format ["[%1] Copy Pegasus 6. Out.", (group player)] remoteExecCall ["systemChat"];
		["ErrorTitleAndText", ["AI Support - Reinforcements", "There are no available reinforcement insertion teams at this time."]] call ExileClient_gui_toaster_addTemplateToast;
	};
	 
 	_inactiveTeam =  AISupport_InactiveAirInsertionTeams select floor random count AISupport_InactiveAirInsertionTeams; 	

	//Move from Inactive to Active...
	AISupport_InactiveAirInsertionTeams = AISupport_InactiveAirInsertionTeams - [_inactiveTeam];
	AISupport_ActiveAirInsertionTeams pushBack _inactiveTeam;
	 
	_callSign = _inactiveTeam getVariable ["callSign", _inactiveTeam];

	sleep 8;
	format ["[Pegasus 6] %1, this is Pegasus 6. Over.", (group player)] remoteExecCall ["systemChat"];
	sleep 2;
	format ["[%1] Roger Pegasus 6, this is %1. Over.", (group player)] remoteExecCall ["systemChat"];
	sleep 2;
	format ["[Pegasus 6] %1, we've got %2 inbound on your location with reinforcements.", (group player), _callSign] remoteExecCall ["systemChat"];
	sleep 2;
	format ["[Pegasus 6] They're gonna need some smoke once they get close to your AO. Over.", (group player), _callSign] remoteExecCall ["systemChat"];
	sleep 2;
	format ["[%1] Copy Pegasus 6. Out.", (group player)] remoteExecCall ["systemChat"];

 
	[_inactiveTeam, getPosASL player] spawn AISupport_fnc_SendReinforcements;  