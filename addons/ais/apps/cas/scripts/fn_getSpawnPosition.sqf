AIS_Apps_CAS_GetSpawnPositions = {
    params["_guiPosition"];

    disableSerialization;    
    _display = uiNameSpace getVariable ['RscExileXM8', displayNull];
 
    AIS_Dialog_CAS_SelectedUnit = lbCurSel AIS_Dialog_CAS_UnitListBox;    
	AIS_Dialog_CAS_SelectedSpawnPoint = lbCurSel AIS_Dialog_CAS_SpawnPositionsComboBox;
    AIS_Dialog_CAS_SelectedDuration = lbCurSel AIS_Dialog_CAS_DurationComboBox;

    _unit = AIS_CAS_Units select AIS_Dialog_CAS_SelectedUnit;      
    spawnPositions = if (!isNil { _unit select 6 }) then [{ _unit select 6}, {[]}];   
   
    _mapDisplay = findDisplay 12;
    
	_spawnListBox = _mapDisplay displayCtrl AIS_Dialog_CAS_SpawnListBox;
    lbCLear _spawnListBox;    
    _spawnListBox lbSetCurSel -1;

    _mapCloseButton = _mapDisplay displayCtrl AIS_Dialog_CAS_MapCloseButton;
	    
    openMap true; 

    {
        _spawnListBox lbAdd format["%1", (_x select 0)];  

        _markerName = format["AIS_CAS_SPAWN_%1", _forEachIndex];
        deleteMarker _markerName;
        _marker = createMarker[_markerName, _x select 1];
        _marker setMarkerType 'Select';
        _marker setMarkerSize[0.8, 0.8];
        _marker setMarkerColor 'ColorBlue';
        _marker setMarkerText (_x select 0);
        
    } forEach spawnPositions;      
 
    _spawnListBox lbSetCurSel (AIS_Dialog_CAS_SelectedSpawnPoint - 1);

    _spawnListBox ctrlShow true;
    _mapCloseButton ctrlShow true;
 
    closeDialog 0; 

    waituntil {!visibleMap};
  
    _mapDisplay = findDisplay 12;
 	_spawnListBox = _mapDisplay displayCtrl AIS_Dialog_CAS_SpawnListBox;
    _mapCloseButton = _mapDisplay displayCtrl AIS_Dialog_CAS_MapCloseButton;
    _spawnListBox ctrlShow false;
    _mapCloseButton ctrlShow false;

    {       
        _markerName = format["AIS_CAS_SPAWN_%1", _forEachIndex];
        deleteMarker _markerName;
    } forEach spawnPositions; 
 
    //["_display","_control","_slideControlID","_slideName","_slideTitle","_slideControl","_titleControl","_toSlideOpenFunction"]
    [] call ExileClient_gui_xm8_show; 


/*
    waituntil{(lbCurSel AIS_Dialog_CAS_UnitListBox) >= 0};
    waituntil{(lbCurSel AIS_Dialog_CAS_DurationComboBox) >= 0};
    
    lbSetCurSel [AIS_Dialog_CAS_UnitListBox, -1];
    lbSetCurSel [AIS_Dialog_CAS_UnitListBox, _selectedUnitIndex];

    lbSetCurSel [AIS_Dialog_CAS_DurationComboBox, -1];
    lbSetCurSel [AIS_Dialog_CAS_DurationComboBox, _selectedDurationIndex];

    lbSetCurSel [AIS_Dialog_CAS_SpawnPositionsComboBox, -1];

    if(selectedSpawnPositionIndex >= 0) then {
        lbSetCurSel [AIS_Dialog_CAS_SpawnPositionsComboBox, selectedSpawnPositionIndex];    
    } else {
        lbSetCurSel [AIS_Dialog_CAS_SpawnPositionsComboBox, _selectedSpawnPositionIndex];    
    } */
};