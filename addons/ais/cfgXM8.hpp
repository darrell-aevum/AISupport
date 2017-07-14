	class AIS_Artillery 
	{
		title = "AIS Artillery";
		controlID = 70000;	//IDC:70000 -> 70011 || These need to be unique and out of range from each other 
		logo = "\A3\Static_f\Mortar_01\data\UI\Mortar_01_ca.paa";
		onLoad = "addons\ais\apps\artillery\onLoad.sqf";
		onOpen = "addons\ais\apps\artillery\onOpen.sqf";
		onClose = "addons\ais\apps\artillery\onClose.sqf";
		config = "addons\ais\apps\artillery\config.sqf";
	};		
	class AIS_CAS
	{
		title = "AIS CAS";
		controlID = 80000;	//IDC:80000 -> 80011 || These need to be unique and out of range from each other 
		logo = "\A3\Air_F_Gamma\Plane_Fighter_03\Data\UI\Plane_Fighter_03_CA.paa";
		onLoad = "addons\ais\apps\cas\onLoad.sqf";
		onOpen = "addons\ais\apps\cas\onOpen.sqf";
		onClose = "addons\ais\apps\cas\onClose.sqf";
		config = "addons\ais\apps\cas\config.sqf";
	};
	class AIS_RESUPPLY
	{
		title = "AIS Resupply";
		controlID = 90000;	//IDC:80000 -> 80011 || These need to be unique and out of range from each other 
		logo = "\A3\ui_f\data\map\VehicleIcons\iconparachute_ca.paa";
		onLoad = "addons\ais\apps\cas\onLoad.sqf";
		onOpen = "addons\ais\apps\cas\onOpen.sqf";
		onClose = "addons\ais\apps\cas\onClose.sqf";
		config = "addons\ais\apps\cas\config.sqf";
	};			
	class AIS_Reinforcements
	{
		title = "AIS Reinforcements";
		controlID = 100000;	//IDC:80000 -> 80011 || These need to be unique and out of range from each other 
		logo = "\a3\Ui_F_Curator\Data\Displays\RscDisplayCurator\modeGroups_ca.paa";
		onLoad = "addons\ais\apps\reinforcements\onLoad.sqf";
		onOpen = "addons\ais\apps\reinforcements\onOpen.sqf";
		onClose = "addons\ais\apps\reinforcements\onClose.sqf";
		config = "addons\ais\apps\reinforcements\config.sqf";
	};		