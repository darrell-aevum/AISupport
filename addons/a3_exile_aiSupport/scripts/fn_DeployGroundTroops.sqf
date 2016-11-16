private _deployed = false;
if !(params
[
	"_heli",
	"_dropPoint",
	"_homePoint"
])
exitWith
{
	diag_log format ["AI SUPPORT ERROR :: Calling AIS_fnc_AddVehicles with invalid parameters: %1",_this];
	false;
};

try
{	  
	format ["Ground Tropps", (group player)] remoteExecCall ["systemChat"];  

	if (isNull _heli) exitWith
    {
        diag_log format["AISupport ERROR :: Null _heli in AIS_Reinforcements (index %1). Parameters: %2", _forEachIndex, AIS_Reinforcements deleteAt _forEachIndex];
    };

    if !(alive _heli) exitWith
    { 
		
    }; 
	 _heli setFuel 1;
	 _heli engineOn true; 
	  	_heli flyInHeight 20;
	_groupTroopsDropDistance = (floor random [AIS_Reinforcements_GroundTroops_MinDistFromDrop, (AIS_Reinforcements_GroundTroops_MaxDistFromDrop - AIS_Reinforcements_GroundTroops_MinDistFromDrop), AIS_Reinforcements_GroundTroops_MaxDistFromDrop]);
 
 
 	_heli move (_dropPoint); 
	sleep 3;
	waitUntil{unitReady _heli};
	sleep 3;
	_heli land "LAND"; 		 
	waitUntil{(( position _heli ) select 2) <= 8};	
	_heli flyInHeight 3;
	_heli land "NONE"; 	

	waitUntil{(( position _heli ) select 2) <= 3.1};

	_team = [];
	private _AIGroup = group _heli;  
	{
		private _unit = _x;
		if ((alive _unit) && _unit != driver _heli && _unit != gunner _heli && _unit != (_heli turretUnit [ 0 ])) then
		{ 
			moveOut _unit;
			_unit moveTo (position player);
				
			(group player) setCombatMode "RED";
			(group player) setBehaviour "COMBAT";
			[_unit] joinSilent (group player);
			sleep floor random [0, .5, 1];
		};
	} forEach (crew _heli);
	group player selectLeader player;

	_heli land "NONE"; 	
	_heli flyInHeight 35; 
	_heli setVehicleLock "LOCKED"; 	
	_heli land "NONE";

	_heli move (_homePoint); 
	sleep 3;

	while { ( (alive _heli) && !(unitReady _heli) ) } do
	{
			sleep 1;
	};

	if (alive _heli) then
	{
			_heli land "LAND";
			waitUntil {isTouchingGround _heli};  
	}; 

	_deployed = true; 
 }
catch
{	
	diag_log format ["AI SUPPORT ERROR :: Calling AIS_fnc_RequestReinforcements with error: %1",_exception];
};

_deployed