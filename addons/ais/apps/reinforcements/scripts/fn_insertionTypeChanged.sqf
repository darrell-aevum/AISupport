AIS_Apps_Reinforcements_InsertionTypeChanged = {   	 
private["_display"]; 	
_display = uiNameSpace getVariable ["RscExileXM8", displayNull];	
disableSerialization;    

_insertionVehicleComboBox = _display displayCtrl AIS_Dialog_Reinforcements_InsertionVehicleComboBox;
lbCLear _insertionVehicleComboBox;

_insertionType = AIS_Reinforcements_InsertionTypes select AIS_Dialog_Reinforcements_SelectedInsertionType;
_insertionTypeVics = _insertionType select 3;

 
{   
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
	_crewSeats = [_vehicleClass, false] call BIS_fnc_crewCount; 
	_totalSeats = [_vehicleClass, true] call BIS_fnc_crewCount; // Number of total seats: crew + non-FFV cargo/passengers + FFV cargo/passengers
	_availableCargoSeats = _totalSeats - _crewSeats;
	if(_availableCargoSeats > 0) then {
		_insertionVehicleComboBox lbAdd(_label);
		_insertionVehicleComboBox lbSetData[_forEachIndex,  _data];		        	
		_insertionVehicleComboBox lbSetPicture[_forEachIndex, _picture];		 
	};
} forEach _insertionTypeVics;  
 

lbSetCurSel [AIS_Dialog_Reinforcements_InsertionVehicleComboBox, 0]; 	 
};