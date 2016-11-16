private _fireTeam = [];
_group = createGroup AIS_Side; 
_group setCombatMode "BLUE"; 	

_mortars = [
["B_MBT_01_mlrs_F",[4479.18,9806.45,336.743],[[0.998862,-0.0392932,0.0270446],[-0.0293202,-0.0585401,0.997854]],false] 
];

 _units = [_mortars, _group] call AIS_fnc_AddStaticWeapon;  
  
_fireTeam =	[_mortars, _units, _group, "12Rnd_230mm_rockets", "Fire Team Rico", 5];

_fireTeam

