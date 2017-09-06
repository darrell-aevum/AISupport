params["_className"];
 
  
/*
private _configArray = "(
    ((configName _x) isKindOf 'Helicopter') &&
    {getNumber (_x >> 'scope') >= 2}
    )" configClasses (configFile >> "CfgVehicles");

 
{
    private ["_class", "_dispName", "_mod", "_maxLift", "_author", "_cat", "_fac", "_side", "_dlc", "_vc","_totalSeats","_crewSeats","_cargoSeats","_nonFFVcargoSeats","_ffvCargoSeats"];
    _class = configName _x;
    _dispName = getText (_x >> 'displayName');
    _mod = configSourceMod _x;
    _maxLift = getNumber (_x >> 'slingLoadMaxCargoMass');
    _author = getText (_x >> 'author');
    _cat = getText (_x >> 'category');
    _fac = getText (_x >> 'faction');
    _side = getNumber (_x >> 'side');
    _dlc = getText (_x >> 'dlc');
    _vc = getText (_x >> 'vehicleClass');
    _totalSeats = [configName _x, true] call BIS_fnc_crewCount; // Number of total seats: crew + non-FFV cargo/passengers + FFV cargo/passengers
    _crewSeats = [configName _x, false] call BIS_fnc_crewCount; // Number of crew seats only
    _cargoSeats = _totalSeats - _crewSeats; // Number of total cargo/passenger seats: non-FFV + FFV
    _nonFFVcargoSeats = getNumber (_x >> "transportSoldier"); // Number of non-FFV cargo seats only
    _ffvCargoSeats = _cargoSeats - _nonFFVcargoSeats; // Number of FFV cargo seats only
    private _output = format ["%1|%2|%3|%4|%5|%6|%7|%8|%9|%10|%11|%12|%13|%14|%15", _dispName, _class, _mod, _maxLift, _author, _cat, _fac, _side, _dlc, _vc, _totalSeats, _crewSeats, _cargoSeats, _nonFFVcargoSeats, _ffvCargoSeats];
    conFile(_output);
} forEach _configArray;
*/
 
 //_props = configProperties [configFile >> "CfgVehicles" >> _className];
_crewSeats = [_className, false] call BIS_fnc_crewCount; 
_totalSeats = [_className, true] call BIS_fnc_crewCount; // Number of total seats: crew + non-FFV cargo/passengers + FFV cargo/passengers
_cargoSeats = _totalSeats - _crewSeats;
 
 systemchat format["_cargoSeats: %1", _cargoSeats];
 
  
 _props;