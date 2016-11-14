private _vehicle = nil;
_group = createGroup RESISTANCE; 
_group setCombatMode "RED"; 		
_vic =	[ 
		["B_CTRG_Heli_Transport_01_Tropic_F",[4463.86,9882.48,338.919],[[-0.507088,0.861888,0.00331182],[-0.00933489,-0.00933432,0.999913]],false],		
		["B_T_Helipilot_F","B_T_Helipilot_F"],
		["B_T_Soldier_F","B_T_Soldier_F"],
		[],
		_group,
		"Scorpion 2-1",
		"attack"
]; 

_vehicle = _vic call AISupport_fnc_AddVehicle;	
_vehicle;