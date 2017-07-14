 
private["_display"]; 
_display = uiNameSpace getVariable ["RscExileXM8", displayNull];
      disableSerialization;    
 //[] call AIS_Apps_CAS_CloseMap;

AIS_Dialog_CAS_SelectedUnit = lbCurSel AIS_Dialog_CAS_UnitListBox;    
AIS_Dialog_CAS_SelectedSpawnPoint = lbCurSel AIS_Dialog_CAS_SpawnPositionsComboBox;
AIS_Dialog_CAS_SelectedDuration = lbCurSel AIS_Dialog_CAS_DurationComboBox;