private _vehicle = nil;
_group = createGroup AIS_Side; 
_group setCombatMode "BLUE";  
_vic = [
		["B_CTRG_Heli_Transport_01_Tropic_F",[4395.38,9785.56,335.484],[[-0.999586,0.0183137,0.0221781],[0.02133,-0.0452764,0.998747]],false], 
		["B_T_Helipilot_F", "B_T_Helipilot_F"],
		["B_T_Soldier_F","B_T_Soldier_F"],
		["B_T_Soldier_F","B_T_Soldier_F","B_T_Soldier_F","B_T_Soldier_F","B_T_Soldier_F"],
		_group,
		"Angel 3-9",
		"reinforcement"
];

_vehicle = _vic call AIS_fnc_AddVehicle;	
_vehicle;