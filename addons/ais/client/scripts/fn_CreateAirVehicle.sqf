private ["_marker","_altitude", "_velocity"];
params [
	"_vehicleClass",	
	["_includePrimaryMapSpawnPoints", false],
	["_includeSecondaryMapSpawnPoints", false],
	["_spawnPostitions", []]	
];

_group = createGroup AIS_Side;
_inheritance = _vehicleClass call GetInheritance;	

_spawnArray = [];	
if(count _spawnPostitions > 0) then {
	_spawnArray = _spawnArray + _spawnPostitions;	
};

_mapAirfields = [];
//Get Air spawnpoints from Map config file
if(_includePrimaryMapSpawnPoints) then { 
	_primaryAirfields = getarray (configfile >> "CfgWorlds" >> worldName >> "ilsTaxiIn");	  
	{
		_mapAirfields = _mapAirfields + [_x]; 
	} forEach _primaryAirfields;	 
};	

if(_includeSecondaryMapSpawnPoints) then { 
	if("Helicopter" in _inheritance) then { 
		_secondaryAirfields = [(configfile >> "CfgWorlds" >> worldName >> "SecondaryAirports" ),1, true, true ] call BIS_fnc_returnChildren;
		{  
			{
				_mapAirfields = _mapAirfields + [_x]; 
			} forEach getarray(_x select 3);						
		} forEach _secondaryAirfields;	
	}; 
};
if(count _mapAirfields > 0) then 
{ 
	for "_i" from 0 to (count _mapAirfields - 1) step 2 do {
		_spawnArray = _spawnArray + [
			[
				[_mapAirfields select _i, (_mapAirfields select _i + 1)],
				[],
				true			
			]		
		];
	};
};

//If no spawn positions, create one

if(count _spawnArray <= 0) then {
	_randPosition = [position player, (random [2500, 3500 , 4000]), (random 360)] call BIS_fnc_relPos;			
	_randPosition set [2, 800];
	_spawnArray = _spawnArray + [			
		[
			_randPosition,
			[],
			true,
			"FLY"
		]			
	]
}; 

_selectedPosition =  random ((count _spawnArray)-1);
_spawnProperties = _spawnArray select _selectedPosition;
 
_spawnPosition = _spawnProperties select 0;
 
_special = if (count _spawnProperties > 3) then [{_spawnProperties select 3 }, {"NONE"}];
_altitude = if (count _spawnPosition > 2) then [{_spawnPosition select 2 }, {0}];
_altitude = if (_special == "FLY") then [{500}, {0}];

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
 
_vic = createVehicle [_vehicleClass, _spawnPosition, [], _altitude, _special];

if(_special == "FLY") then {
	_vic engineOn false;	
};

_dirVerticleUp = if (count _spawnProperties > 1) then [{_spawnProperties select 1 }, {[]}];

if (count _dirVerticleUp > 1) then {
	_vic setVectorDirAndUp (_dirVerticleUp);
};

_allowDamage =  if (count _spawnProperties > 2) then [{ _spawnProperties select 2 }, {true}];
_vic allowDamage (_allowDamage);  	

createVehicleCrew _vic;
{
	[_x] joinSilent _group;
	_x allowDamage (_allowDamage);  		
} forEach crew _vic;

_vic setVehicleLock "LOCKED"; 

[_vic, player, 60*5] remoteExec ["AIS_Server_fnc_VehicleMonitor", 2];

_val = [_vic, _spawnProperties];
 
_val;