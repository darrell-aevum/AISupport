private _vehicle = nil;
_group = createGroup AIS_Side; 
_group setCombatMode "BLUE";  
_vic = [		
		["B_CTRG_Heli_Transport_01_Tropic_F",[4399.4,9821.83,337.056],[[-0.992496,0.121103,0.0169213],[0.0119949,-0.0412935,0.999075]],false],		
		["B_T_Helipilot_F", "B_T_Helipilot_F"],
		["B_T_Soldier_F","B_T_Soldier_F"],
		["B_T_Soldier_F","B_T_Soldier_F","B_T_Soldier_F","B_T_Soldier_F","B_T_Soldier_F"],
		_group,
		"Angel 3-9",
		"reinforcement"
];

_vehicle = _vic call AIS_fnc_AddVehicle;	
_vehicle;