private _vehicle = nil;
_group = createGroup AIS_Side; 
_group setCombatMode "BLUE";  
_vic = [		
		["B_CTRG_Heli_Transport_01_Tropic_F",[4425.33,9801.63,335.874],[[-0.992564,0.121394,0.00897072],[0.0026744,-0.0519305,0.998647]],false],		
		["B_T_Helipilot_F", "B_T_Helipilot_F"],
		["B_T_Soldier_F","B_T_Soldier_F"],
		["B_T_Soldier_F","B_T_Soldier_F","B_T_Soldier_F","B_T_Soldier_F","B_T_Soldier_F"],
		_group,
		"Angel 3-9",
		"reinforcement"
];

_vehicle = _vic call AIS_fnc_AddVehicle;	
_vehicle;