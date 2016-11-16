private _fireTeam = [];
_group = createGroup AIS_Side; 
_group setCombatMode "BLUE"; 	

_mortars = [ 
	["B_T_Mortar_01_F",[5299.71,8960.83,6.79197],[[0,0.997023,0.0771034],[-0.0080009,-0.0771009,0.996991]],false],
	["B_T_Mortar_01_F",[5307.32,8951.01,6.70723],[[0,0.999772,-0.02133],[-0.0850248,0.0212528,0.996152]],false],
	["B_T_Mortar_01_F",[5318.33,8956.71,7.90646],[[0,0.997958,0.0638698],[-0.129565,-0.0633314,0.989546]],false],
	["B_T_Mortar_01_F",[5312.64,8968.25,7.9652],[[0,0.999304,0.0373063],[0.0239912,-0.0372956,0.999016]],false]
];

 _units = [_mortars, _group] call AIS_fnc_AddStaticWeapon;  
_fireTeam =	[_mortars, _units, _group, "8Rnd_82mm_Mo_shells", "Fire Team Mike", 3];

_fireTeam