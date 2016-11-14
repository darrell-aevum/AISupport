	diag_log format ["[AI SUPPORT] :: Starting AI Support"]; 
	   
    AISupport_HQCallSign = "Zues 7";

	AISupport_ActiveFireTeams = [];
	AISupport_ActiveReinforcementTeams = [];
	AISupport_ActiveAirSupportUnits = [];
	AISupport_ActiveTransportUnits = [];

	AISupport_InactiveFireTeams = [];
	AISupport_InactiveReinforcementTeams = [];
	AISupport_InactiveAirSupportUnits = [];	
	AISupport_InactiveTransportUnits = [];
 
	AISupport_Bases = [];

	AISupport_AirAssault_Heli_Height				= 50;
	AISupport_AirAssault_MinDistFromDrop			= 10;
	AISupport_AirAssault_MaxDistFromDrop			= 50;
	AISupport_Reinforcements_GroundTroops_MinDistFromDrop = 5;
	AISupport_Reinforcements_GroundTroops_MaxDistFromDrop	= 5;
 
	[] execVM "addons\a3_exile_aiSupport\bases\firebase_a.sqf";		
	[] execVM "addons\a3_exile_aiSupport\bases\firebase_b.sqf";		
 
	if(count AISupport_InactiveFireTeams >= 0 && count AISupport_ActiveFireTeams <= 0) then {
		AISupport_InactiveFireTeams = [
			call (compile loadFile "addons\a3_exile_aiSupport\fireTeams\mlrs_1.sqf"),
			call (compile loadFile "addons\a3_exile_aiSupport\fireTeams\mortars_1.sqf"),
 			call (compile loadFile "addons\a3_exile_aiSupport\fireTeams\mortars_2.sqf")
		];
	};
	if(count AISupport_InactiveReinforcementTeams >= 0 && count AISupport_ActiveReinforcementTeams <= 0) then {
		AISupport_InactiveReinforcementTeams = [
		   call (compile loadFile "addons\a3_exile_aiSupport\vehicles\reinforcement_heli_1.sqf")
		];
	};
	if(count AISupport_InactiveAirSupportUnits >= 0 && count AISupport_ActiveAirSupportUnits <= 0) then {
		AISupport_InactiveAirSupportUnits = [
			call (compile loadFile "addons\a3_exile_aiSupport\vehicles\a10_attack_plane_1.sqf"),
 			call (compile loadFile "addons\a3_exile_aiSupport\vehicles\light_attack_heli_1.sqf"),
			call (compile loadFile "addons\a3_exile_aiSupport\vehicles\attack_heli_1.sqf")
		];	
	};

	AISupport_InactiveTransportUnits = [
		 	
	]; 

	call AISupport_fnc_Messages;
	call AISupport_fnc_Helpers;

	[10] spawn AISupport_fnc_UnitMonitor;
	[5] spawn AISupport_fnc_PlayerMonitor;

		 