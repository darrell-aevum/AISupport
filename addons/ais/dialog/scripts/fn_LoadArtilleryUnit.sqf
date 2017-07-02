	private ["_weapArray","_class","_crewCount","_model","_maxSpeed","_invSpace","_armor"];

	disableSerialization;
	_id =  lbCurSel AIS_Dialog_Artillery_UnitList;    
	_class = lbData [AIS_Dialog_Artillery_UnitList, _id];
     
    lbClear AIS_Dialog_Artillery_RoundTypeToFire;

    lbClear AIS_Dialog_Artillery_RoundNumberToFire;
    lbAdd [AIS_Dialog_Artillery_RoundNumberToFire, "1"];
    lbAdd [AIS_Dialog_Artillery_RoundNumberToFire, "2"];
    lbAdd [AIS_Dialog_Artillery_RoundNumberToFire, "3"];
    lbAdd [AIS_Dialog_Artillery_RoundNumberToFire, "4"];
    lbSetValue [AIS_Dialog_Artillery_RoundNumberToFire, 0, 1];
    lbSetValue [AIS_Dialog_Artillery_RoundNumberToFire, 1, 2];
    lbSetValue [AIS_Dialog_Artillery_RoundNumberToFire, 2, 3];
    lbSetValue [AIS_Dialog_Artillery_RoundNumberToFire, 3, 4];

    lbSetCurSel [AIS_Dialog_Artillery_RoundNumberToFire, 0];

	_weapons = [];
    _magazines = [];

    _magazineArray = [];
    
	_weaponsClass = getArray(configFile >> "cfgVehicles" >> _class >> "weapons");
	{
        _name = getText (configFile >> "cfgWeapons" >> _x >> "displayName");
        _weapons = _weapons + [ _name];        

        _magazines = _magazines + [ _name];
        _magazines = getArray (configFile >> "cfgWeapons" >> _x >> "magazines");    
	}forEach _weaponsClass; 
    
	if (isClass (configFile >> "cfgVehicles" >> _class >> "Turrets" >> "M2_Turret")) then 
		{
			_weapArray = getArray(configFile >> "cfgVehicles" >> _class >> "Turrets" >> "M2_Turret" >> "weapons");
			
		} else
		{
			_weapArray = getArray(configFile >> "cfgVehicles" >> _class >> "Turrets" >> "MainTurret" >> "weapons");
			_weapArray = _weapArray + (getArray(configFile >> "cfgVehicles" >> _class >> "Turrets" >> "FrontTurret" >> "weapons"));
			_weapArray = _weapArray + (getArray(configFile >> "cfgVehicles" >> _class >> "Turrets" >> "RearTurret" >> "weapons"));
			
			_magazineArray = getArray(configFile >> "cfgVehicles" >> _class >> "Turrets" >> "MainTurret" >> "magazines");
			_magazineArray = _magazineArray + (getArray(configFile >> "cfgVehicles" >> _class >> "Turrets" >> "FrontTurret" >> "magazines"));
			_magazineArray = _magazineArray + (getArray(configFile >> "cfgVehicles" >> _class >> "Turrets" >> "RearTurret" >> "magazines"));

             
		};

		{
			_name = getText (configFile >> "cfgWeapons" >> _x >> "displayName");
            if!(_name in _weapons) then {
			    _weapons = _weapons + [ _name]; 
            };
		}forEach _weapArray; 
     
		{
			_name = getText (configFile >> "CfgMagazines" >> _x >> "displayName");
            _ammo = getText (configFile >> "CfgMagazines" >> _x >> "ammo");
            if!(_name in _magazines) then {
			    _magazines = _magazines + [ _name]; 
                _index = lbAdd [AIS_Dialog_Artillery_RoundTypeToFire, _name];
                 lbSetData[AIS_Dialog_Artillery_RoundTypeToFire, _index,  _ammo];
            };            
		}forEach _magazineArray; 

	_textCbo = ((findDisplay AIS_Dialog) displayCtrl (AIS_Dialog_Artillery_UnitDescription));
 
 
	_separator = parseText "-------------------------------------------------------------------------------------";
	_textCbo ctrlSetStructuredText parseText format 
	[
        "       
        <t align='left'>Magazines:</t><br/>
        <t align='left'>%2</t>",        
        _weapons, _magazines, _separator
    ];	


    
    lbSetCurSel [AIS_Dialog_Artillery_RoundTypeToFire, 0];