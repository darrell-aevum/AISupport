	params
	[
		"_vic",
		"_player",
		["_delay", 10]
	];

	//"monitoring started" remoteExec ["systemchat", _player]; 
 
	params["_vic","_player",["_delay", 10]];
	
	diag_log format["AIS Vehicle Monitor: Started monitoring vehicle %1 for player %2", _vic, _player];
	
	waitUntil {({alive _x} count crew _vic == 0) || isnull _vic || isnull _player};
	diag_log format["AIS Vehicle Monitor: Removing vehicle %1 for player %2", _vic, _player];


	if(isnull _player) then {
		{ deleteVehicle _x } forEach (crew _vic); deleteVehicle _vic;
	};

	if(!isNull _vic && ({alive _x} count crew _vic == 0)) then {
		sleep _delay;
		deleteVehicle _vic;
	}; 