private _vehicle = [];

if !(params
[
	"_vehicle"
])
exitWith
{
	diag_log format ["AI SUPPORT ERROR :: Calling AIS_fnc_AddVehicles with invalid parameters: %1",_this];
	false;
};
 
try
{
 
}
catch
{
	diag_log format ["AI SUPPORT  ERROR :: Calling AIS_fnc_AddVehicles with invalid parameter: %1",_exception];
};
 