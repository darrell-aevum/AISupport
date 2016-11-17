private _vehicle = nil;
_group = createGroup AIS_Side; 
_group setCombatMode "BLUE"; 	
_vic =	[
		["B_PLANE_CAS_01_F", [11916,2936,4.86],[[-0.799266,0.600977,0],[0,0,1]],false], 
		["B_T_Pilot_F"],
		[],
		[],
		_group,
		"Vegas 1-1",
		"attack",
		"FLY",
		[
			[12552,14110],
			[9392.43,12143.5],
			[14426.6,9056.18],
			[10473.4,6884.78],
			[5923.08,7769.8],
			[5398.05,14654],
			[1372.77,9189.96],
			[2083.11,2387.62],
			[12830.9,1862.78]
		],
		true,
		true,
		180  
];   
  
_vehicle = _vic call AIS_fnc_AddVehicle;	
_vehicle;