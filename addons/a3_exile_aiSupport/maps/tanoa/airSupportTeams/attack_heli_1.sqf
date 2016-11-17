private _vehicle = nil;
_group = createGroup AIS_Side; 
_group setCombatMode "BLUE"; 	
_vic = [ 
		["B_Heli_Attack_01_F",[9950.76,9490.35,112.375],[[-0.618824,-0.785077,0.0266592],[-0.0346456,0.0611822,0.997525]],false], 
		["B_T_Helipilot_F","B_T_Helipilot_F"],
		[],
		[],
		_group,
		"Lightning 3-3",
		"attack"
	];

_vehicle = _vic call AIS_fnc_AddVehicle;	
_vehicle;