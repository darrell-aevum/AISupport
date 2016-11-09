	diag_log format ["[AI SUPPORT] :: Starting AI Support"]; 
	AISupport_DEBUG = true;
 
	AISupport_ActiveFireTeams = [];
	AISupport_ActiveAirInsertionTeams = [];
	AISupport_ActiveAirSupportUnits = [];
	AISupport_ActiveTransportUnits = [];

	AISupport_InactiveFireTeams = [];
	AISupport_InactiveAirInsertionTeams = [];
	AISupport_InactiveAirSupportUnits = [];	
	AISupport_InactiveTransportUnits = [];


	AISupport_FireTeams = [];
	AISupport_Reinforcements = [];
	AISupport_AirSupportUnits = [];
	
	AISupport_fireTeamsToClean = [];
	AISupport_ActiveFireTeams = []; 
	AISupport_Bases = [];

	AISupport_AirAssault_Heli_Height				= 50;
	AISupport_AirAssault_MinDistFromDrop			= 10;
	AISupport_AirAssault_MaxDistFromDrop			= 50;
	AISupport_Reinforcements_GroundTroops_MinDistFromDrop = 5;
	AISupport_Reinforcements_GroundTroops_MaxDistFromDrop	= 5;

	call AISupport_fnc_Helpers;




		 