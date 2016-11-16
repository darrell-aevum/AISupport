//////////////////////////////////////////////////////////////////
//                    Fire Mission Messages                      //
//////////////////////////////////////////////////////////////////

AIS_Message_FireSupport_Request = { 	 
	disableUserInput true;
	player playActionNow "Medic";			
	
	_message1 = format ["[%1] %2... %2...", (name player), AIS_HQCallSign];
	_message2 = format ["[%1] This is %1.", (name player)];
	_message3 = format ["[%1] Requesting fire mission on my target. Over.", (name player)];
 
	systemChat(_message1); 
	sleep 1;
	systemChat(_message2); 
	sleep 1;
	systemChat(_message3); 
	sleep 3;
 
	disableUserInput false;	 
};

AIS_Message_FireSupport_NoAvailableTeams = {
	_message1 = Format["[%1] %2...", AIS_HQCallSign, name player];
	_message2 = format ["[%1] We cannot fire on your target at this time. Out.", AIS_HQCallSign]; 

 
	systemChat(_message1); 
	sleep 1;
	systemChat(_message2); 
 

    ["ErrorTitleAndText", ["AI Support - Fire Mission", "There are no available fire teams at this time."]] call ExileClient_gui_toaster_addTemplateToast;
};

AIS_Message_FireSupport_GetCoordinates = { 
	_message1 = format ["[%1] Roger %2... This is %1.", AIS_HQCallSign, (name player)];
	_message2 = format ["[%1] What are the target's coordinates? Over.", AIS_HQCallSign];

 
	systemChat(_message1); 
	sleep 1;
	systemChat(_message2); 
	sleep 1;
 

};

AIS_Message_FireSupport_SendCoordinates = { 
	params["_position"];	
	_message1 = format ["[%1] %2, the target's position is: %3", (name player), AIS_HQCallSign, _position];	

 
	systemChat(_message1); 		
 

};

AIS_Message_FireSupport_FiringOnSupportBase = {
	_message1 = format["[%1] Negative %2. We cannot fire that close to an AI Support base. Out.", AIS_HQCallSign, (name player)];

 
	systemChat(_message1); 		
 
	["errorToaster", "AI Support - Fire Mission", "Your target is too close to a support base."] call AIS_fnc_SendMessage;				
};

AIS_Message_FireSupport_OutOfRange = {
	_message1 = format ["[%1] %2...", AIS_HQCallSign, (name player)];
	_message2 = format ["[%1] Your target is out of range of all available firebases. Out.", AIS_HQCallSign];
	 
	systemChat(_message1); 
	sleep 1;
	systemChat(_message2); 		
 
	["errorToaster", "AI Support - Fire Mission", "Your target is out of range of all firebases."] call AIS_fnc_SendMessage;				
};

AIS_Message_FireSupport_Firing = {
	params["_fireTeamCallSign", "_eta"];
   
	_message1 = format ["[%1] %2, this is %1. %3 is firing on your target. Out.", AIS_HQCallSign, (name player), _fireTeamCallSign];
	_message2 = format ["[%2] %3, this is %2. ETA to target impact is %1 seconds. Over.", (round _eta), _fireTeamCallSign, (name player)];
	_message3 = format ["[%3] Roger %2. Out.", _eta, _fireTeamCallSign, (name player)];

 
	systemChat(_message1); 
	sleep 4;
	systemChat(_message2);
	sleep 2;
	systemChat(_message3); 

	["successToaster", "AI Support - Fire Mission", "Rounds are inbound on your target."] call AIS_fnc_SendMessage;				
};

//////////////////////////////////////////////////////////////////
//                    Air Support Messages                      //
//////////////////////////////////////////////////////////////////

