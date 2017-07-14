 
AIS_Cas_Plane_SpawnPoints = [ 
    ["SAB South", [1721.93,5196.79,5.5],[[-0.952707,0.303891,0],[0,0,1]], 500, 500], 
    ["SAB North", [1913.47,5900.61,5.5],[[-0.897334,-0.441352,0],[0,0,1]], 500, 500]         
]; 
//Available Spawn Points [Make sure that the aircract can actually take off and land from these positions!!]
//[(0) Name, (1) Position, (2) Dir and Up, (3) Cost, (4) Respect, (4) Required Items
AIS_Cas_Heli_SpawnPoints  = [
    ["LZ Connor", [2980.87,1868.13,0],[[0.990452,0.137859,0],[0,0,1]], 500, 500], 
    ["LZ Maxwell", [3352.58,2906.11,0],[[0,1,0],[0,0,1]], 500, 500], 
    ["LZ Rogain", [5027.24,5903.17,208.62],[[0,1,0],[0,0,1]], 500, 500],
    ["LZ SAB", [1884.81,5729.03,5.54719],[[0.969687,-0.244349,0],[0,0,1]], 500, 500],   
    ["LZ Tempest", [1977.96,3528.06,0],[[0.990452,0.137859,0],[0,0,1]], 500, 500] 
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
 
