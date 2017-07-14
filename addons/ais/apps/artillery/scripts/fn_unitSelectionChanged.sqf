AIS_Apps_Artillery_SelectionChanged = {   	
 	disableSerialization;
	
    _display = uiNameSpace getVariable ["RscExileXM8", displayNull];

	ctrlEnable [AIS_Dialog_Artillery_ConfirmButton, true];		
 
    _selectedUnitIndex = lbCurSel AIS_Dialog_Artillery_UnitListBox;   

    _unit = AIS_Artillery_Units select _selectedUnitIndex;    

    _class = lbData [AIS_Dialog_Artillery_UnitListBox, _selectedUnitIndex];
  
	_playerLocker = player getVariable ["ExileLocker", 0];
	_playerMoney = player getVariable ["ExileMoney", 0];      
	_playerTabs = _playerLocker + _playerMoney;		    
	_playerRespect = ExileClientPlayerScore; 

	_headerText = _display displayCtrl AIS_Dialog_Artillery_HeaderText;    
    _text = "<t align='left'>%2 - [%1]</t>";
    _text = format[_text + "<t align='right'><img  size='0.85' image='addons\ais\icons\respect.paa'/> %3   <img  size='0.75' image='addons\ais\icons\poptab_ca.paa'/> %4</t>",group player, profileName, _playerRespect,_playerTabs];
    _headerText ctrlSetStructuredText (parseText _text);
    _headerText ctrlCommit 0; 

	_description = if (count _unit > 1) then [{ _unit select 1 }, {""}];
	_cost = if (count _unit > 2) then [{ _unit select 2 }, {0}];
	_respect = if (count _unit > 3) then [{ _unit select 3 }, {0}];
	_requiredGear = if (count _unit > 4) then [{_unit select 4 }, {[]}];
	_minNumberOfRounds =  if (count _unit > 5) then [{_unit select 5 }, {1}];
	_maxNumberOfRounds =  if (count _unit > 5) then [{_unit select 6 }, {4}];
	_accuracy =  if (count _unit > 6) then [{_unit select 7 }, {100}];

 
	/////////////////////////////////////////////////////////////
	//          Shell Type                                     //
	/////////////////////////////////////////////////////////////
    _shellTypeComboBox = _display displayCtrl AIS_Dialog_Artillery_ShellTypeToFire; 
    lbCLear _shellTypeComboBox;  

    _magazines = [];
    _magazineArray = [];

	_weaponsClass = getArray(configFile >> "cfgVehicles" >> _class >> "weapons");
	{
        _name = getText (configFile >> "cfgWeapons" >> _x >> "displayName");
        
        _magazines = _magazines + [ _name];
        _magazines = getArray (configFile >> "cfgWeapons" >> _x >> "magazines");    
	}forEach _weaponsClass; 
    
    if (isClass (configFile >> "cfgVehicles" >> _class >> "Turrets" >> "M2_Turret")) then 
    {
        _magazineArray = getArray(configFile >> "cfgVehicles" >> _class >> "Turrets" >> "M2_Turret" >> "magazines");
    } else
    {
        _magazineArray = getArray(configFile >> "cfgVehicles" >> _class >> "Turrets" >> "MainTurret" >> "magazines");
        _magazineArray = _magazineArray + (getArray(configFile >> "cfgVehicles" >> _class >> "Turrets" >> "FrontTurret" >> "magazines"));
        _magazineArray = _magazineArray + (getArray(configFile >> "cfgVehicles" >> _class >> "Turrets" >> "RearTurret" >> "magazines"));
    };

    {
        _name = getText (configFile >> "CfgMagazines" >> _x >> "displayName");
        _ammo = getText (configFile >> "CfgMagazines" >> _x >> "ammo");
        if!(_name in _magazines) then {
            _magazines = _magazines + [ _name]; 
            _index = lbAdd [AIS_Dialog_Artillery_ShellTypeToFire, _name];
			lbSetData[AIS_Dialog_Artillery_ShellTypeToFire, _index,  _ammo];
        };            
    }forEach _magazineArray; 
 
	if(AIS_Dialog_Artillery_SelectedUnit != _selectedUnitIndex) then {
		AIS_Dialog_Artillery_SelectedShellType = 0;
	};
	lbSetCurSel [AIS_Dialog_Artillery_ShellTypeToFire, AIS_Dialog_Artillery_SelectedShellType];


	/////////////////////////////////////////////////////////////
	//          Shell Count                                    //
	/////////////////////////////////////////////////////////////
    _shellCountComboBox = _display displayCtrl AIS_Dialog_Artillery_ShellCountToFire;     
	lbCLear _shellCountComboBox; 

	for "_i" from 0 to (_maxNumberOfRounds - _minNumberOfRounds)  do {
		_val = _i + _minNumberOfRounds;
		lbAdd [AIS_Dialog_Artillery_ShellCountToFire, format["%1",_val]];
		lbSetValue [AIS_Dialog_Artillery_ShellCountToFire, _i, _val];
	};
	 
	if(AIS_Dialog_Artillery_SelectedUnit != _selectedUnitIndex) then {
		AIS_Dialog_Artillery_SelectedShellCount = 0;
	};
	lbSetCurSel [AIS_Dialog_Artillery_ShellCountToFire, AIS_Dialog_Artillery_SelectedShellCount];


	/////////////////////////////////////////////////////////////
	//          Description                                    //
	/////////////////////////////////////////////////////////////
	_textCbo = _display displayCtrl AIS_Dialog_Artillery_UnitDescriptionText; 
	
	_color = "#ffffff";
	if(_playerTabs < _cost) then {
		ctrlEnable [AIS_Dialog_Artillery_ConfirmButton, false];			
		_color = "#FF0000";
	};
	_text = format["<t align='left' size='.75'>Cost:</t><t color='%2' align='right' size='.75'><img  size='0.50' image='addons\ais\icons\poptab_ca.paa'/> %1</t><br/>", _cost, _color];

	_color = "#ffffff";
	if(_playerRespect < _respect) then {				
		ctrlEnable [AIS_Dialog_Artillery_ConfirmButton, false];		
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
				ctrlEnable [AIS_Dialog_Artillery_ConfirmButton, false];		
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

	AIS_Dialog_Artillery_SelectedUnit = lbCurSel AIS_Dialog_Artillery_UnitListBox;  

 	[] call AIS_Apps_Artillery_UpdateTotalCost; 

};