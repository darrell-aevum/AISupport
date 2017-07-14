params ["_vic","_finalDestination", ["_special", "NONE"]];
 
while {(count (waypoints (group _vic))) > 0} do
{
	deleteWaypoint ((waypoints (group _vic)) select 0);
};		

_vic doMove _finalDestination;

waitUntil {isnull _vic || getDammage _vic >= .8 || unitReady _vic };
if(isnull _vic) exitwith{};
if(getDammage _vic >= .8) exitwith {
	_vic setDamage 1;
};
 
if(_special == "FLY") then {
	sleep 5;
	{ deleteVehicle _x } forEach (crew _vic); deleteVehicle _vic;
}
else {
	_vic land "LAND";	
	waitUntil {isnull _vic || getDammage _vic >= .8 || isTouchingGround  _vic };
	if(isnull _vic) exitwith{};
	if(getDammage _vic >= .8) exitwith {
		_vic setDamage  1;
	};
	sleep 15;
	_vic engineOn false;
	sleep 5;
	{ deleteVehicle _x } forEach (crew _vic); deleteVehicle _vic;		 					 
} 
 