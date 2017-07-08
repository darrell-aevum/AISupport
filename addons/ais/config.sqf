	
	AIS_HQCallSign									= "Pegusus 6";
	AIS_Side										= INDEPENDENT;

	_nam2_heli_spawns = [
		[[15978,9454.84,81.3692],[[-0.850408,0.526123,0],[0,0,1]],true],
		[[9608.76,5544.51,50.5889],[[-0.619626,-0.784898,0],[0,0,1]],true],
		[[11835,9415.24,2.51486],[[-0.0252767,0.999681,0],[0,0,1]],true],
		[[8092.42,11332.3,13.8911],[[0.999527,-0.0307582,0],[0,0,1]],true],
		[[5828.47,13466.5,4.16881],[[-0.912562,0.408939,0],[0,0,1]],true],
		[[5845.67,13502.3,4.17198],[[-0.905952,0.42338,0],[0,0,1]],true],
		[[5863.23,13538.6,4.17712],[[-0.9051,0.425199,0],[0,0,1]],true],
		[[5880.58,13574.3,4.17198],[[-0.898276,0.439431,0],[0,0,1]],true],
		[[5911.31,13603,3],[[-0.901615,0.432539,0],[0,0,1]],true],
		[[4065.71,14425.7,4.243],[[0.00131366,0.999999,0],[0,0,1]],true],
		[[4090.82,14397.8,4.1861],[[0,1,0],[0,0,1]],true]
	];

//////////////////////////////////////////////////////////////////////////////////////////
//    Reinforcements Settings                                                           //
//////////////////////////////////////////////////////////////////////////////////////////
	AIS_Reinforcements_InsertionFee = .10;               //10% of total crate
	AIS_Reinforcements_UnitMarkup = .35;                //35% of trader price
	AIS_Reinforcements_Lifespan = 0;              // 0 is infinate
	AIS_Reinforcements_TrackInsertionVehicleOnMap = true;  //Adds a marker to them for the crate's location	
	AIS_Reinforcements_IncludePrimaryMapAirSpawnPoints = false;
	AIS_Reinforcements_IncludeSecondaryMapAirSpawnPoints = false;
	
	//[Class Name, Description, Cost, Respect, Required Items, RespectEarned, Spawn Positions]	

	AIS_Reinforcements_Insertion_Vehicles = [
		["uns_h21c", "", 500, 500, ["ItemRadio"], 5, _nam2_heli_spawns],
		["uns_UH1D_m60", "", 1000, 1500, ["ItemRadio"], 10, _nam2_heli_spawns],		  
		["uns_ach47_m134", "", 2500, 5000, ["ItemRadio", "SmokeShell"], 15, _nam2_heli_spawns],			
		["uns_ch47_m60_army", "", 2500, 5000, ["ItemRadio", "SmokeShell"], 15, _nam2_heli_spawns],			
		["uns_ch34_sog", "", 2500, 5000, ["ItemRadio", "SmokeShell"], 15, _nam2_heli_spawns]
	];

	// [Class, Description, Cost, Rep, Required Items, Respect Earned / Lost]
	AIS_Reinforcements_Insertion_Soldiers = [
		["uns_men_USMC_68_HMG", "", 500, 500, ["ItemRadio"], 5],
		["uns_men_USMC_68_MED", "", 500, 500, ["ItemRadio"], 5],
		["uns_men_USMC_68_RTO", "", 500, 500, ["ItemRadio"], 5],
		["uns_men_USMC_68_MTSG", "", 500, 500, ["ItemRadio"], 5],
		["uns_men_USMC_68_GL", "", 500, 500, ["ItemRadio"], 5],
		["uns_men_USMC_68_RF4", "", 500, 500, ["ItemRadio"], 5],
		["uns_men_USMC_68_MRK", "", 500, 500, ["ItemRadio"], 5],
		["uns_men_USMC_68_AHMG", "", 500, 500, ["ItemRadio"], 5],
		["uns_men_USMC_68_SCT", "", 500, 500, ["ItemRadio"], 5],
		["uns_men_USMC_68_RF2", "", 500, 500, ["ItemRadio"], 5],
		["uns_men_USMC_68_ENG", "", 500, 500, ["ItemRadio"], 5]
	];
	// [Name, Description, Cost, Rep, Required Items, Respect Earned / Lost, Squad Members]
	AIS_Reinforcements_Insertion_Squads = [
		[
			"Heavy Weapons Squad", "", 500, 500, ["ItemRadio"], 5,
			[
				"uns_men_USMC_68_HMG",
				"uns_men_USMC_68_MED",
				"uns_men_USMC_68_RTO",
				"uns_men_USMC_68_MTSG",
				"uns_men_USMC_68_GL",
				"uns_men_USMC_68_RF4",
				"uns_men_USMC_68_MRK",
				"uns_men_USMC_68_AHMG",
				"uns_men_USMC_68_SCT",
				"uns_men_USMC_68_RF2",
				"uns_men_USMC_68_RF2",
				"uns_men_USMC_68_ENG"
			]			
		],
		[
			"Rifle Squad", "", 500, 500, ["ItemRadio"], 5,
			[
				"uns_men_USMC_68_ENG",
				"uns_men_USMC_68_HMG",
				"uns_men_USMC_68_MED",
				"uns_men_USMC_68_RTO",
				"uns_men_USMC_68_SCT",
				"uns_men_USMC_68_GL",
				"uns_men_USMC_68_MRK"
			]			
		] 
	];	 

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
		["B_Heli_Light_01_F", "", 2500, 5000, ["ItemRadio", "SmokeShell"], 15, _nam2_heli_spawns],			
		["B_Heli_Transport_03_unarmed_F", "", 2500, 5000, ["ItemRadio", "SmokeShell"], 15, _nam2_heli_spawns],
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
		["O_Heli_Light_02_F", "", 1000, 1500, ["ItemRadio"], 10, _nam2_heli_spawns],
		["O_Heli_Light_02_v2_F", "", 1000, 1500, ["ItemRadio"], 10, _nam2_heli_spawns],
		["B_Heli_Light_01_armed_F", "", 1000, 1500, ["ItemRadio"], 10, _nam2_heli_spawns],
		["B_Heli_Attack_01_F", "", 1000, 1500, ["ItemRadio"], 10, _nam2_heli_spawns] 
	];
 
  

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