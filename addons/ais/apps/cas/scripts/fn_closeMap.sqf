AIS_Apps_CAS_CloseMap = {
    disableSerialization;    
    _display = uiNameSpace getVariable ['RscExileXM8', displayNull];
  
    _slide = _display displayCtrl (AIS_Dialog_CAS_Slide);
    _slide ctrlShow true;
    _slide ctrlSetFade 0;
    _slide ctrlCommit 0.3;

    _unitIndex = lbCurSel AIS_Dialog_CAS_UnitListBox;      
    _unit = AIS_CAS_Units select _unitIndex;     
    _spawnPositions = if (count _unit > 6) then [{_unit select 6 }, {[]}];
 
    { 
        _markerName = format["AIS_CAS_SPAWN_%1", _forEachIndex];
            deleteMarker _markerName; 
    } forEach _spawnPositions;
  
     
    mapclick = false;
    onMapSingleClick "mapclick = false; false";
};