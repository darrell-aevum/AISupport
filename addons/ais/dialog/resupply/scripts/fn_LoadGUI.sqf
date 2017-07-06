	//List Box
	disableSerialization;

 
	AIS_SelectedSupportType = "supply";

	ctrlShow [AIS_Dialog_Artillery, false];	
	ctrlShow [AIS_Dialog_Cas, false];
	ctrlShow [AIS_Dialog_Reinforcements, false];	
	ctrlShow [AIS_Dialog_Map, false];
	ctrlShow [AIS_Dialog_MapControlBack, false]; 
	ctrlShow [AIS_Dialog_BtnClearTarget, false]; 
	ctrlShow [AIS_Dialog_BtnCloseMap, false]; 
	ctrlShow [AIS_Dialog_BtnConfirm, false];	
	ctrlShow [AIS_Dialog_BtnCancel, false];
	
	ctrlShow [AIS_Dialog_UnitListBack, true];
	ctrlShow [AIS_Dialog_UnitDescriptionBack, true];
	ctrlShow [AIS_Dialog_UnitInfoBack, true]; 
	ctrlShow [AIS_Dialog_Resupply, true];
	ctrlShow [AIS_Dialog_BtnClose, true];

 	_supplyItemCategories = ((findDisplay AIS_Dialog) displayCtrl (AIS_Dialog_Resupply_TraderCategories));	
	lbCLear _supplyItemCategories;
	  
	_categories = [] call AIS_DropdownLists_GetTraderCategories;

	{ 
		_class = _x select 0;
		_name = _x select 1;

		_supplyItemCategories lbAdd(_name);		
		_supplyItemCategories lbSetData[_forEachIndex,  _class];
	} forEach (_categories);
 
     lbSetCurSel [AIS_Dialog_Resupply_TraderCategories, 0];

	_deliveryVehicles = ((findDisplay AIS_Dialog) displayCtrl (AIS_Dialog_Resupply_DeliveryVehicle));	
	lbCLear _deliveryVehicles; 

 	_units = AIS_Resupply_Delivery_Vehicles; 
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
 
		_deliveryVehicles lbAdd(_label);
		_deliveryVehicles lbSetData[_forEachIndex,  _data];			
		_deliveryVehicles lbSetPicture[_forEachIndex, _picture];		
		
	} forEach _units; 

	lbSetCurSel [AIS_Dialog_Resupply_DeliveryVehicle, 0];