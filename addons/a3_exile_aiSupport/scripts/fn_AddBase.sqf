params ["_objects", ["_staticWeapons", []], ["_vehicles", []]];

_base =  [];



_base pushBack [];
{
	(_base select 0) pushBack (_x call AIS_fnc_AddObject);	
} foreach _objects;


_base pushBack [];
{
	(_base select 1) pushBack (_x call AIS_fnc_AddStaticWeapon);
} foreach _staticWeapons;


_base pushBack [];
{
	(_base select 2) pushBack (_x call AIS_fnc_AddVehicle);
} forEach _vehicles;

_base
 
  