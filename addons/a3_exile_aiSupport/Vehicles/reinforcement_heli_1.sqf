private _vehicle = nil;
_group = createGroup AIS_Side; 
_group setCombatMode "BLUE";  
_vic = [
		["B_CTRG_Heli_Transport_01_tropic_F",[9968.91,9512.88,111.199],[[-0.619141,-0.782949,0.0604692],[0.0133317,0.0665123,0.997697]],false], 
		["B_T_Helipilot_F", "B_T_Helipilot_F"],
		["B_T_Soldier_F","B_T_Soldier_F"],
		["B_T_Soldier_F","B_T_Soldier_F","B_T_Soldier_F","B_T_Soldier_F","B_T_Soldier_F"],
		_group,
		"Angel 3-9",
		"reinforcement"
];

_vehicle = _vic call AIS_fnc_AddVehicle;	
_vehicle;