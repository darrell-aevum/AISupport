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
		file = "addons\ais\client\scripts";
		class AirVicRTB {};
		class AddAisApps {};
		class AddPlayerActions {};  
		class CreateAisApps {};
		class CreateGroundVehicle {};
		class CreateAirVehicle {};
		class DoCombatHover {};
		class EjectAndParachute {};
		class FireVirtualArtillery {};
		class LaunchVirtualCas {};
		class PlayerMonitor {}; 	
		class SendMessage {};	
		class SupplyDrop {};	
		class SupplyDropService {};			
	};  	 
};

class AIS_Server
{ 
	class scripts
	{
		file = "addons\ais\server\scripts";		
		class SetPlayerLocker {};
		class SetPlayerMoney {};
		class SetPlayerRespect {};
		class VehicleMonitor {};		
	};  	 
};
    