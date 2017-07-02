class CfgPatches
{
	class a3_ais
	{
		units[] = {};
		weapons[] = {};
		a3_AIS_version = "June 30, 2017";
		requiredVersion = 1.68;
		requiredAddons[] = {"exile_client","exile_server_config"};
	};
};

class CfgFunctions
{
	class AIS_Client
	{
		class main
		{
			file = "addons\ais";
			class AIS_preInit
			{
				preInit = 1;
			};
			class AIS_postInit
			{
				postInit = 1;
			};
		};
		class scripts
		{
			file = "addons\ais\scripts";
			class AddPlayerActions {};  
			class FireVirtualArtillery {};
			class LaunchVirtualCas {};
			class PlayerMonitor {}; 	
	
		};  		
		class dialog
		{
			file = "addons\ais\dialog\scripts";			
			class CancelDialog {};
			class CloseMap {};
			class ConfirmDialog {};
			class LoadArtilleryGUI {};		
			class LoadArtilleryUnit {};	
			class LoadCasGUI {};
			class LoadReinforcementsGUI {};
			class OpenDialog {};   	
			class OpenMap {};
			
		};  
	};
}; 

#include "dialog\Common.hpp"
#include "dialog\gui.hpp"

class RscTitles
{
	#include "dialog\gui.hpp"
};