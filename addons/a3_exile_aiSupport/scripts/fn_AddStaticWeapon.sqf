private _returnValue = [];

params
[	
	"_fireTeamProperties",
	"_group"
]

try
{ 
	diag_log format ["[AI SUPPORT] :: Adding Static Weapon"];	
  
	{ 
		_object = (_x select 0) createVehicle [0,0,0];
		_object setPosASL (_x select 1);
		_object setVectorDirAndUp (_x select 2);
		_object allowDamage (_x select 3); 

		_gunner = _group createUnit ["B_T_Soldier_F", [0,0,0], [], 0, "CAN_COLLIDE"]; 
		_gunner moveingunner _object;	
		_gunner allowDamage (_x select 3);

		_returnValue = _returnValue + [[_object, _gunner, _group]];	
	}
	forEach _fireTeamProperties;  		
 
}
catch
{
	diag_log format ["AI SUPPORT  ERROR :: Calling AISupport_fnc_AddStaticWeapons with invalid parameter: %1",_exception];
};

_returnValue
