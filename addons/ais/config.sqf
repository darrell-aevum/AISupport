	
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
	AIS_Resupply_IncludePrimaryMapAirSpawnPoints = false;
	AIS_Resupply_IncludeSecondaryMapAirSpawnPoints = false;
	// Available vehicles for supply delivery
	//[Class Name, Description, Cost, Respect, Required Items, RespectEarned, Spawn Positions]	
	AIS_Resupply_Delivery_Vehicles = [
		["B_G_Van_01_transport_F", "", 500, 500, ["ItemRadio"], 5],
		["B_Truck_01_transport_F", "", 1000, 1500, ["ItemRadio"], 10],		  
		["B_Heli_Light_01_F", "", 2500, 5000, ["ItemRadio", "SmokeShell"], 15],			
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
	AIS_Cas_IncludePrimaryMapSpawnPoints = false;
	AIS_Cas_IncludeSecondaryMapSpawnPoints = false;
	// Available aircraft for CAS
	//[Class Name, Description, Cost, Respect, Required Items, RespectEarned, Spawn Positions [position, Dir and Up, allow dammage, special]]	
	AIS_Cas_Units = [
		["B_Plane_CAS_01_F", "", 4500, 5000, ["ItemRadio"], 15],
		["I_Plane_Fighter_03_CAS_F", "", 4500, 5000, ["ItemRadio"], 15],
		["O_Heli_Light_02_F", "", 1000, 1500, ["ItemRadio"], 10],
		["O_Heli_Light_02_v2_F", "", 1000, 1500, ["ItemRadio"], 10],
		["B_Heli_Light_01_armed_F", "", 1000, 1500, ["ItemRadio"], 10],
		["B_Heli_Attack_01_F", "", 1000, 1500, ["ItemRadio"], 10],
		[
			"O_Heli_Attack_02_F", 
			"", 
			1000, 
			1500, 
			["ItemRadio"], 
			15
		]
	];



//////////////////////////////////////////////////////////////////////////////////////////
 
 



//////////////////////////////////////////////////////////////////////////////////////////
//    Artillery Settings                                                                //
//////////////////////////////////////////////////////////////////////////////////////////

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
	
 //////////////////////////////////////////////////////////////////////////////////////////


	AIS_ConfigLoaded = true;