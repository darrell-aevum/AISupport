AIS_Apps_Reinforcements_SelectionChanged = {   	
    _display = uiNameSpace getVariable ["RscExileXM8", displayNull]; 
	ctrlEnable [AIS_Dialog_Reinforcements_ConfirmButton, true];		
 
   	_selectedUnitIndex = lbCurSel AIS_Dialog_Reinforcements_UnitListBox;    
    _unit = AIS_Reinforcements_Units select _selectedUnitIndex;    

    _class = lbData [AIS_Dialog_Reinforcements_UnitListBox, _selectedUnitIndex];
  
	_playerLocker = player getVariable ["ExileLocker", 0];
	_playerMoney = player getVariable ["ExileMoney", 0];      
	_playerTabs = _playerLocker + _playerMoney;		    
	_playerRespect = ExileClientPlayerScore; 

	_headerText = _display displayCtrl AIS_Dialog_Reinforcements_HeaderText;    
    _text = "<t align='left'>%2 - [%1]</t>";
    _text = format[_text + "<t align='right'><img  size='0.85' image='addons\ais\icons\respect.paa'/> %3   <img  size='0.75' image='addons\ais\icons\poptab_ca.paa'/> %4</t>",group player, profileName, _playerRespect,_playerTabs];
    _headerText ctrlSetStructuredText (parseText _text);
    _headerText ctrlCommit 0; 

	_description = if (count _unit > 1) then [{ _unit select 1 }, {""}];
	_cost = if (count _unit > 2) then [{ _unit select 2 }, {0}];
	_respect = if (count _unit > 3) then [{ _unit select 3 }, {0}];
	_requiredGear = if (count _unit > 4) then [{_unit select 4 }, {[]}];
	_earnedRespect = if (count _unit > 5) then [{_unit select 5 }, {[]}];
	_durations = if (count _unit > 7) then [{_unit select 7 }, {[]}];	
	_spawnPoints = if (count _unit > 6) then [{_unit select 6 }, {[]}];	

 
 	//Duration	
    _durationComboBox = _display displayCtrl AIS_Dialog_Reinforcements_DurationComboBox;  
    lbCLear _durationComboBox;  			
 
	{
		lbAdd [AIS_Dialog_Reinforcements_DurationComboBox, format["%1 Minutes", (_x select 0)]];
		lbSetValue [AIS_Dialog_Reinforcements_DurationComboBox, _forEachIndex, (_x select 0)*60];
	} forEach _durations;

	if(AIS_Dialog_Reinforcements_SelectedUnit != _selectedUnitIndex) then {
		AIS_Dialog_Reinforcements_SelectedDuration = 0;
	};
	lbSetCurSel [AIS_Dialog_Reinforcements_DurationComboBox, AIS_Dialog_Reinforcements_SelectedDuration];

	//Spawn
    _departFromComboBox = _display displayCtrl AIS_Dialog_Reinforcements_SpawnPositionsComboBox; 	 	
    lbCLear _departFromComboBox; 	
 	
	lbAdd [AIS_Dialog_Reinforcements_SpawnPositionsComboBox, "Nearest Patrolling Unit"];
	lbSetValue [AIS_Dialog_Reinforcements_SpawnPositionsComboBox, 0, 3500];
	{
		lbAdd [AIS_Dialog_Reinforcements_SpawnPositionsComboBox, format["%1", (_x select 0)]];
		lbSetValue [AIS_Dialog_Reinforcements_SpawnPositionsComboBox, _forEachIndex + 1, _x select 3];
	} forEach _spawnPoints;

	if(AIS_Dialog_Reinforcements_SelectedUnit != _selectedUnitIndex) then {
		AIS_Dialog_Reinforcements_SelectedSpawnPoint = 0;
	};
	lbSetCurSel [AIS_Dialog_Reinforcements_SpawnPositionsComboBox, AIS_Dialog_Reinforcements_SelectedSpawnPoint];
  
	_textCbo = _display displayCtrl AIS_Dialog_Reinforcements_UnitDescriptionText; 
	
	_color = "#ffffff";
	if(_playerTabs < _cost) then {
		ctrlEnable [AIS_Dialog_Reinforcements_ConfirmButton, false];			
		_color = "#FF0000";
	};
	_text = format["<t align='left' size='.75'>Cost:</t><t color='%2' align='right' size='.75'><img  size='0.50' image='addons\ais\icons\poptab_ca.paa'/> %1</t><br/>", _cost, _color];

	_color = "#ffffff";
	if(_playerRespect < _respect) then {				
		ctrlEnable [AIS_Dialog_Reinforcements_ConfirmButton, false];		
		_color = "#FF0000";
	};	
	_text = format[_text + "<t align='left'size='.75'>Respect:</t><t color='%2' size='.75' align='right' size='.75'><img  size='0.50' image='addons\ais\icons\respect.paa'/> %1</t><br/>", _respect, _color];	    


	_text = format[_text + "<t align='left' size='.75'>Required Gear:</t>"];
	if(count _requiredGear <= 0) then 
	{
		_text = format[_text + "<t align='right' size='.75'>None</t><br/>"];			
	}
	else
	{ 
		_text = format[_text + "<t align='right' size='.75'>"];			
		{ 
			private["_type"];

			_type = "cfgVehicles";
			_obj = (configFile >> _type >> _x); 			

			if (isNull _obj) then {
				_type = "cfgWeapons";
				_obj = (configFile >> _type >> _x); 
			};				 					
			if (isNull _obj) then {
				_type = "cfgMagazines";
				_obj = (configFile >> _type >> _x); 
			};	
			if (isNull _obj) then {
				_type = "cfgAmmo";
				_obj = (configFile >> _type >> _x); 
			};	
			if (isNull _obj) then {
				_type = nil;				
			};	

			
			_name = (getText(configFile >> _type >> _x >> "displayName"));
			_picture = (getText(configFile >> _type >> _x >> "picture"));
			if (_picture == "") then {
				_picture = (getText(configFile >> _type >> _x >> "icon"));
			};				 					
			if (_picture == "") then {
				_picture = (getText(configFile >> _type >> _x >> "editorPreview"));
			};	

			_color = "#ffffff";
			if!(_x call IsItemInInventory) then {	
				ctrlEnable [AIS_Dialog_Reinforcements_ConfirmButton, false];		
				_color = "#FF0000";
			};

			_text = format[_text + "<t color='%3' size='.75'><img  size='0.75' image='%2'/> %1</t><br/>", _name, _picture, _color];			

			
		} forEach _requiredGear;		
		_text = format[_text + "</t><br/>"];					
	};

 	if(_description != "") then {
		_text = format[_text + "<t align='left' size='.75'>Description:</t><br/><t size='.75'>%1</t>", _description];	
	};
 	
	_textCbo ctrlSetStructuredText  parseText  _text;  
  
   	AIS_Dialog_Reinforcements_SelectedUnit = lbCurSel AIS_Dialog_Reinforcements_UnitListBox;     
	 [] call AIS_Apps_Reinforcements_UpdateTotalCost; 
	 
	 ctrlEnable [AIS_Dialog_Reinforcements_ConfirmButton, true];		
};