/*
	DMS Pre-init
	Created by eraser1
*/

#define CALLFILE(FILE) call compile preprocessFileLineNumbers FILE;

// Enables debug logging in AIS functions.
AIS_DEBUG = false;

AIS_Version = getText (configFile >> "CfgPatches" >> "a3_dms" >> "a3_AIS_version");
 
//Load main config
CALLFILE("addons\ais\config.sqf");

AIS_Dialog_Map = 4000;



AIS_Dialog = 1600;

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
 

AIS_Dialog_Reinforcements = 2400;


publicVariable "AIS_Reinforcement_Units";
publicVariable "AIS_Cas_Units";
publicVariable "AIS_Artillery_Units";
 