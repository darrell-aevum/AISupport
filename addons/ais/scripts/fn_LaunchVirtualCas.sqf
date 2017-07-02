/*
	AIS_fnc_FireVirtualArtillery
	Created by DHarvey44
 
	Fires virtual artillery rounds.
*/

params [
	["_aircraftType", "B_Plane_CAS_01_F"],
	["_duration", 3],	
	["_targetPosition", objNull, [objNull, []]],
	["_radius", 50, [0]],
	["_dir", random 360, [0]],
	["_height", 0, [0]]
];

//if (!isServer) exitWith {}; 
  
//sleep random [45, 120, 240];

_position = [position player, (random [1500, 3000 ,6000]), (random 360)] call BIS_fnc_relPos;
_vehicle = createVehicle [_aircraftType, _position, [], 500, "FLY"];

//_vehicle setVelocity [100, 0, 0]; 


_pilot = (group player) createUnit ["B_Helipilot_F", [0,0,1], [], 0, "CAN_COLLIDE"];
_pilot moveInDriver _vehicle;
 