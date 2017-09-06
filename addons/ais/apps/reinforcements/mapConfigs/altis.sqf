//////////////////////////////////////////////////////////////////////////////////////////
//    Reinforcements Settings                                                           //
//////////////////////////////////////////////////////////////////////////////////////////
AIS_Reinforcements_InsertionFee = .10;               //10% of total crate
AIS_Reinforcements_UnitMarkup = .35;                //35% of trader price
AIS_Reinforcements_Lifespan = 0;              // 0 is infinate
AIS_Reinforcements_TrackInsertionVehicleOnMap = true;  //Adds a marker to them for the crate's location	
AIS_Reinforcements_IncludePrimaryMapAirSpawnPoints = false;
AIS_Reinforcements_IncludeSecondaryMapAirSpawnPoints = false;
 
//Available Spawn Points [Make sure that the aircract can actually take off and land from these positions!!]
//  (0) Name, 
//  (1) Position, 
//  (2) Dir and Up, 
//  (3) Cost, 
//  (4) Respect, 
//  (4) Required Items
AIS_Reinforcements_Insertion_Heli_SpawnPoints  = [ 
    ["LZ Dobbs",[12877.8,16739.4,84.6126],[[-0.777132,0.629338,0],[0,0,1]], 500, 500], 
    ["LZ Molos",[26833.8,24625.4,22.3821],[[0.761806,-0.647805,0],[0,0,1]], 500, 500], 
    ["LZ Zulu",[23483.8,21144,90.44],[[0,1,0],[0,0,1]], 500, 500], 
    ["LZ Sela",[20799.4,7225.72,29.105],[[-0.548291,0.836287,0],[0,0,1]], 500, 500], 
    ["LZ Pyrgos",[17549.2,13238.3,13.0762],[[0.675476,0.737382,0],[0,0,1]], 500, 500],     
    ["LZ Tengo",[15135.8,17227.5,17.91],[[0.737684,-0.675146,0],[0,0,1]], 500, 500], 
    ["LZ AAC",[11580.1,11907,23.196],[[-0.857609,0.514302,0],[0,0,1]], 500, 500], 
    ["LZ Kavala",[3733.67,12976.5,38.362],[[-0.999891,-0.0147672,0],[0,0,1]], 500, 500], 
    ["LZ Harv",[9907.02,19423.1,234.779],[[0,1,0],[0,0,1]], 500, 500] 
];

//Insertion Types
//  (0) Description, 
//  (1) Cost, 
//  (2) Respect,
//  (3) Vics 
_insertionType_groundTransport_vics = [
    ["B_LSV_01_unarmed_F", "", 4500, 5000, ["ItemRadio"], 15, AIS_Reinforcements_Insertion_Heli_SpawnPoints, [[3, 4500, 5000], [5, 9000, 15000], [10, 12000, 35000]]],
    ["B_T_Truck_01_transport_F", "", 4500, 5000, ["ItemRadio"], 15, AIS_Reinforcements_Insertion_Heli_SpawnPoints, [[3, 4500, 5000], [5, 9000, 15000], [10, 12000, 35000]]]    
];
_insertionType_airTransport_vics = [
    ["B_Heli_Transport_03_F", "", 4500, 5000, ["ItemRadio"], 15, AIS_Reinforcements_Insertion_Heli_SpawnPoints, [[3, 4500, 5000], [5, 9000, 15000], [10, 12000, 35000]]],
    ["B_T_Truck_01_transport_F", "", 4500, 5000, ["ItemRadio"], 15, AIS_Reinforcements_Insertion_Heli_SpawnPoints, [[3, 4500, 5000], [5, 9000, 15000], [10, 12000, 35000]]]    
];
_insertionType_airRappel_vics = [
    ["B_Heli_Transport_03_F", "", 4500, 5000, ["ItemRadio"], 15, AIS_Reinforcements_Insertion_Heli_SpawnPoints, [[3, 4500, 5000], [5, 9000, 15000], [10, 12000, 35000]]],
    ["B_T_Truck_01_transport_F", "", 4500, 5000, ["ItemRadio"], 15, AIS_Reinforcements_Insertion_Heli_SpawnPoints, [[3, 4500, 5000], [5, 9000, 15000], [10, 12000, 35000]]]    
];
_insertionType_airPara_vics = [
    ["B_Heli_Transport_03_F", "", 4500, 5000, ["ItemRadio"], 15, AIS_Reinforcements_Insertion_Heli_SpawnPoints, [[3, 4500, 5000], [5, 9000, 15000], [10, 12000, 35000]]],
    ["B_T_Truck_01_transport_F", "", 4500, 5000, ["ItemRadio"], 15, AIS_Reinforcements_Insertion_Heli_SpawnPoints, [[3, 4500, 5000], [5, 9000, 15000], [10, 12000, 35000]]]    
];

_insertionType_groundTransport = ["Ground - Transport", 500, 5000, _insertionType_groundTransport_vics];
_insertionType_airTransport = ["Air - Transport", 2000, 15000, _insertionType_airTransport_vics];
_insertionType_airPara = ["Air - Paradrop", 3500, 45000, _insertionType_airRappel_vics];
_insertionType_airRappel = ["Air - Rappel", 5500, 65000, _insertionType_airPara_vics];

