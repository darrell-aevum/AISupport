	disableSerialization;
 
	AIS_SelectedSupportType = "reinforcements";

	ctrlShow [AIS_Dialog_Artillery, false];	
	ctrlShow [AIS_Dialog_Cas, false];
	ctrlShow [AIS_Dialog_Resupply, false];	
	ctrlShow [AIS_Dialog_Map, false];
	ctrlShow [AIS_Dialog_MapControlBack, false]; 
	ctrlShow [AIS_Dialog_BtnClearTarget, false]; 
	ctrlShow [AIS_Dialog_BtnCloseMap, false]; 
	ctrlShow [AIS_Dialog_BtnConfirm, false];	
	ctrlShow [AIS_Dialog_BtnCancel, false];
	
	ctrlShow [AIS_Dialog_UnitListBack, true];
	ctrlShow [AIS_Dialog_UnitDescriptionBack, true];
	ctrlShow [AIS_Dialog_UnitInfoBack, true]; 	
	ctrlShow [AIS_Dialog_BtnClose, true];
	ctrlShow [AIS_Dialog_Reinforcements, true];		
 
 	_soldierOrSquadCombo = ((findDisplay AIS_Dialog) displayCtrl (AIS_Dialog_Reinforcements_SoldierOrSquadCombo));	
	lbCLear _soldierOrSquadCombo;

	_soldierOrSquadCombo lbAdd("Soldiers");			
	_soldierOrSquadCombo lbSetData[0,  "Soldier"];	
	_soldierOrSquadCombo lbAdd("Squads");			
	_soldierOrSquadCombo lbSetData[1,  "Squad"];	

 
	lbSetCurSel [AIS_Dialog_Reinforcements_SoldierOrSquadCombo, 0];

	_insertionVehicleListBox = ((findDisplay AIS_Dialog) displayCtrl (AIS_Dialog_Reinforcements_InsertiontVehicleListBox));	
	lbCLear _insertionVehicleListBox; 

 	_units = AIS_Reinforcements_Insertion_Vehicles; 
	{  
		//[Class Name, Description, Cost, Respect, Required Items, RespectEarned, Spawn Positions]
		/*
		VehicleClass can be a string or an array. If it is a string, it will use
		the Arma Class information for the vehicle. To change the display name or
		the image of a unit, use the array shown below:
			[
				"B_Plane_CAS_01_F", 
				"Awesome Plane Level 1", 
				"\a3\Ui_F_Curator\Data\Displays\RscDisplayCurator\modeGroups_ca.paa"
			]	
		*/
		private ["_label", "_picture", "_data"];

		_vehicleClass = _x select 0;	

		if (typename _vehicleClass == "STRING") then {			 			 
			_data = _vehicleClass;
			_label = getText(configFile >> "cfgVehicles" >> _vehicleClass>> "displayName");
			_picture = (getText(configFile >> "cfgVehicles" >> _vehicleClass >> "picture"));
			
			if (_picture == "") then {
				_picture = (getText(configFile >> "cfgVehicles" >> _vehicleClass >> "icon"));
			};				 					
			if (_picture == "") then {
				_picture = (getText(configFile >> "cfgVehicles" >> _vehicleClass >> "editorPreview"));
			};				 			
		};

		if (typename _vehicleClass != "STRING") then {			
			_data = _vehicleClass select 0;
			_label = _vehicleClass select 1;

			_picture = (getText(configFile >> "cfgVehicles" >> _data >> "picture"));
			
			if (_picture == "") then {
				_picture = (getText(configFile >> "cfgVehicles" >> _data >> "icon"));
			};				 					
			if (_picture == "") then {
				_picture = (getText(configFile >> "cfgVehicles" >> _data >> "editorPreview"));
			};	
		};
 
		_insertionVehicleListBox lbAdd(_label);
		_insertionVehicleListBox lbSetData[_forEachIndex,  _data];			
		_insertionVehicleListBox lbSetPicture[_forEachIndex, _picture];		
		
	} forEach _units; 

	lbSetCurSel [AIS_Dialog_Reinforcements_InsertiontVehicleListBox, 0]; 