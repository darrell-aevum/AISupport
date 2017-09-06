AIS_Apps_Reinforcements_UnitTypeChanged = {   	 
private["_display"]; 	
_display = uiNameSpace getVariable ["RscExileXM8", displayNull];	
disableSerialization;    

_unitListBox = _display displayCtrl AIS_Dialog_Reinforcements_UnitListBox;
lbCLear _unitListBox;

switch(AIS_Dialog_Reinforcements_SelectedUnitType) do {
	case 0: {
		{  	 		
			_vehicleClass = _x select 0; 
			_data = _vehicleClass;
			_label = getText(configFile >> "cfgVehicles" >> _vehicleClass>> "displayName");
			_picture = (getText(configFile >> "cfgVehicles" >> _vehicleClass >> "picture"));

			_picture = "\a3\Ui_F_Curator\Data\Displays\RscDisplayCurator\modeUnits_ca.paa";						 			

			_unitListBox lbAdd(format["      %1",_label]);
			_unitListBox lbSetData[_forEachIndex,  _data];		        	
			_unitListBox lbSetPicture[_forEachIndex, _picture];	
		} forEach AIS_Reinforcements_Units; 
	};
	case 1:{
		{  	 
			_label = _x select 0;
			_picture = "\a3\Ui_F_Curator\Data\Displays\RscDisplayCurator\modeGroups_ca.paa";					

			_unitListBox lbAdd(_label); 		
			_unitListBox lbSetPicture[_forEachIndex, _picture];	
		} forEach AIS_Reinforcements_Teams; 
	};
	case 2: {
		{  	 
			_label = _x select 0;
			_picture = "\a3\Ui_F_Curator\Data\Displays\RscDisplayCurator\modeGroups_ca.paa";					

			_unitListBox lbAdd(_label); 		
			_unitListBox lbSetPicture[_forEachIndex, _picture];	
		} forEach AIS_Reinforcements_Squads; 
	};
};
 
_unitListBox ctrlSetPosition (ctrlPosition _unitListBox);

lbSetCurSel [AIS_Dialog_Reinforcements_UnitListBox, AIS_Dialog_Reinforcements_SelectedUnit]; 	
//lbSetCurSel [AIS_Dialog_Reinforcements_DurationComboBox, AIS_Dialog_Reinforcements_SelectedDuration]; 	
//lbSetCurSel [AIS_Dialog_Reinforcements_SpawnPositionsComboBox, AIS_Dialog_Reinforcements_SelectedSpawnPoint]; 	   
};