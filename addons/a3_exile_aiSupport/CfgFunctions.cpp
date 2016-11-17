class AISupport
{
	tag = "AIS";
	class FNCs
	{
		file = "addons\a3_exile_aiSupport\scripts";		
		class AddBase {}; 
		class AddObject {};		
		class AddStaticWeapon {};
		class AddUnits {};
		class AddVehicle {};	
		class AirSupportMonitor {};
		class BaseMonitor {};				
		class CreateAirAssaultTeam {};
		class DeployGroundTroops {};
		class DeployParatroopers {};
		class ExistsInArray {};	
		class Helpers {};		
		class Messages {};
		class PlayerMonitor {};
		class RebuildVehicle {};
		class ReinforcementsMonitor {};
		class RequestAirSupport {};
		class RequestFireMission {};
		class RequestReinforcements {};
		class SendAirSupport {};
		class SendFireMission {};	
		class SendMessage {};
		class SendReinforcements {};
		class postInitAISupport { file = "addons\a3_exile_aiSupport\postInit.sqf"; postInit = 1; };
		class preInitAISupport { file = "addons\a3_exile_aiSupport\preInit.sqf"; preInit = 1; };
		class UnitMonitor {};
	};
};