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
while {count (nearestObjects [_spawnPosition, ["Air"], 100]) > 0} do { 				
	if(_loop > 10) then {
		["infoTitleAndText",    
			[
				"AI Support - CAS",  
				format["Waiting for runway to clear before launching CAS"]
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
 
if(_special == "FLY") then {
	_vic engineOn true;	 
	_spawnPosition set [2, 100];		
	_vic setPos _spawnPosition;	 
	if("Plane" in _inheritance) then {		
		_vic setVelocity [100, 100, 10];   
	};
	if("Helicopter" in _inheritance) then {		
		_vic setVelocity [100, 0, 1];   
	};        
} else {
	_vic setPosASL _spawnPosition;
};
_vic setDamage 0; 
_vic allowDamage (_allowDamage);  	

createVehicleCrew _vic;
{
	[_x] joinSilent _group;
	_x allowDamage (_allowDamage);  		
} forEach crew _vic;

_vic setVehicleLock "LOCKED"; 

[_vic, player, 60*2] remoteExec ["AIS_Server_fnc_VehicleMonitor", 2];

_val = [
	_vic, 
	_this
];
 
_val;