diag_log format ["[AI SUPPORT] :: Post Init"]; 

	if(isDedicated) then {
		waitUntil{!isNil "ExileClientLoadedIn"};
		UISleep 0.1;
		waitUntil{ExileClientLoadedIn};
		UISleep 0.1;
	};

	//The conditional statements are there because the units were being crated twice... 
  	AISupport_Player_Actions = [
		[["Request Air Support", {call AISupport_fnc_RequestAirSupport}], 5000, 100],
		[["Request Fire Mission", {call AISupport_fnc_RequestFireMission}], 5000, 100],
		[["Request Reinforcements", {[["SmokeShell"]] spawn AISupport_fnc_RequestReinforcements}], 5000, 100, ["SmokeShell"]]
	];
	 

 	[10] spawn AISupport_fnc_UnitMonitor;
	[5] spawn AISupport_fnc_PlayerMonitor;