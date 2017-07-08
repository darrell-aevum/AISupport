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
		class AddPlayerActions {};  
		class CreateAirVehicle {};
		class DoCombatHover {};
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

class AIS_Dialog
{ 
	class scripts 
	{
		file = "addons\ais\dialog\scripts";			
		class CancelDialog {};
		class ConfirmDialog {};			
		class OpenDialog {};   				
	};  
};
class AIS_Dialog_Artillery
{ 
	class scripts 
	{
		file = "addons\ais\dialog\artillery\scripts";			
		class CloseMap {};
		class LoadGUI {};		
		class LoadUnit {};				
		class OpenMap {}; 
	};  
};		
class AIS_Dialog_Cas
{ 
	class scripts 
	{
		file = "addons\ais\dialog\cas\scripts";			
		class LoadGUI {};
		class LoadUnit {};	
	};  
};				
class AIS_Dialog_Reinforcements
{ 
	class scripts 
	{
		file = "addons\ais\dialog\reinforcements\scripts";			
		class LoadGUI {};	 	
		class AddUnitToCargo {};			
		class CargoChanged {}; 
		class RemoveUnitFromCargo {};
        class SquadOrSoldierComboChanged {};
 	    class UnitChanged {};
	};  
};
class AIS_Dialog_Resupply
{ 
	class scripts 
	{
		file = "addons\ais\dialog\resupply\scripts";			
		class AddItemToCrate {};			
		class DeliveryVehicleChanged {};
		class LoadGUI	{};
		class RemoveItemFromCrate {};
		class TraderItemChanged {}; 
		class TraderCategoryChanged {};
		class TraderItemsCategoryChanged {};
	};  
};			 