AIS_Message_AirSupport_Request = { 	 
	disableUserInput true;
	player playActionNow "Medic";			

	_message1 = format ["[%1] %2... %2...", (name player), AIS_HQCallSign];
	_message2 = format ["[%1] This is %1.", (name player)];
	_message3 = format ["[%1] Requesting air support at my position. Over.", (name player)];
	_message4 = format ["[%1] Roger %2.  Hang tight at your location. We will see if we have a bird available. Out.", AIS_HQCallSign, (name player)];

 
	systemChat(_message1); 
	sleep 1;
	systemChat(_message2); 
	sleep 1;
	systemChat(_message3); 
	sleep 3;
	systemChat(_message4);
	 
	disableUserInput false;	 
};

AIS_Message_AirSupport_NoAvailableTeams = { 

	_message1 = format ["[%1] %2, this is %1. Over.", AIS_HQCallSign, (name player)];
	_message2 = format ["[%1] Roger %2, this is %1. Over.", (name player), AIS_HQCallSign];
	_message3 = format ["[%1] %2, that's a negative on the air support. Over.", AIS_HQCallSign, (name player)];
	_message4 = format ["[%1] Copy %2. Out.", (name player), AIS_HQCallSign];

 
	sleep 4;
	systemChat(_message1); 
	sleep 2;
	systemChat(_message2); 
	sleep 2;
	systemChat(_message3); 
	sleep 3;
	systemChat(_message4);  

	["ErrorTitleAndText", ["AI Support - Air Support", "There are no available air support teams at this time."]] call ExileClient_gui_toaster_addTemplateToast;
};    

AIS_Message_AirSupport_InRoute = {
	params["_fireTeamCallSign"];

	_message1 = format ["[%1] %2, this is %1. Over.", AIS_HQCallSign, (name player)];	
	_message2 = format ["[%1] Roger %2, this is %1. Over.", (name player), AIS_HQCallSign];
	_message3 = format ["[%1] %2, we've got %3 inbound on your location. Over", AIS_HQCallSign, (name player), _fireTeamCallSign];
	_message4 = format ["[%1] Copy %2. Out.", (name player), AIS_HQCallSign];

 
		systemChat(_message1); 
		sleep 4;
		systemChat(_message2);
		sleep 2;
		systemChat(_message3);
		sleep 2;
		systemChat(_message4); 
};

AIS_Message_AirSupport_OnLocation = {
	params["_fireTeamCallSign"];

	_message1 = format ["[%1] %2, this is %1. We are on your position for support. Over.", _fireTeamCallSign, (name player)];	
	_message2 = format ["[%1] Roger %2. Out.", (name player), _fireTeamCallSign];
	 
		systemChat(_message1); 
		sleep 4;
		systemChat(_message2);
		sleep 2; 
};

AIS_Message_AirSupport_RTB = {
	params["_fireTeamCallSign"];

	_message1 = format ["[%1] %2, this is %1. We are low on fuel and returning to base. Over.", _fireTeamCallSign, (name player)];	
	_message2 = format ["[%1] Copy %2. Thanks for the support. Out.", (name player), _fireTeamCallSign];
 
		systemChat(_message1); 
		sleep 4;
		systemChat(_message2);
		sleep 2;   
};

//////////////////////////////////////////////////////////////////
//                   Reinforcements Messages                    //
//////////////////////////////////////////////////////////////////

AIS_Message_Reinforcements_Request = { 	 
	disableUserInput true;
	player playActionNow "Medic";			
 
	_message1 = format ["[%1] %2... %2...", (name player), AIS_HQCallSign];
	_message2 = format ["[%1] This is %1.", (name player)];
	_message3 = format ["[%1] Requesting reinforcements at my position. Over.", (name player)];
	_message4 = format ["[%1] Roger %2.  Hang tight at your location. We will see if we have a team available. Over.", AIS_HQCallSign, (name player)];

 
		systemChat(_message1); 
		sleep 1;
		systemChat(_message2); 
		sleep 1;
		systemChat(_message3); 
		sleep 3;
		systemChat(_message4); 

	disableUserInput false;	 
};

