private _deployed = false;
if !(params
[
	"_heli",
	"_dropPoint"
])
exitWith
{
	diag_log format ["AI SUPPORT ERROR :: Calling AIS_fnc_AddVehicles with invalid parameters: %1",_this];
	false;
};

try
{	  
	format ["Para Troopers", (group player)] remoteExecCall ["systemChat"]; 
	if (isNull _heli) exitWith
    {
        diag_log format["AISupport ERROR :: Null _heli in AIS_Reinforcements (index %1). Parameters: %2", _forEachIndex, AIS_Reinforcements deleteAt _forEachIndex];
    };

    if !(alive _heli) exitWith
    { 

    }; 
	 _heli setFuel 1;
	 _heli engineOn true; 
	  
	_dropDistance = (floor random [AIS_AirAssault_MinDistFromDrop, (AIS_AirAssault_MaxDistFromDrop - AIS_AirAssault_MinDistFromDrop), AIS_AirAssault_MaxDistFromDrop]);
   	_heli move (_dropPoint); 
	sleep 3;
	waitUntil{(_heli distance2D _dropPoint) <= _dropDistance};  
		_team = [];
		private _AIGroup = group _heli;  
		{
			private _unit = _x;
			if ((alive _unit) && _unit != driver _heli && _unit != gunner _heli && _unit != (_heli turretUnit [ 0 ])) then
			{
				 
				moveOut _unit;
				private _parachute = createVehicle ["Steerable_Parachute_F", (getPosATL _unit), [], 0, "CAN_COLLIDE"];
				_parachute setDir (getDir _unit);
				_parachute enableSimulationGlobal true;

				_unit moveInDriver _parachute;
				_unit moveTo (position player);
				_unit allowDamage false;
				(group player) setCombatMode "RED";
				(group player) setBehaviour "COMBAT";
				[_unit] joinSilent (group player);
				_team pushBack _unit;
				sleep floor random [0, 1, 2];
			};
		} forEach (crew _heli);
		
		_heli setVehicleLock "LOCKED"; 	
		group player selectLeader player;

  
		{
			waitUntil {isTouchingGround _x};
			_x allowDamage true;
		} foreach _team;
		_deployed = true;
 }
catch
{	
	diag_log format ["AI SUPPORT ERROR :: Calling AIS_fnc_RequestReinforcements with error: %1",_exception];
};

_deployed