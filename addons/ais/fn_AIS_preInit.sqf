/*
	DMS Pre-init
	Created by eraser1
*/

#define CALLFILE(FILE) call compile preprocessFileLineNumbers FILE;

// Enables debug logging in AIS functions.
AIS_DEBUG = false;

AIS_Version = getText (configFile >> "CfgPatches" >> "a3_ais" >> "a3_AIS_version");
 
//Load main config
CALLFILE("addons\ais\config.sqf");
CALLFILE("addons\ais\client\scripts\fn_Helpers.sqf");
CALLFILE("addons\ais\client\scripts\fn_Messages.sqf")

AIS_Dialog_Map = 4000;
 
AIS_Dialog = 1600;

AIS_Dialog_BtnConfirm = 7;
AIS_Dialog_BtnCancel = 1902;
AIS_Dialog_BtnClose = 1903;

AIS_Dialog_UnitListBack = 1603;
AIS_Dialog_UnitDescriptionBack = 1604;
AIS_Dialog_UnitInfoBack = 1605;
AIS_Dialog_MapControlBack = 1606;
AIS_Dialog_BtnCloseMap = 1607;
AIS_Dialog_BtnClearTarget = 1608;


AIS_Dialog_Artillery = 2200;
AIS_Dialog_Artillery_UnitList = 2201;
AIS_Dialog_Artillery_UnitDescription = 2202;
AIS_Dialog_Artillery_UnitInfo = 2203; 
AIS_Dialog_Artillery_RoundTypeToFire = 2204;
AIS_Dialog_Artillery_RoundNumberToFire = 2205;
AIS_Dialog_Artillery_MarkTarget = 2206;

AIS_Dialog_Cas = 2300;
AIS_Dialog_Cas_UnitList = 2301;
AIS_Dialog_Cas_UnitDescription = 2302;
AIS_Dialog_Cas_UnitInfo = 2303; 
AIS_Dialog_Cas_Duration = 2304; 
 
AIS_Dialog_Resupply = 2500;
AIS_Dialog_Resupply_TraderCategories = 2501;
AIS_Dialog_Resupply_TraderItemCategories = 2502;
AIS_Dialog_Resupply_TraderItems = 2503; 
AIS_Dialog_Resupply_TraderItemDescription = 2504; 
AIS_Dialog_Resupply_CrateList = 2505; 
AIS_Dialog_Resupply_DeliveryVehicle = 2506;  
AIS_Dialog_Resupply_CrateTotal = 2507;
AIS_Dialog_Resupply_AddItemToCrate = 2509; 
   
AIS_Dialog_Reinforcements = 2400; 
AIS_Dialog_Reinforcements_SoldierOrSquadCombo = 2401;
AIS_Dialog_Reinforcements_UnitListBox = 2403; 
AIS_Dialog_Reinforcements_UnitDescriptionTxt = 2404; 
AIS_Dialog_Reinforcements_CargoListBox = 2405; 
AIS_Dialog_Reinforcements_InsertiontVehicleListBox = 2406;  
AIS_Dialog_Reinforcements_CargoTotalTxt = 2407; 
AIS_Dialog_Reinforcements_AddUnitToCargoBtn = 2409; 

CALLFILE("addons\ais\dialog\scripts\fn_DropdownLists.sqf");

AIS_Poptab_Icon = "addons/ais/icons/poptab_ca.paa";

publicVariable "AIS_Reinforcement_Units";
publicVariable "AIS_Cas_Units";
publicVariable "AIS_Artillery_Units";
 

