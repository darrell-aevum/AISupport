onMapSingleClick "mapclick = false; false"; 

switch (AIS_SelectedSupportType) do {
    case "artillery": 
    { 
        _index = lbCurSel AIS_Dialog_Artillery_RoundTypeToFire;          
        _shellType = lbData [AIS_Dialog_Artillery_RoundTypeToFire, _index];

        _index =  lbCurSel AIS_Dialog_Artillery_RoundNumberToFire; 
        _shellCount = lbValue [AIS_Dialog_Artillery_RoundNumberToFire, _index];
 
        [_shellCount, _shellType, targetPos] spawn AIS_Client_fnc_FireVirtualArtillery;
        targetPos = nil;
    };
    case "cas": 
    { 
        _index = lbCurSel AIS_Dialog_Cas_UnitList;          
        _aircraftType = lbData [AIS_Dialog_Cas_UnitList, _index];

        _index =  lbCurSel AIS_Dialog_Cas_Duration; 
        _duration = lbValue [AIS_Dialog_Cas_Duration, _index];
 
        [_aircraftType, _duration] spawn AIS_Client_fnc_LaunchVirtualCas;
        targetPos = nil;
    };    
};

closeDialog AIS_Dialog;
AIS_SelectedSupportType = nil;