/*
	AIS_fnc_AddPlayerActions
	Created by DHarvey44

	Usage:
	[player] spawn AIS_fnc_AddPlayerActions
	//or
	player spawn AIS_fnc_AddPlayerActions;

	This function will add actions to the player.
*/
 
	playerActions = player getVariable ["actions", []];      
	 
	if(!alive player) 
		exitWith{
 			{
				player removeAction _x;
			} foreach playerActions;
		}; 

 
	if(count playerActions <= 0) then { 
		
		playerAction = player addAction [
			"Open AI Support", 
			{call AIS_Client_fnc_OpenDialog},
			[],
			1.5,
			false
		];

		playerActions pushBack playerAction; 
	};

	player setVariable ["actions", playerActions]; 	 	
	