AIS_Message_Reinforcements_NoAvailableTeams = { 

	_message1 = format ["[%1] %2, this is %1. Over.", AIS_HQCallSign, (name player)];
	_message2 = format ["[%1] Roger %2, this is %1. Over.", (name player), AIS_HQCallSign];
	_message3 = format ["[%1] %2, that's a negative on the reinforcements. Over.", AIS_HQCallSign, (name player)];
	_message4 = format ["[%1] Copy %2. Out.", (name player), AIS_HQCallSign];

 
		sleep 4;
		systemChat(_message1); 
		sleep 2;
		systemChat(_message2); 
		sleep 2;
		systemChat(_message3); 
		sleep 3;
		systemChat(_message4);  
	["ErrorTitleAndText", ["AI Support - Reinforcements", "There are no available reinforcement insertion teams at this time."]] call ExileClient_gui_toaster_addTemplateToast;
};    

AIS_Message_Reinforcements_InRoute = {
	params["_fireTeamCallSign"];
	 
	_message1 = format ["[%1] %2, this is %1. Over.", AIS_HQCallSign, (name player)];	
	_message2 = format ["[%1] Roger %2, this is %1. Over.", (name player), AIS_HQCallSign];
	_message3 = format ["[%1] %2, we've got %3 inbound on your location with reinforcements.", AIS_HQCallSign, (name player), _fireTeamCallSign];
	_message4 = format ["[%1] They're gonna need some smoke once they get close to your AO. Over.", AIS_HQCallSign, _fireTeamCallSign];
	_message5 = format ["[%1] Copy %2. Out.", (name player), AIS_HQCallSign];

 
		sleep 8;
		systemChat(_message1); 
		sleep 2;
		systemChat(_message2);
		sleep 2;
		systemChat(_message3);
		sleep 2;
		systemChat(_message4);
		sleep 2;
		systemChat(_message5); 
};

AIS_Message_Reinforcements_OnLocation = {
	params["_fireTeamCallSign"];

	_message1 = format ["[%1] %2, this is %1. We see your smoke and are moving in for the insertion. Over.", _fireTeamCallSign, (name player)];	
	_message2 = format ["[%1] Roger %2. Out.", (name player), _fireTeamCallSign];
 
		systemChat(_message1); 
		sleep 4;
		systemChat(_message2);
		sleep 2; 
};

AIS_Message_Reinforcements_PopSmoke = {
	params["_fireTeamCallSign"];
 
	_message1 = format ["[%1] %2, this is %1. Over.", _fireTeamCallSign, (name player)];
	_message2 = format ["[%1] Roger %2. This is %1. Over.", (name player), _fireTeamCallSign];
	_message3 = format ["[%1] %2, Drop us some smoke on a good insertion point for these guys. Over.", _fireTeamCallSign, (name player)];
	_message4 = format ["[%1] Roger %2. Out.", (name player), _fireTeamCallSign];

 
		systemChat(_message1); 
		sleep 2;
		systemChat(_message2);
		sleep 2;  
		systemChat(_message3);
		sleep 2;  
		systemChat(_message4);
		sleep 2;   
};

AIS_Message_Reinforcements_PopSmoke_Again = {
	params["_fireTeamCallSign"];
 
	_message1 = format ["[%1] %2, pop smoke. Over.", _fireTeamCallSign, (name player)];
 
		systemChat(_message1);  
};

AIS_Message_Reinforcements_PopSmoke_LastTime = {
	params["_fireTeamCallSign"];
 
	_message1 = format ["[%1] God damnit %2, we are sitting ducks up here! Pop smoke or we are out of here. Over.", _fireTeamCallSign, (name player)];
	
 
		systemChat(_message1); 
};

AIS_Message_Reinforcements_PopSmoke_RTB = {
	params["_fireTeamCallSign"];
 
	_message1 = format ["[%1] %2, we are heading back to base. Out.", _fireTeamCallSign, (name player)];
	
	 
		systemChat(_message1);  
};