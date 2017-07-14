
AIS_Cas_Plane_SpawnPoints = [     
    ["AB1",[14154.5,15904.6,17.905],[[0.493677,-0.869645,0],[0,0,1]], 5500, 25000],
    ["AB2",[15147,16886.1,17.91],[[0.430205,-0.902731,0],[0,0,1]], 3500, 10000] 
]; 
//Available Spawn Points [Make sure that the aircract can actually take off and land from these positions!!]
//[(0) Name, (1) Position, (2) Dir and Up, (3) Cost, (4) Respect, (4) Required Items
AIS_Cas_Heli_SpawnPoints  = [ 
    ["LZ Molos",[26833.8,24625.4,22.3821],[[0.761806,-0.647805,0],[0,0,1]], 500, 500], 
    ["LZ Zulu",[23483.8,21144,90.44],[[0,1,0],[0,0,1]], 500, 500], 
    ["LZ Sela",[20799.4,7225.72,29.105],[[-0.548291,0.836287,0],[0,0,1]], 500, 500], 
    ["LZ Pyrgos",[17549.2,13238.3,13.0762],[[0.675476,0.737382,0],[0,0,1]], 500, 500], 
    ["LZ Dobbs",[12877.8,16739.4,84.6126],[[-0.777132,0.629338,0],[0,0,1]], 500, 500], 
    ["LZ Tengo",[15135.8,17227.5,17.91],[[0.737684,-0.675146,0],[0,0,1]], 500, 500], 
    ["LZ AAC",[11580.1,11907,23.196],[[-0.857609,0.514302,0],[0,0,1]], 500, 500], 
    ["LZ Kavala",[3733.67,12976.5,38.362],[[-0.999891,-0.0147672,0],[0,0,1]], 500, 500], 
    ["LZ Harv",[9907.02,19423.1,234.779],[[0,1,0],[0,0,1]], 500, 500] 
];

// Available aircraft for CAS
//[(0) Class Name, (1) Description, (2) Cost, (3) Respect, (4) Required Items, (5) RespectEarned/Lost, (6) Spawn Positions [see format from AIS_Cas_Heli_SpawnPoints], (7) Duration [minutes, cost]]	
AIS_Cas_Units = [ 
    ["B_Heli_Light_01_dynamicLoadout_F", "", 4500, 5000, ["ItemRadio"], 15, AIS_Cas_Heli_SpawnPoints, [[3, 4500, 5000], [5, 9000, 15000], [10, 12000, 35000]]],            
    ["B_Heli_Attack_01_dynamicLoadout_F", "", 4500, 5000, ["ItemRadio"], 15, AIS_Cas_Heli_SpawnPoints, [[3, 4500, 5000], [5, 9000, 15000], [10, 12000, 35000]]],    
    ["O_Heli_Light_02_v2_F", "", 4500, 5000, ["ItemRadio"], 15, AIS_Cas_Heli_SpawnPoints, [[3, 4500, 5000], [5, 9000, 15000], [10, 12000, 35000]]],    
    ["O_Heli_Attack_02_dynamicLoadout_F", "", 4500, 5000, ["ItemRadio"], 15, AIS_Cas_Heli_SpawnPoints, [[3, 4500, 5000], [5, 9000, 15000], [10, 12000, 35000]]],            
    ["B_Plane_CAS_01_dynamicLoadout_F", "", 4500, 5000, ["ItemRadio"], 15, AIS_Cas_Plane_SpawnPoints, [[3, 4500, 5000], [5, 9000, 15000], [10, 12000, 35000]]],    
    ["I_Plane_Fighter_03_CAS_F", "", 4500, 5000, ["ItemRadio"], 15, AIS_Cas_Plane_SpawnPoints, [[3, 4500, 5000], [5, 9000, 15000], [10, 12000, 35000]]],
    ["O_Plane_CAS_02_dynamicLoadout_F", "", 4500, 5000, ["ItemRadio"], 15, AIS_Cas_Plane_SpawnPoints, [[3, 4500, 5000], [5, 9000, 15000], [10, 12000, 35000]]]            
];
 