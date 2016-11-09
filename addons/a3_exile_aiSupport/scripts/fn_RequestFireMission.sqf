private _added = false;  

try
{  
	disableUserInput true;
	player playActionNow "Medic";
	format ["[%1] Firebase Alpah... Firebase Alpha...", (group player)] remoteExecCall ["systemChat"]; 
	sleep 1;
	format ["[%1] This is %1.", (group player)] remoteExecCall ["systemChat"];
	sleep 1;
	format ["[%1] Requesting Firemision on my target. Over.", (group player)] remoteExecCall ["systemChat"];
	sleep 3;	

disableUserInput false;	 

 _canSupport = (count AISupport_InactiveFireTeams > 0);
 
 if(!_canSupport)
	exitWith{   
		Format["[Firebase Alpha] %1...", group player] remoteExecCall ["systemChat"];
		sleep 1;
		format ["[Firebase Alpha] We cannot fire on your target at this time. Out."] remoteExecCall ["systemChat"];			
		["ErrorTitleAndText", ["AI Support - Fire Mission", "There are no available fire teams at this time."]] call ExileClient_gui_toaster_addTemplateToast;
	}; 
		 
	format ["[Firebase Alpha] Roger %1... This is Firebase Alpha.", (group player)] remoteExecCall ["systemChat"];
 	sleep 1;
	format ["[Firebase Alpha] What are the target's coordinates? Over."]  remoteExecCall ["systemChat"];
 	sleep 1; 	

	_fireTeam =  AISupport_InactiveFireTeams select floor random count AISupport_InactiveFireTeams; 
	


	//Move from Inactive to Active...
	AISupport_InactiveFireTeams = AISupport_InactiveFireTeams - [_fireTeam];
	AISupport_ActiveFireTeams pushBack _fireTeam;
	
    openMap true;

	_fireTeam onMapSingleClick {
		openMap false; 
		[_pos, _this, 3] spawn AISupport_fnc_SendFireMission; 
		onMapSingleClick{};
	};	
}
catch
{
	diag_log format ["AI SUPPORT  ERROR :: Calling AISupport_fn_RequestFireMission with invalid parameter: %1",_exception];
};