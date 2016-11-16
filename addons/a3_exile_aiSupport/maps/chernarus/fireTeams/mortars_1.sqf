private _fireTeam = [];
_group = createGroup AIS_Side; 
_group setCombatMode "BLUE"; 	

_mortars = [
	["B_Mortar_01_F",[4434.63,9746,333.421],[[-0.37641,0.925886,0.0324094],[0.0106693,-0.0306477,0.999473]],false],
	["B_Mortar_01_F",[4443.03,9748.32,333.413],[[-0.376379,0.92595,0.0309076],[0.00666787,-0.0306526,0.999508]],false],
	["B_Mortar_01_F",[4444.71,9741.79,333.207],[[-0.376446,0.926039,0.0272021],[0.00665928,-0.0266565,0.999622]],false],
	["B_Mortar_01_F",[4436.55,9739.47,333.21],[[-0.376366,0.925987,0.0299394],[0.0106641,-0.0279835,0.999551]],false]
];

 _units = [_mortars, _group] call AIS_fnc_AddStaticWeapon;  
_fireTeam =	[_mortars, _units, _group, "8Rnd_82mm_Mo_shells", "Fire Team Echo", 3];

_fireTeam

