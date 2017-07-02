/*
	AIS_fnc_FireVirtualArtillery
	Created by DHarvey44
 
	Fires virtual artillery rounds.
*/

params [
	["_shellCount", 1],
	["_shellType", "Sh_82mm_AMOS"],	
	["_targetPosition", objNull, [objNull, []]],
	["_radius", 50, [0]],
	["_dir", random 360, [0]],
	["_height", 0, [0]]
];


//if (!isServer) exitWith {};
 
//sleep random [10, 20, 45];

for "_index" from 1 to _shellCount do {
	_posToFireAt = [];
	while {(count _posToFireAt) == 0} do {
		_posToFireAt = [_targetPosition, (random 150), (random 360)] call BIS_fnc_relPos;
	};
 
	_posToFireAt set [2, 800];
	_shell = _shellType createVehicle _posToFireAt;
	_shell setPos _posToFireAt;
	_shell setVelocity [0,0,-200];

	if ((_index % 4) == 3) then {
		sleep (3 + (random 1) / 4);
	} else {
		sleep random 0.1;
	};
};

deleteMarker 'AIS_TARGET';