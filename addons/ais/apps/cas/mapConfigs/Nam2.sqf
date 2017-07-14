

AIS_Cas_Plane_SpawnPoints = [ 
    ["Da Nang Air Base", [15978,9454.84,81.3692],[[-0.850408,0.526123,0],[0,0,1]], 1000, 15500] //0    
];

//Available Spawn Points [Make sure that the aircract can actually take off and land from these positions!!]
//[(0) Name, (1) Position, (2) Dir and Up, (3) Cost, (4) Respect, (4) Required Items
AIS_Cas_Heli_SpawnPoints  = [
    ["LZ Dot", [11835,9415.24,2.51486],[[-0.0252767,0.999681,0],[0,0,1]], 500, 500], //0
    ["LZ English", [8092.42,11332.3,13.8911],[[0.999527,-0.0307582,0],[0,0,1]], 500, 500], //1
    ["LZ Hereford", [9608.76,5544.51,50.5889],[[-0.619626,-0.784898,0],[0,0,1]], 500, 500], //2
    ["LZ Kate", [5863.23,13538.6,4.17712],[[-0.9051,0.425199,0],[0,0,1]], 500, 500], //3    
    ["LZ Mack", [5845.67,13502.3,4.17198],[[-0.905952,0.42338,0],[0,0,1]], 500, 500], //4    
    ["LZ Margo", [15978,9454.84,81.3692],[[-0.850408,0.526123,0],[0,0,1]], 500, 500], //5
    ["LZ Schueller", [5828.47,13466.5,4.16881],[[-0.912562,0.408939,0],[0,0,1]], 500, 500], //5
    ["LZ Sierra", [4090.82,14397.8,4.1861],[[0,1,0],[0,0,1]], 500, 500], //7
    ["LZ Uplift", [5880.58,13574.3,4.17198],[[-0.898276,0.439431,0],[0,0,1]], 500, 500], //8
    ["LZ Virgin", [4065.71,14425.7,4.243],[[0.00131366,0.999999,0],[0,0,1]], 500, 500], //9
    ["LZ X Ray", [5911.31,13603,3],[[-0.901615,0.432539,0],[0,0,1]], 500, 500] //10
];

// Available aircraft for CAS
//[(0) Class Name, (1) Description, (2) Cost, (3) Respect, (4) Required Items, (5) RespectEarned/Lost, (6) Spawn Positions [see format from AIS_Cas_Heli_SpawnPoints], (7) Duration [minutes, cost]]	
AIS_Cas_Units = [
    ["UNS_skymaster_CAS", "", 4500, 5000, ["ItemRadio"], 15, nil, [[3, 4500, 5000], [5, 9000, 15000], [10, 12000, 35000]]],
    ["uns_UH1C_M6_M200", "", 4500, 5000, ["ItemRadio"], 15, AIS_Cas_Heli_SpawnPoints, [[3, 4500, 5000], [5, 9000, 15000], [10, 12000, 35000]]],
    ["uns_A1J_CAS", "", 1000, 1500, ["ItemRadio"], 10, nil, [[3, 4500, 5000], [5, 9000, 15000], [10, 12000, 35000]]],
    ["UNS_UH1B_TOW", "", 1000, 1500, ["ItemRadio"], 10, AIS_Cas_Heli_SpawnPoints, [[3, 4500, 5000], [5, 9000, 15000], [10, 12000, 35000]]],
    ["uns_A4B_skyhawk_CAS", "", 1000, 1500, ["ItemRadio"], 10, nil, [[3, 4500, 5000], [5, 9000, 15000], [10, 12000, 35000]]],
    ["UNS_AH1G", "", 1000, 1500, ["ItemRadio"], 10, AIS_Cas_Heli_SpawnPoints, [[3, 4500, 5000], [5, 9000, 15000], [10, 12000, 35000]]],
    ["uns_A7N_CAS", "", 1000, 1500, ["ItemRadio"], 10, nil, [[3, 4500, 5000], [5, 9000, 15000], [10, 12000, 35000]]],    
    ["uns_A7_CAS", "", 1000, 1500, ["ItemRadio"], 10, nil, [[3, 4500, 5000], [5, 9000, 15000], [10, 12000, 35000]]],    
    ["uns_f100b_CAS", "", 1000, 1500, ["ItemRadio"], 10, nil, [[3, 4500, 5000], [5, 9000, 15000], [10, 12000, 35000]]],    
    ["uns_A6_Intruder_CAS", "", 1000, 1500, ["ItemRadio"], 10, nil, [[3, 4500, 5000], [5, 9000, 15000], [10, 12000, 35000]]],    
    ["uns_F4E_CAS", "", 1000, 1500, ["ItemRadio"], 10, nil, [[3, 4500, 5000], [5, 9000, 15000], [10, 12000, 35000]]],    
    ["uns_F4J_CAS", "", 1000, 1500, ["ItemRadio"], 10, nil, [[3, 4500, 5000], [5, 9000, 15000], [10, 12000, 35000]]],    
    ["uns_f105D_CAS", "", 1000, 1500, ["ItemRadio"], 10, nil, [[3, 4500, 5000], [5, 9000, 15000], [10, 12000, 35000]]],    
    ["UNS_F111_D_CAS", "", 1000, 1500, ["ItemRadio"], 10, nil, [[3, 4500, 5000], [5, 9000, 15000], [10, 12000, 35000]]] 
];
 
