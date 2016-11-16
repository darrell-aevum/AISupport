private _fireTeam = [];
_group = createGroup AIS_Side; 
_group setCombatMode "BLUE"; 	

_mortars = [
	["B_T_Mortar_01_F",[9967.81,9467.05,113.999],[[-0.710826,0.702176,-0.0409288],[0.0239937,0.0823628,0.996314]],false],
	["B_T_Mortar_01_F",[9973.88,9473.25,113.352],[[-0.608162,-0.793632,0.0169298],[0,0.0213272,0.999773]],false],
	["B_T_Mortar_01_F",[9900.45,9534.59,110.762],[[0.738605,-0.674126,-0.004045],[0.0346456,0.0319657,0.998888]],false],
	["B_T_Mortar_01_F",[9894.64,9528.15,110.815],[[0.575221,0.817998,-0.000815514],[-0.0213272,0.015994,0.999645]],false]
];

 _units = [_mortars, _group] call AIS_fnc_AddStaticWeapon;  
_fireTeam =	[_mortars, _units, _group, "8Rnd_82mm_Mo_shells", "Fire Team Echo", 3];

_fireTeam