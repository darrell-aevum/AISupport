waitUntil {!(isNull findDisplay 46) && !(isNil AISupport_FireTeams)}; // wait until player is in spawned
uiSleep 1;

player addAction ["Request Air Support", {call AISupport_fnc_RequestAirSupport}];
player addAction ["Request Fire Mission", {call AISupport_fnc_RequestFireMission}, (AISupport_FireTeams select 0)];
player addAction ["Request Paratrooper Support", AISupport_fnc_RequestParatrooperSupport];