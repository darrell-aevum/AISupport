private _fireTeam = [];
_group = createGroup AIS_Side; 
_group setCombatMode "BLUE"; 	

_mortars = [ 
["B_MBT_01_mlrs_F",[4479.85,9820.65,337.523],[[0.9989,-0.0389745,0.0260829],[-0.0279916,-0.0492579,0.998394]],false]
];

 _units = [_mortars, _group] call AIS_fnc_AddStaticWeapon;  
  
_fireTeam =	[_mortars, _units, _group, "12Rnd_230mm_rockets", "Fire Team Rico", 5];

_fireTeam

