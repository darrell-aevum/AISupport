params [
	"_vehicleClass",	
	["_spawnPosition", []],	
	["_dirAndUp", nil],
	["_altitude", 0],
	["_special", "NONE"],
	["_allowDamage", true] 
];
 
_group = createGroup AIS_Side;
_inheritance = _vehicleClass call GetInheritance;	
  
//Check for Air vic already spawned there...
_loop = 0;
while {count (nearestObjects [_spawnPosition, ["Air","Car","Truck"], 100]) > 0} do { 				
	if(_loop > 10) then {
		["infoTitleAndText",    
			[
				"AI Support - Reinforcements",  
				format["Waiting for available units."]
			]
		] call ExileClient_gui_toaster_addTemplateToast; 
		_loop = 0;			
	};
	sleep 1;
	_loop = _loop + 1;
};	

 
_vic = createVehicle [_vehicleClass, [0,0,0], [], 0, _special];
_vic allowDamage (false); 
if(!isNil {_dirAndUp}) then {
	_vic setVectorDirAndUp (_dirAndUp);
}; 
 
 
_vic setPosASL _spawnPosition;
 
_vic setDamage 0; 
_vic allowDamage (_allowDamage);  	

createVehicleCrew _vic;
{
	[_x] joinSilent _group;
	_x allowDamage (_allowDamage);  		
} forEach crew _vic;

_vic setVehicleLock "LOCKED"; 

[_vic, player, 60*2] remoteExec ["AIS_Server_fnc_VehicleMonitor", 2];
_vic setVariable ["spawned", true];

_val = [
	_vic, 
	_this
];
 
_val;