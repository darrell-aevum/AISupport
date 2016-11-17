 	//Load Config	
	call compile preprocessFileLineNumbers ("addons\a3_exile_aiSupport\config.sqf");

	if(isServer) then {
		if(isNil "AIS_Initialized") then {
			//Load Map Configs
			call compile preprocessFileLineNumbers (format ["addons\a3_exile_aiSupport\maps\%1\config.sqf", toLower worldName]);	
	 
			AIS_ActiveFireTeams = [];
			AIS_ActiveReinforcementTeams = [];
			AIS_ActiveAirSupportUnits = [];
			AIS_ActiveTransportUnits = [];

			AIS_InactiveFireTeams = [];
			AIS_InactiveReinforcementTeams = [];
			AIS_InactiveAirSupportUnits = [];	
			AIS_InactiveTransportUnits = [];
  
			AIS_Bases = [];

			//Create Bases and Support Teams
			{
				[] execVM (format ["addons\a3_exile_aiSupport\maps\%1\bases\%2.sqf", toLower worldName, _x]);
			} foreach AIS_FOBs;

			{
				AIS_InactiveFireTeams pushBack (call (compile loadFile (format ["addons\a3_exile_aiSupport\maps\%1\fireTeams\%2.sqf", toLower worldName, _x])));
			} foreach AIS_FireTeams;

			{
				AIS_InactiveReinforcementTeams pushBack (call (compile loadFile (format ["addons\a3_exile_aiSupport\maps\%1\reinforcementTeams\%2.sqf", toLower worldName, _x])));
			}foreach AIS_ReinforcementTeams;

			{
				AIS_InactiveAirSupportUnits pushBack (call (compile loadFile (format ["addons\a3_exile_aiSupport\maps\%1\airSupportTeams\%2.sqf", toLower worldName, _x])));
			}foreach AIS_AirSupportTeams;	 
	
			AIS_InactiveTransportUnits = [
		 	
			];  
	
			publicVariable "AIS_InactiveFireTeams";
			publicVariable "AIS_InactiveReinforcementTeams";
			publicVariable "AIS_InactiveAirSupportUnits";
			publicVariable "AIS_InactiveTransportUnits";
			publicVariable "AIS_ActiveFireTeams";
			publicVariable "AIS_ActiveReinforcementTeams";
			publicVariable "AIS_ActiveAirSupportUnits";
			publicVariable "AIS_ActiveTransportUnits";
			publicVariable "AIS_Bases"; 

			AIS_Initialized = true;
			publicVariable "AIS_Initialized";
		};
	};

	//Load handy functions...
	call AIS_fnc_Messages;
	call AIS_fnc_Helpers;

	[10] spawn AIS_fnc_ReinforcementsMonitor;
	[10] spawn AIS_fnc_AirSupportMonitor;
	
	AIS_Player_Actions = [
		[["Request Air Support", {call AIS_fnc_RequestAirSupport}]],
		[["Request Fire Mission", {call AIS_fnc_RequestFireMission}]],
		[["Request Reinforcements", {[["SmokeShell"]] spawn AIS_fnc_RequestReinforcements}], ["SmokeShell"]]
	];
	
	[5] spawn AIS_fnc_PlayerMonitor;