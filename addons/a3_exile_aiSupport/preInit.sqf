
//Load Configs
call compile preprocessFileLineNumbers (format ["addons\a3_exile_aiSupport\maps\%1\config.sqf", toLower worldName]);
call compile preprocessFileLineNumbers ("addons\a3_exile_aiSupport\config.sqf");
call AISupport_fnc_Messages;
call AISupport_fnc_Helpers;
//Load handy functions...

if(isServer) then {
	AISupport_ActiveFireTeams = [];
	AISupport_ActiveReinforcementTeams = [];
	AISupport_ActiveAirSupportUnits = [];
	AISupport_ActiveTransportUnits = [];

	AISupport_InactiveFireTeams = [];
	AISupport_InactiveReinforcementTeams = [];
	AISupport_InactiveAirSupportUnits = [];	
	AISupport_InactiveTransportUnits = [];
  
    AISupport_Bases = [];

	//Create Bases and Support Teams
	{
		[] execVM (format ["addons\a3_exile_aiSupport\maps\%1\bases\%2.sqf", toLower worldName, _x]);
	} foreach AISupport_FOBs;

	{
		AISupport_InactiveFireTeams pushBack (call (compile loadFile (format ["addons\a3_exile_aiSupport\maps\%1\fireTeams\%2.sqf", toLower worldName, _x])));
	} foreach AISupport_FireTeams;

	{
		AISupport_InactiveReinforcementTeams pushBack (call (compile loadFile (format ["addons\a3_exile_aiSupport\maps\%1\reinforcementTeams\%2.sqf", toLower worldName, _x])));
	}foreach AISupport_ReinforcementTeams;

	{
		AISupport_InactiveAirSupportUnits pushBack (call (compile loadFile (format ["addons\a3_exile_aiSupport\maps\%1\airSupportTeams\%2.sqf", toLower worldName, _x])));
	}foreach AISupport_AirSupportTeams;	 
	
	AISupport_InactiveTransportUnits = [
		 	
	]; 
}; 