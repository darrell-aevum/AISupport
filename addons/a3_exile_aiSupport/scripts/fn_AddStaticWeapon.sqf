private _returnValue = [];

params
[	
	"_fireTeamProperties",
	"_group",
	["_type", "mortar"]
]

try
{ 
	diag_log format ["[AI SUPPORT] :: Adding Static Weapon"];	
  
	{ 
		_object = (_x select 0) createVehicle [0,0,0];
		_object setPosASL (_x select 1);
		_object setVectorDirAndUp (_x select 2);
		_object allowDamage (_x select 3); 

		_gunner = _group createUnit ["I_Crew_F", [0,0,0], [], 0, "CAN_COLLIDE"]; 
 
		_gunner moveingunner _object;	
	  
		_gunner allowDamage (_x select 3);

		_returnValue pushBack _object;	
	}
	forEach _fireTeamProperties;  		
 
}
catch
{
	diag_log format ["AI SUPPORT  ERROR :: Calling AIS_fnc_AddStaticWeapons with invalid parameter: %1",_exception];
};

_returnValue
