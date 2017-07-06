	//List Box
	_cbo = ((findDisplay AIS_Dialog) displayCtrl (AIS_Dialog_Cas_UnitList));
	lbCLear _cbo;
  	
	AIS_SelectedSupportType = "cas";

	ctrlShow [AIS_Dialog_Reinforcements, false];	
	ctrlShow [AIS_Dialog_Artillery, false];
	ctrlShow [AIS_Dialog_Map, false ];	
	ctrlShow [AIS_Dialog_MapControlBack, false]; 
	ctrlShow [AIS_Dialog_BtnClearTarget, false]; 
	ctrlShow [AIS_Dialog_BtnCloseMap, false]; 
	ctrlShow [AIS_Dialog_BtnConfirm, false];	
	ctrlShow [AIS_Dialog_BtnCancel, false];
	ctrlShow [AIS_Dialog_Resupply, false];

	ctrlShow [AIS_Dialog_UnitListBack, true];
	ctrlShow [AIS_Dialog_UnitDescriptionBack, true];
	ctrlShow [AIS_Dialog_UnitInfoBack, true]; 
	ctrlShow [AIS_Dialog_Cas, true];
	ctrlShow [AIS_Dialog_BtnClose, true];

    lbClear AIS_Dialog_Cas_Duration;
    lbAdd [AIS_Dialog_Cas_Duration, "3 Minutes"];
    lbAdd [AIS_Dialog_Cas_Duration, "5 Minutes"];
    lbAdd [AIS_Dialog_Cas_Duration, "8 Minutes"];
    lbAdd [AIS_Dialog_Cas_Duration, "10 Minutes"];
    lbSetValue [AIS_Dialog_Cas_Duration, 0, 3*60];
    lbSetValue [AIS_Dialog_Cas_Duration, 1, 5*60];
    lbSetValue [AIS_Dialog_Cas_Duration, 2, 8*60];
    lbSetValue [AIS_Dialog_Cas_Duration, 3, 10*60];

 	lbSetCurSel [AIS_Dialog_Cas_Duration, 0];



	_units = AIS_Cas_Units; 
	
	{  
		// [VehicleClass, Description, Cost, Rep, Required Gear]
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
 
		_cbo lbAdd(_label);
		_cbo lbSetData[_forEachIndex,  _data];			
		_cbo lbSetPicture[_forEachIndex, _picture];		
		
	} forEach _units; 