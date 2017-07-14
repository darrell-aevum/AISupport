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
 