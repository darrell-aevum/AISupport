private _fireTeam = [];
_group = createGroup RESISTANCE; 
_group setCombatMode "BLUE"; 	

_mortars = [
	["B_MBT_01_mlrs_F",[9813.43,9454.47,117.07],[[0,1,0],[0,0,1]],false]
];

 _units = [_mortars, _group] call AISupport_fnc_AddStaticWeapon;  
  
_fireTeam =	[_mortars, _units, _group, "12Rnd_230mm_rockets", "Fire Team Rico", 5];

_fireTeam
