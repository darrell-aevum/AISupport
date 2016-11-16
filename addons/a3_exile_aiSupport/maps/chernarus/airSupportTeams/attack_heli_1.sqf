private _vehicle = nil;
_group = createGroup AIS_Side; 
_group setCombatMode "RED"; 	
_vic = [  
		["B_Heli_Attack_01_F",[4441,9867.76,338.508],[[-0.593138,0.805001,0.0127056],[-0.00933489,-0.0226567,0.9997]],false],		
		["B_T_Helipilot_F","B_T_Helipilot_F"],
		[],
		[],
		_group,
		"Lightning 3-3",
		"attack"
	];

_vehicle = _vic call AIS_fnc_AddVehicle;	
_vehicle;