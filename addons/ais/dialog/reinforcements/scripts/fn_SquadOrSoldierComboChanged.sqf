params ["_selected"];
private ["_type", "_description", "_cost", "_respect", "_requiredGear"];

	disableSerialization;
 	

	_type = lbData [AIS_Dialog_Reinforcements_SoldierOrSquadCombo, _selected select 1];
	private["_data","_label","_picture"];

	_unitListBox = ((findDisplay AIS_Dialog) displayCtrl (AIS_Dialog_Reinforcements_UnitListBox));	
	lbCLear _unitListBox;		

	switch(_type) do {
		case "Soldier": {
			{  	 		
				_vehicleClass = _x select 0;
			
				// [Class, Description, Cost, Rep, Required Items, Respect Earned / Lost]		
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
					if (_picture == "") then {
						_picture = "\a3\Ui_F_Curator\Data\Displays\RscDisplayCurator\modeUnits_ca.paa";
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
					if (_picture == "") then {
						_picture = "\a3\Ui_F_Curator\Data\Displays\RscDisplayCurator\modeUnits_ca.paa";
					};
				};
		
				_unitListBox lbAdd(_label);
				_unitListBox lbSetData[_forEachIndex,  _data];			
				_unitListBox lbSetPicture[_forEachIndex, _picture];	
			} forEach AIS_Reinforcements_Insertion_Soldiers; 
		};
		case "Squad": {
			{  	 
				_label = _x select 0;
				_picture = "\a3\Ui_F_Curator\Data\Displays\RscDisplayCurator\modeGroups_ca.paa";					
	 
				_unitListBox lbAdd(_label); 		
				_unitListBox lbSetPicture[_forEachIndex, _picture];	
			} forEach AIS_Reinforcements_Insertion_Squads; 
		};
	}
 



 
  
 