 
AIS_Cas_Plane_SpawnPoints = [    
    ["LRA",[12190.2,12971.4,6.95],[[0.249946,0.96826,0],[0,0,1]], 500, 500],
    ["SGA", [11738.8,3136.98,4.87],[[-0.606496,-0.795087,0],[0,0,1]], 500, 500],     
    ["TAB", [2234.65,13412.3,13.45],[[0.617126,-0.786864,0],[0,0,1]], 500, 500], 
    ["Tanoa Airport",[6956.67,7180.26,2.66],[[0,1,0],[0,0,1]], 500, 500]
]; 
//Available Spawn Points [Make sure that the aircract can actually take off and land from these positions!!]
//[(0) Name, (1) Position, (2) Dir and Up, (3) Cost, (4) Respect, (4) Required Items
AIS_Cas_Heli_SpawnPoints  = [ 
    ["LZ Bala",[2140.62,3443.87,12.95],[[-0.185929,0.982563,0],[0,0,1]], 500, 500], 
    ["LZ Dome",[11681.1,13104.7,6.95],[[0.31443,0.949281,0],[0,0,1]], 500, 500],      
    ["LZ St. George",[11629.6,3099.54,4.7063],[[0.899711,0.436486,0],[0,0,1]], 500, 500], 
    ["LZ Tanoa",[6872.58,7288.63,2.66],[[0.995438,-0.0954114,0],[0,0,1]], 500, 500], 
    ["LZ Tuvanaka", [2419.44,13336.3,12.8333],[[-0.0216828,0.999765,0],[0,0,1]], 500, 500]
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
 
