/*
	AIS_fnc_PlayerMonitor
	Created by DHarvey44

	Usage:
	[5] spawn AIS_fnc_PlayerMonitor
	//or
	spawn AIS_fnc_PlayerMonitor;

	Monitors the players and performs certain actions
*/

params
[
	["_delay", 10]
];

call AIS_Client_fnc_AddPlayerActions;

sleep _delay;
[_delay] spawn AIS_Client_fnc_PlayerMonitor;



