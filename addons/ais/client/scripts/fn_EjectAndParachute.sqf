/* 
Filename: Simple ParaDrop Script v2.3 eject.sqf
Author: Beerkan

Description:
    A simple paradrop script

Parameter(s):
0: GROUP    - group that will be doing the paradrop (group)
1: VEHICLE  - vehicle that will be doing the paradrop (object)
2: ALTITUDE - (optional) the altitude where the group will open their parachute (number)

  Example:
  0 = [group , vehicle, altitude] execVM "eject.sqf"
*/  

if (!isServer) exitWith {};
private ["_units","_vehicle","_chuteHeight"];
_units       =  _this select 0;
_vehicle     = _this select 1; 
_chuteheight = if ( count _this > 2 ) then { _this select 2 } else { 150 };

_vehicle allowDamage false;

private ["_dir"];
_dir = direction _vehicle;    

{    
unassignVehicle _x;
   _x allowDamage false;
   _x action ["EJECT", _vehicle];
   _x setDir (_dir + 90);
   sleep 1;
} forEach (units _units);

{
waitUntil {(position _x select 2) < _chuteheight};
   _chute = createVehicle ["Steerable_Parachute_F", position _x, [], ((_dir)- 5 + (random 10)), 'FLY'];
   _chute setPos (getPos _x);
   _x moveInDriver _chute;
} forEach (units _units);

_vehicle allowDamage true;

paraLandSafe = 
{
private ["_unit"];
_unit = _this select 0;

(vehicle _unit) allowDamage false;	

waitUntil { isTouchingGround _unit || (position _unit select 2) < 1 };
   _unit action ["eject", vehicle _unit];
   _unit allowDamage true;
};

{ 
[_x] spawn paraLandSafe;
} forEach (units _units);