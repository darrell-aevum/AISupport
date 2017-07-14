/*
	AIS_fnc_FireVirtualArtillery
	Created by DHarvey44
 
	Fires virtual artillery rounds.
*/
 
params [
	["_shellCount", 1],
	["_shellType", "Sh_82mm_AMOS"],	
	["_targetPosition", objNull, [objNull, []]], 
	["_accuracy", 100]
];
  
_markerName = format["AIS_ARTILLERY_TARGET_%1",random(99999)];
_marker = createMarker[_markerName, _targetPosition];
_marker setMarkerType 'mil_destroy';
_marker setMarkerSize[0.8, 0.8];
_marker setMarkerColor 'ColorRed';


_sleep = round random [10, 20, 45];  
["SuccessTitleAndText", 
	[
		"AI Support - Fire Mission",
		format["Artillery inbound you your requested position. ETA %1 seconds.", _sleep]
	]
] call ExileClient_gui_toaster_addTemplateToast; 

sleep _sleep;

for "_index" from 1 to _shellCount do {
	_posToFireAt = []; 	
	_posToFireAt = [_targetPosition, (random _accuracy), (random 360)] call BIS_fnc_relPos; 	
	_posToFireAt set [2, 800];
	_shell = _shellType createVehicle _posToFireAt;
	_shell setPos _posToFireAt;
	_shell setVelocity [0,0,-200];

 
	sleep random  [2, 3, 5];
 
};

sleep 5;
deleteMarker _marker;