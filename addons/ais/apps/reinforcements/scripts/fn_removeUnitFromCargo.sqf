AIS_Apps_Reinforcements_RemoveUnitFromCargo = {
    params ["_selectedIndex"];

    _display = uiNameSpace getVariable ["RscExileXM8", displayNull];   
    _selectedUnitsListBox = _display displayCtrl AIS_Dialog_Reinforcements_SelectedUnitsListBox;  

	lbDelete [AIS_Dialog_Reinforcements_SelectedUnitsListBox, _selectedIndex];  
	lbSetCurSel [AIS_Dialog_Reinforcements_SelectedUnitsListBox, (lbSize _selectedUnitsListBox)-1];
}