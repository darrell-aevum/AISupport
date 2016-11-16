private _object = nil;
 
try
{
	diag_log format ["[AI SUPPORT] :: Adding Map Objects"];

	_object = (_this select 0) createVehicle [0,0,0];
	_object setPosASL (_this select 1);
	_object setVectorDirAndUp (_this select 2);
	_object allowDamage (_this select 3); 	
 
}
catch
{
	diag_log format ["AI SUPPORT  ERROR :: Calling AIS_fnc_AddObjects with invalid parameter: %1",_exception];
};

_object
