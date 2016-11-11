diag_log format ["[AI SUPPORT] :: Post Init"]; 

	if(isDedicated) then {
		waitUntil{!isNil "ExileClientLoadedIn"};
		UISleep 0.1;
		waitUntil{ExileClientLoadedIn};
		UISleep 0.1;
	};

    [] execVM "addons\a3_exile_aiSupport\bases\firebase_a.sqf";		
	[] execVM "addons\a3_exile_aiSupport\bases\firebase_b.sqf";		

	AISupport_InactiveFireTeams = [
		call (compile loadFile "addons\a3_exile_aiSupport\fireTeams\mlrs_1.sqf"),
		call (compile loadFile "addons\a3_exile_aiSupport\fireTeams\mortars_1.sqf"),
 		call (compile loadFile "addons\a3_exile_aiSupport\fireTeams\mortars_2.sqf")
	];
	AISupport_InactiveAirInsertionTeams = [
	   call (compile loadFile "addons\a3_exile_aiSupport\vehicles\reinforcement_heli_1.sqf")
	];
	AISupport_InactiveAirSupportUnits = [
		call (compile loadFile "addons\a3_exile_aiSupport\vehicles\a10_attack_plane_1.sqf"),
 		call (compile loadFile "addons\a3_exile_aiSupport\vehicles\light_attack_heli_1.sqf"),
		call (compile loadFile "addons\a3_exile_aiSupport\vehicles\attack_heli_1.sqf")
	];	
	AISupport_InactiveTransportUnits = [
		 	
	];
 
  	AISupport_Player_Actions = [
		[["Request Air Support", {call AISupport_fnc_RequestAirSupport}], 5000, 100],
		[["Request Fire Mission", {call AISupport_fnc_RequestFireMission}], 5000, 100],
		[["Request Reinforcements", {[["SmokeShell"]] spawn AISupport_fnc_RequestReinforcements}], 5000, 100, ["SmokeShell"]]
	];


	[10] spawn AISupport_fnc_UnitMonitor;
	[5] spawn AISupport_fnc_PlayerMonitor;
 