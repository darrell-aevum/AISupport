![ArmA 1.72](https://img.shields.io/badge/Arma-1.72-blue.svg) ![Exile 1.0.3 "Lemon"](https://img.shields.io/badge/Exile-1.0.3%20Lemon-C72651.svg) ![AIS Version](https://img.shields.io/badge/AIS%20Version-2017--07--13-blue.svg)


## Installation: 

1. Download the [AIS Addon](https://github.com/darrell-aevum/AISupport/archive/Virtual.zip)
2. Copy the addons folder to the mission PBO's root. 
   (If you already have an addons folder, add the ais folder to the existing addons folder).
2. Edit the description.ext file, adding these 4 classes to the CfgRemoteExec >> Functions class.
```
	class AIS_Server_fnc_VehicleMonitor {
		allowedTargets = 2;
	};
	class AIS_Server_fnc_SetPlayerLocker {
		allowedTargets = 2;
	};
	class AIS_Server_fnc_SetPlayerMoney {
		allowedTargets = 2;
	};
	class AIS_Server_fnc_SetPlayerRespect {
		allowedTargets = 2;
	};			
```
3. Edit the config.cpp adding the #include to the propper class. 
   (If the class does not exist in your config.cpp, creare it, if it does, just add the include to the end of the class)
```
	class CfgPatches
	{
		#include "addons\ais\cfgPatches.hpp"
	};
```
```
	class CfgFunctions
	{
		#include "addons\ais\cfgFunctions.hpp"
	}
```
```
	class CfgXM8
	{	
		extraApps[] = {"AIS_Artillery", "AIS_CAS"};
		#include "addons\ais\cfgXM8.hpp"
	};
```
```
	class CfgExileCustomCode 
	{
		#include "addons\ais\cfgExileCustomCode.hpp"	
	};
```
4. Repackage the PBO and give it a shot.

## Configuration: 
- Top Level Config Settings : addons\ais\config.sqf.
- App Level Config Settings: addons\ais\"app name"\mapConfigs\"map name.sqf"

## Upcoming Features / Changes: 

- Add Reinforcements App.
- Add Resupply App.	
- Add instructions for Exad XM8 app.