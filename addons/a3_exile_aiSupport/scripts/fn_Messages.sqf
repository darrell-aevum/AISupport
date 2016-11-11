AISupport_Message_FireSupport_Request = { 	 
	disableUserInput true;
	player playActionNow "Medic";			
	
	_message1 = format ["[%1] %2... %2...", (name player), AISupport_HQCallSign];
	_message2 = format ["[%1] This is %1.", (name player)];
	_message3 = format ["[%1] Requesting fire mission on my target. Over.", (name player)];
	if!(AISupport_DEBUG) then {
		["systemChatRequest", [_message1]] call ExileServer_system_network_send_broadcast; 
		sleep 1;
		["systemChatRequest", [_message2]] call ExileServer_system_network_send_broadcast; 
		sleep 1;
		["systemChatRequest", [_message3]] call ExileServer_system_network_send_broadcast; 
		sleep 3;
	}
	else {
		systemChat(_message1); 
		sleep 1;
		systemChat(_message2); 
		sleep 1;
		systemChat(_message3); 
		sleep 3;
	};

	disableUserInput false;	 
};

AISupport_Message_FireSupport_NoAvailableTeams = {
	_message1 = Format["[%1] %2...", AISupport_HQCallSign, name player];
	_message2 = format ["[%1] We cannot fire on your target at this time. Out.", AISupport_HQCallSign]; 

	if!(AISupport_DEBUG) then {
		["systemChatRequest", [_message1]] call ExileServer_system_network_send_broadcast; 
		sleep 1;
		["systemChatRequest", [_message2]] call ExileServer_system_network_send_broadcast;  
	}
	else {
		systemChat(_message1); 
		sleep 1;
		systemChat(_message2); 
	};

    ["ErrorTitleAndText", ["AI Support - Fire Mission", "There are no available fire teams at this time."]] call ExileClient_gui_toaster_addTemplateToast;
};

AISupport_Message_FireSupport_GetCoordinates = { 
	_message1 = format ["[%1] Roger %2... This is %1.", AISupport_HQCallSign, (name player)];
	_message2 = format ["[%1] What are the target's coordinates? Over.", AISupport_HQCallSign];

	if!(AISupport_DEBUG) then {
		["systemChatRequest", [_message1]] call ExileServer_system_network_send_broadcast; 
		sleep 1;
		["systemChatRequest", [_message2]] call ExileServer_system_network_send_broadcast;  
		sleep 1;
	}
	else {
		systemChat(_message1); 
		sleep 1;
		systemChat(_message2); 
		sleep 1;
	};

};

AISupport_Message_FireSupport_SendCoordinates = { 
	params["_position"];	
	_message1 = format ["[%1] %2, the target's position is: %3", (name player), AISupport_HQCallSign, _position];	

	if!(AISupport_DEBUG) then {
		["systemChatRequest", [_message1]] call ExileServer_system_network_send_broadcast; 		
	}
	else {
		systemChat(_message1); 		
	};

};

AISupport_Message_FireSupport_FiringOnSupportBase = {
	_message1 = format["[%1] Negative %2. We cannot fire that close to an AI Support base. Out.", AISupport_HQCallSign, (group player)];

	if!(AISupport_DEBUG) then {
		["systemChatRequest", [_message1]] call ExileServer_system_network_send_broadcast; 		
	}
	else {
		systemChat(_message1); 		
	};
	["errorToaster", "AI Support - Fire Mission", "Your target is too close to a support base."] call AISupport_fnc_SendMessage;				
};

AISupport_Message_FireSupport_OutOfRange = {
	_message1 = format ["[%1] %2...", AISupport_HQCallSign, (name player)];
	_message2 = format ["[%1] Your target is out of range of all available firebases. Out.", AISupport_HQCallSign];

	if!(AISupport_DEBUG) then {
		["systemChatRequest", [_message1]] call ExileServer_system_network_send_broadcast; 
		sleep 1;
		["systemChatRequest", [_message2]] call ExileServer_system_network_send_broadcast;  
	}
	else {
		systemChat(_message1); 
		sleep 1;
		systemChat(_message2); 		
	};
	["errorToaster", "AI Support - Fire Mission", "Your target is out of range of all firebases."] call AISupport_fnc_SendMessage;				
};

AISupport_Message_FireSupport_Firing = {
	params["_fireTeamCallSign", "_eta"];
   
	_message1 = format ["[%1] %2, this is %1. %3 is firing on your target. Out.", AISupport_HQCallSign, (name player), _fireTeamCallSign] remoteExecCall ["systemChat"];
	_message2 = format ["[%2] %3, this is %2 ETA to target is %1 seconds. Over.", (round _eta), _fireTeamCallSign, (name player)];
	_message3 = format ["[%3] Roger %2. Out.", _eta, _fireTeamCallSign, (name player)];

	if!(AISupport_DEBUG) then {
		["systemChatRequest", [_message1]] call ExileServer_system_network_send_broadcast; 
		sleep 4;
		["systemChatRequest", [_message2]] call ExileServer_system_network_send_broadcast;  
		sleep 2;
		["systemChatRequest", [_message3]] call ExileServer_system_network_send_broadcast;  
	}
	else {
		systemChat(_message1); 
		sleep 4;
		systemChat(_message2);
		sleep 2;
		systemChat(_message3);
	};
	["successToaster", "AI Support - Fire Mission", "Rounds are inbound on your target."] call AISupport_fnc_SendMessage;				
};
