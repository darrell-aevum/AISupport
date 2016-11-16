private _at = [];
 
if !(params
[ 
	"_airAssaultTeam",
	"_name" 
])
exitWith
{
	diag_log format ["AI SUPPORT ERROR :: Calling AIS_fn_CreateFireTeam with invalid parameters: %1",_this];
	false;
};
 
try
{
	diag_log format ["[AI SUPPORT] :: Creating Air Assault Team"]; 	
	_vehicle = _airAssaultTeam select 0;
	_group = _airAssaultTeam select 1;
 
	_at = [_vehicle, _group, _name, getPosATL _vehicle];  
}
catch
{
	diag_log format ["AI SUPPORT  ERROR :: Calling AIS_fnc_AddObjects with invalid parameter: %1",_exception];
}; 

_at
