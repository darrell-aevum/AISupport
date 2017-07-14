 
private["_display"]; 
_display = uiNameSpace getVariable ["RscExileXM8", displayNull];
     disableSerialization;    
 	_playerLocker = player getVariable ["ExileLocker", 0];
	_playerMoney = player getVariable ["ExileMoney", 0];      
	_playerTabs = _playerLocker + _playerMoney;		    
	_playerRespect = ExileClientPlayerScore; 
 
	_headerText = _display displayCtrl AIS_Dialog_Artillery_HeaderText;    
    _text = "<t align='left'>%2 - [%1]</t>";
    _text = format[_text + "<t align='right'><img  size='0.85' image='addons\ais\icons\respect.paa'/> %3   <img  size='0.75' image='addons\ais\icons\poptab_ca.paa'/> %4</t>",group player, profileName, _playerRespect,_playerTabs];
    _headerText ctrlSetStructuredText (parseText _text);
 	_headerText ctrlCommit 0; 

	_unitListBox = _display displayCtrl AIS_Dialog_Artillery_UnitListBox;
	lbCLear _unitListBox;

 	_units = AIS_Artillery_Units; 
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
 
		_unitListBox lbAdd(format["      %1",_label]);
		_unitListBox lbSetData[_forEachIndex,  _data];		        	
		_unitListBox lbSetPicture[_forEachIndex, _picture];		 
	} forEach _units;  

	_unitListBox ctrlSetPosition (ctrlPosition _unitListBox);
   
    lbSetCurSel [AIS_Dialog_Artillery_UnitListBox, AIS_Dialog_Artillery_SelectedUnit]; 	
	lbSetCurSel [AIS_Dialog_Artillery_ShellTypeToFire, AIS_Dialog_Artillery_SelectedShellType]; 	
	lbSetCurSel [AIS_Dialog_Artillery_ShellCountToFire, AIS_Dialog_Artillery_SelectedShellCount]; 	
