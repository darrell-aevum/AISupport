params ["_delay"];
 
while{true} do
{  
	_readdUnit = {		
		_array = _this select 0;
		_vehicle = _this select 1;

		_array = _array - [_vehicle];

		{
			deleteVehicle _vehicle; 
		} forEach crew _vehicle; 
		deleteVehicle _vehicle; 

		_newVehicle = _origParams call AIS_fnc_AddVehicle;			
		_array pushBack _newVehicle;
	};

	{

	}
	foreach	AIS_ActiveFireTeams;

	{
 
	}
	foreach	AIS_ActiveReinforcementTeams;

	{
		if(!alive (driver _x)) then {
			exitWith {
				_respawnOnDeath = _x getVariable ["respawnOnDeath", true];
				if (_respawnOnDeath) then {
					[AIS_ActiveFireTeams, _x] spawn _readdUnit;
				};
		}
		else {
			_isContinuous = _x getVariable ["isContinuous", false];
			if(_isContinuous) then {			
				_resetTime = _x getVariable ["resetTime", (60 * 60)];
				if(resetTime <= 0) then {
					[AIS_ActiveFireTeams, _x] spawn _readdUnit;
				}
				else {				
					_x setVariable ["resetTime", (_resetTime - _delay), true];
				};

				if((_x getVariable ["missionComplete", false])) then {
					_x setDamage 0; 
					_x allowDamage false; 
					(driver _x) setDamage 0;
					{
						_x setDamage 0;
						_x allowDamage false; 
					}
					foreach (crew _x);
					_x setFuel 1;
					AIS_ActiveAirSupportUnits = AIS_ActiveAirSupportUnits - [_x];
					AIS_InactiveAirSupportUnits pushback _x;
		
					publicVariable "AIS_InactiveAirSupportUnits";
					publicVariable "AIS_ActiveAirSupportUnits";
		
				};
			}
			else {
				if((_x getVariable ["missionComplete", false])) then {
					[AIS_ActiveFireTeams, _x] spawn _readdUnit; 
				};
			};
		};
	}
	foreach	AIS_ActiveAirSupportUnits;

	{
		_respawnOnDeath = _x getVariable ["respawnOnDeath", true];
		if((!alive (driver _x) || (_x getVariable ["missionComplete", false])) && _respawnOnDeath) then {
			[AIS_ActiveFireTeams, _x] spawn _readdUnit;
		};
	}
	foreach	AIS_ActiveTransportUnits; 

	sleep _delay;
};