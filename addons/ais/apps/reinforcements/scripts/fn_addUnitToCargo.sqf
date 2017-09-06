AIS_Apps_Reinforcements_AddUnitToCargo = {
    _display = uiNameSpace getVariable ["RscExileXM8", displayNull];   
    _selectedUnitsListBox = _display displayCtrl AIS_Dialog_Reinforcements_SelectedUnitsListBox;            
    
    switch(AIS_Dialog_Reinforcements_SelectedUnitType) do {
        case 0:{
            _selectedUnit = AIS_Reinforcements_Units select AIS_Dialog_Reinforcements_SelectedUnit;

			_vehicleClass = _selectedUnit select 0; 
			_data = _vehicleClass;
			_label = getText(configFile >> "cfgVehicles" >> _vehicleClass>> "displayName");
			_picture = (getText(configFile >> "cfgVehicles" >> _vehicleClass >> "picture"));

			_picture = "\a3\Ui_F_Curator\Data\Displays\RscDisplayCurator\modeUnits_ca.paa";						 			

			_selectedUnitsListBox lbAdd(format["      %1",_label]);
			_selectedUnitsListBox lbSetData[lbSize _selectedUnitsListBox -1,  _data];		        	
			_selectedUnitsListBox lbSetPicture[lbSize _selectedUnitsListBox -1, _picture];	          
        };
        case 1:{
            _selectedUnit = AIS_Reinforcements_Teams select AIS_Dialog_Reinforcements_SelectedUnit;
 
            _label = _selectedUnit select 0;
            _data = "Team";
			_picture = "\a3\Ui_F_Curator\Data\Displays\RscDisplayCurator\modeGroups_ca.paa";					
            
            _selectedUnitsListBox lbAdd(format["      %1",_label]); 	        	
            _selectedUnitsListBox lbSetData[lbSize _selectedUnitsListBox -1,  _data];	
			_selectedUnitsListBox lbSetPicture[lbSize _selectedUnitsListBox -1, _picture];	 
        };
        case 2: {
            _selectedUnit = AIS_Reinforcements_Squads select AIS_Dialog_Reinforcements_SelectedUnit;

           _label = _selectedUnit select 0;
           _data = "Squad";
           _picture = "\a3\Ui_F_Curator\Data\Displays\RscDisplayCurator\modeGroups_ca.paa";					
          
           _selectedUnitsListBox lbAdd(format["      %1",_label]); 	        	
           _selectedUnitsListBox lbSetPicture[lbSize _selectedUnitsListBox -1, _picture];	
        };
    };

    _selectedUnitsListBox ctrlSetPosition (ctrlPosition _selectedUnitsListBox);
}