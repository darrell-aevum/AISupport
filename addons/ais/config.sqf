	
	AIS_HQCallSign									= "Pegusus 6";
	AIS_Side										= INDEPENDENT;

//////////////////////////////////////////////////////////////////////////////////////////
//    Resupply Settings                                                                 //
//////////////////////////////////////////////////////////////////////////////////////////
	AIS_Resupply_DeliveryFee = .10;               //10% of total crate
	AIS_Resupply_ItemMarkup = .35;                //35% of trader price
	AIS_Resupply_CrateLifespan = 600;              // Lifespan in seconds
	AIS_Resupply_TrackSupplyVehicleOnMap = true;  //Adds a marker to them for the crate's location
	AIS_Resupply_MarkCrateOnMap = true;           //Adds a marker to them for the crate's location

	// Available vehicles for supply delivery
	//[Class Name, Description, Cost, Respect, Required Items, RespectEarned]	
	AIS_Resupply_Delivery_Vehicles = [
		["B_G_Van_01_transport_F", "", 500, 500, ["ItemRadio"], 5],
		["B_Truck_01_transport_F", "", 1000, 1500, ["ItemRadio"], 10],		
		["B_Heli_Transport_03_unarmed_F", "", 2500, 5000, ["ItemRadio", "SmokeShell"], 15],
		["B_T_VTOL_01_armed_F", "", 3500, 10000, ["ItemRadio", "SmokeShell"], 20]
	];

	AIS_Trader_Categories = [
		"Exile_Trader_Armory",
		"Exile_Trader_Equipment",
		"Exile_Trader_Food",
		"Exile_Trader_Hardware",
		"Exile_Trader_SpecialOperations"
	];

	AIS_Trader_Item_Categories = [
		"Ammunition",
		"AssaultRifles",
		"Backpacks",
		"BipodAttachments",
		"Drinks",
		"Explosives",
		"FirstAid",
		"Flares",
		"Food",
		"Glasses",
		"Hardware",
		"LightMachineGuns",
		"MuzzleAttachments",	
		"LightMachineGuns",
		"Navigation",
		"OpticAttachments",
		"Pistols",
		"PointerAttachments",
		"Shotguns",
		"Smokes",
		"SniperRifles",
		"StaticMGs",
		"SubMachineGuns",
		"Tools",
		"Uniforms",
		"Vests"
	];

//////////////////////////////////////////////////////////////////////////////////////////



//////////////////////////////////////////////////////////////////////////////////////////
//    CAS Settings                                                                      //
//////////////////////////////////////////////////////////////////////////////////////////
	AIS_Cas_TrackAircraftOnMap = true;  //Adds a marker to them for the crate's location

	// Available aircraft for CAS
	//[Class Name, Description, Cost, Respect, Required Items, RespectEarned]	
	AIS_Cas_Units = [
		["B_Plane_CAS_01_F", "", 4500, 5000, ["ItemRadio"], 15],
		["I_Plane_Fighter_03_CAS_F", "", 4500, 5000, ["ItemRadio"], 15],
		["O_Heli_Light_02_F", "", 1000, 1500, ["ItemRadio"], 10],
		["O_Heli_Light_02_v2_F", "", 1000, 1500, ["ItemRadio"], 10],
		["B_Heli_Light_01_armed_F", "", 1000, 1500, ["ItemRadio"], 10],
		["B_Heli_Attack_01_F", "", 1000, 1500, ["ItemRadio"], 10],
		["O_Heli_Attack_02_F", "", 1000, 1500, ["ItemRadio"], 15]
	];



//////////////////////////////////////////////////////////////////////////////////////////

ExileClientPlayerScore = 99999;

	/////////////////////////////
	//  Fire Mission Settings  //
	/////////////////////////////
	//Support Levesl: ["Level", "MinRespect", "Cost", "Seconds of Support", "Number of Rounds Fired", "Impact Radius (m)"]	
	AIS_FireMission_SupportLevels = [
									[1, 500, 5000, 200, 4, 60], 
									[2, 1000, 8000, 300, 45], 
									[3, 20000, 12000, 400, 25], 
									[4, 30000, 15000, 500, 10] 
								];
	AIS_FireMission_TeamMinResetTime				= 20;
	AIS_FireMission_TeamMaxResetTime				= 120;
	AIS_FireMission_TeamRandResetTime				= true;
	AIS_FireMission_TeamResetTime					= 45;		//Only if AIS_FireMission_TeamRandResetTime = false

	//////////////////////////// 
 	//  Air Support Settings  //
	////////////////////////////	
	//Support Levesl: ["Level", "MinRespect", "Cost", "Seconds of Support", "Unit's Skill Level (0-1)"]	
	AIS_AirSupport_SupportLevels = [
									[1, 500, 5000, 200, .2], 
									[2, 1000, 8000, 300, .4], 
									[3, 20000, 12000, 400, .6], 
									[4, 30000, 15000, 500, .8] 
								];

	//////////////////////////////
 	//  Reinforcement Settings  //
	//////////////////////////////
	//Support Levesl: ["Level", "MinRespect", "Cost", "Number of Support Troops", "Support Troop Skill Level (0-1)"]	
	AIS_Reinforcements_SupportLevels = [
									[1, 500, 5000, 2, .2], 
									[2, 1000, 8000, 4, .4], 
									[3, 20000, 12000, 5, .6], 
									[4, 30000, 15000, 6, .8]
								];




AIS_Reinforcement_Units = [
	[
		"Engineer",		
		"\a3\Ui_F_Curator\Data\Displays\RscDisplayCurator\modeUnits_ca.paa"
	],
	[
		"Assault Squad",		
		"\a3\Ui_F_Curator\Data\Displays\RscDisplayCurator\modeGroups_ca.paa"
	]
];

// [VehicleClass, Description, Cost, Rep, Required Gear]
/*
  VehicleClass can be a string or an array. If it is a string, it will use
  the Arma Class information for the vehicle. To change the display name or
  the image of a unit, use the array shown below:
	[
		"B_Plane_CAS_01_F", 
		"Awesome Plane Level 1", 
		"\a3\Ui_F_Curator\Data\Displays\RscDisplayCurator\modeGroups_ca.paa"
	]	
*/



//[Class [Class Name, Title], Description, Cost, Respect, Required Items, Min Rounds To Fire, Max Rounds To Fire, Accuracy,  RespectEarned per round fired]	
AIS_Artillery_Units = [
	[
		[
			"B_Mortar_01_F", 
			"Mortars Level I"
		], 
		"Less accurate mortar fire.", 
		1000, 500, ["ItemRadio"], 1, 2, 200, 3
	],		
	[
		[
			"B_Mortar_01_F", 
			"Mortars Level II"
		], 
		"Fairly accurate mortar fire.", 
		2500, 1500, ["ItemRadio"], 1, 3, 100, 5
	],		
	[
		[
			"B_Mortar_01_F", 
			"Mortars Level III"
		], 
		"Very accurate mortar fire.", 
		3500, 3500, ["ItemRadio"], 1, 4, 25, 10
	],		
	["B_MBT_01_mlrs_F", "", 2500, 1500, ["ItemRadio"], 1, 3, 75, 15],
	["B_MBT_01_arty_F", "", 3500, 3500, ["ItemRadio"], 1, 2, 75, 15] 
];								
	
	
	AIS_ConfigLoaded = true;