AIS_Reinforcements_InsertionTypes = [
    _insertionType_groundTransport,
    _insertionType_airTransport,
    _insertionType_airPara,
    _insertionType_airRappel
];

 
AIS_Reinforcements_Insertion_Plane_SpawnPoints  = [ 
];

AIS_Reinforcements_Insertion_GroundVic_SpawnPoints  = [  
];

// Available aircraft for CAS
//  (0) Class Name, 
//  (1) Description, 
//  (2) Cost, 
//  (3) Respect, 
//  (4) Required Items, 
//  (5) RespectEarned/Lost, 
//  (6) Spawn Positions [see format from AIS_Cas_Heli_SpawnPoints], 
//  (7) Duration [minutes, cost], 
//  (8) Insertion Types	
AIS_Reinforcements_Insertion_Vehicles = [ 
    [
        "B_Heli_Transport_03_F", 
        "", 
        4500, 
        5000, 
        ["ItemRadio"], 
        15, 
        AIS_Reinforcements_Insertion_Heli_SpawnPoints, 
        [
            [3, 4500, 5000], 
            [5, 9000, 15000], 
            [10, 12000, 35000]
        ] 
    ],
    [
        "B_T_Truck_01_transport_F", 
        "", 
        4500, 
        5000, 
        ["ItemRadio"], 
        15, 
        AIS_Reinforcements_Insertion_Heli_SpawnPoints, 
        [
            [3, 4500, 5000], 
            [5, 9000, 15000], 
            [10, 12000, 35000]
        ] 
    ]    
]; 

//[
//  (0) Class Name, 
//  (1) Description, 
//  (2) Cost, 
//  (3) Respect, 
//  (4) Required Item(s), 
//  (5) RespectEarned/Lost 
//]	
AIS_Reinforcements_Units = [    
    ["B_soldier_A_F", "", 500, 500, ["ItemRadio"], 5],    
    ["B_soldier_AR_F", "", 500, 500, ["ItemRadio"], 5],       
    ["B_medic_F", "", 500, 500, ["ItemRadio"], 5],    
    ["B_crew_F", "", 500, 500, ["ItemRadio"], 5],
    ["B_engineer_F", "", 500, 500, ["ItemRadio"], 5],    
    ["B_soldier_GL_F", "", 500, 500, ["ItemRadio"], 5],    
    ["B_HeavyGunner_F", "", 500, 500, ["ItemRadio"], 5],        
    ["B_soldier_M_F", "", 500, 500, ["ItemRadio"], 5],
    ["B_soldier_AT_F", "", 500, 500, ["ItemRadio"], 5],     
    ["B_soldier_AA_F", "", 500, 500, ["ItemRadio"], 5],      
    ["B_Soldier_F", "", 500, 500, ["ItemRadio"], 5],
    ["B_soldier_LAT_F", "", 500, 500, ["ItemRadio"], 5],        
    ["B_Sharpshooter_F", "", 500, 500, ["ItemRadio"], 5],                
    ["B_sniper_F", "", 500, 500, ["ItemRadio"], 5],
    ["B_Soldier_TL_F", "", 500, 500, ["ItemRadio"], 5]

];

//  (0) Name, 
//  (1) Description, 
//  (2) Cost, 
//  (3) Respect, 
//  (4) Required Item(s), 
//  (5) RespectEarned/Lost 
AIS_Reinforcements_Teams = [
    [
        "Anti-Armor Team", "", 500, 500, ["ItemRadio"], 5,
        [
            "B_soldier_AAT_F",
            "B_soldier_AT_F",
            "B_soldier_AT_F" 
        ]			
    ],
    [
        "Fire Team", "", 500, 500, ["ItemRadio"], 5,
        [
            "B_soldier_AAT_F",
            "B_soldier_LAT_F",
            "B_soldier_GL_F" 
        ]			
    ],
    [
        "Recon Patrol", "", 500, 500, ["ItemRadio"], 5,
        [
            "B_recon_F",
            "B_recon_M_F",            
            "B_recon_medic_F"
        ]			
    ],
    [
        "Sniper Team", "", 500, 500, ["ItemRadio"], 5,
        [
            "B_sniper_F",
            "B_spotter_F"            
        ]			
    ]  
];	 

//  (0) Name, 
//  (1) Description, 
//  (2) Cost, 
//  (3) Respect, 
//  (4) Required Item(s), 
//  (5) RespectEarned/Lost 
AIS_Reinforcements_Squads = [
    [
        "Assault Squad", "", 500, 500, ["ItemRadio"], 5,
        [
            "B_medic_F",
            "B_Sharpshooter_F",
            "B_soldier_AAR_F",
            "B_soldier_AR_F",
            "B_HeavyGunner_F",
            "B_soldier_M_F",
            "B_soldier_LAT_F"
        ]			
    ],
    [
        "Rifle Squad", "", 500, 500, ["ItemRadio"], 5,
        [
            "B_medic_F",
            "B_soldier_AR_F",
            "B_soldier_M_F",
            "B_soldier_F",
            "B_soldier_LAT_F",
            "B_Soldier_TL_F",
            "B_soldier_A_F"
        ]			
    ] 
];	 