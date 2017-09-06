  	
	params ["_selectedIndex"];

	disableSerialization; 
 

	lbDelete [AIS_Dialog_Reinforcements_CargoListBox, _selectedIndex];  
	lbSetCurSel [AIS_Dialog_Reinforcements_CargoListBox, (lbSize _crateList)-1];
 
 	[] call AIS_Dialog_Reinforcements_fnc_CargoChanged;