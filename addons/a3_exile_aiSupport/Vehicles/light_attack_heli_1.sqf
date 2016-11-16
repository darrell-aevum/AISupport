private _vehicle = nil;
_group = createGroup AIS_Side; 
_group setCombatMode "RED"; 		
_vic =	[
		["B_CTRG_Heli_Transport_01_tropic_F",[9920.53,9515.71,111.459],[[-0.656907,-0.75314,0.0354112],[-0.0133317,0.0585614,0.998195]],false], 
		["B_T_Helipilot_F","B_T_Helipilot_F"],
		["B_T_Soldier_F","B_T_Soldier_F"],
		[],
		_group,
		"Scorpion 2-1",
		"attack"
]; 

_vehicle = _vic call AIS_fnc_AddVehicle;	
_vehicle;