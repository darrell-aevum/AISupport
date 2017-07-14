AIS_Apps_CAS_ConfirmMission = { 
    disableSerialization;    
private [
	"_vehicleClass",
    "_spawnPosition",
	"_dirAndUp",
	"_altitude",
	"_special",
	"_allowDamange"
];
	_playerLocker = player getVariable ["ExileLocker", 0];
	_playerMoney = player getVariable ["ExileMoney", 0];      
	_playerTabs = _playerLocker + _playerMoney;		    
	_playerRespect = ExileClientPlayerScore; 
  
	_totalCost = 0;
    _requiredRespect = 0; 
    _respectEarned = 0;
    _altitude = 0;
    _special = "NONE";
    _allowDamange = true;
    _spawnPosition =  nil; 
    _dirAndUp = nil; 
    _spawnPositionCost = 0;
    _spawnPositionRespect = 0;



    _unitIndex = lbCurSel AIS_Dialog_CAS_UnitListBox;       
	if(isNil "_unitIndex" || _unitIndex < 0) exitwith{};

    _unit = AIS_CAS_Units select _unitIndex;    

    _vehicleClass = lbData [AIS_Dialog_CAS_UnitListBox, _unitIndex];
	_unitName = lbText [AIS_Dialog_CAS_UnitListBox, _unitIndex];
  
    _inheritance = _vehicleClass call GetInheritance;	

	_unitCost = if (count _unit > 2) then [{ _unit select 2 }, {0}];
	_unitRespect = if (count _unit > 3) then [{ _unit select 3 }, {0}];
  
 	_spawnPositionIndex = lbCurSel AIS_Dialog_CAS_SpawnPositionsComboBox;
 
	if(_spawnPositionINdex == 0) then {
	    _randPosition = [position player, (random [2500, 3500 , 4000]), (random 360)] call BIS_fnc_relPos;			
	    _randPosition set [2, 800];        
 	    
 
        _special = "FLY";
        _allowDamange = true;
        _spawnPosition =  _randPosition; 
        _dirAndUp = nil;   

		_spawnPositionCost = AIS_Cas_PatrolUnit_Cost;
		_spawnPositionRespect = AIS_Cas_PatrolUnit_Respect;

	} else {
        _spawnPositions = if (!isNil { _unit select 6 }) then [{ _unit select 6}, {[]}];   
        _spawnPositionObj = if (count _spawnPositions > _spawnPositionIndex - 1) then [{ _spawnPositions select _spawnPositionIndex - 1}, {[]}];   
 
        //[(0) Name, (1) Position, (2) Dir and Up, (3) Cost, (4) Respect, (4) Required Items    
        _spawnPosition = if (count _spawnPositionObj > 1) then [{ _spawnPositionObj select 1 }, {[]}];   
        _dirAndUp = if (count _spawnPositionObj > 2) then [{ _spawnPositionObj select 2 }, {[]}];   
        _spawnPositionCost = if (count _spawnPositionObj > 3) then [{ _spawnPositionObj select 3 }, {0}];
        _spawnPositionRespect = if (count _spawnPositionObj > 4) then [{ _spawnPositionObj select 4 }, {0}];

        _altitude = 0;
        _special = "NONE";
        _allowDamange = true; 
    };
  
    _durationIndex = lbCurSel AIS_Dialog_CAS_DurationComboBox;
	_durations = if (count _unit > 7) then [{ _unit select 7 }, {[]}]; 
	_duration = if (count _durations > _durationIndex) then [{ _durations select _durationIndex }, {[]}]; 
	_durationCost = if (count _duration > 1) then [{ _duration select 1 }, {0}];	
	_durationRespect = if (count _duration > 2) then [{ _duration select 2 }, {0}];
    
	_totalCost = _unitCost + _durationCost + _spawnPositionCost;
	

    if(_playerTabs < _totalCost) exitWith {
        ["errorTitleAndText",    
            [
                "AI Support - CAS Mission",  
                "You need more pop tabs for the CAS mission..."
            ]
        ] call ExileClient_gui_toaster_addTemplateToast;             
    };
    if(_playerRespect < _requiredRespect) exitWith {
        ["errorTitleAndText",    
            [
                "AI Support - CAS Mission",  
                "You need more respect for the CAS mission..."
            ]
        ] call ExileClient_gui_toaster_addTemplateToast;                          
    };

 	 _spawnProperties = [_vehicleClass,_spawnPosition,[],_altitude,_special,_allowDamange];
     if (!isNil { _dirAndUp }) then [{ _spawnProperties set  [2, _dirAndUp] }, {_spawnProperties set  [2, nil]}];

    
    
    [_unitName, _spawnProperties, (_duration select 0)*60] spawn AIS_Client_fnc_LaunchVirtualCAS;
 
    _respectText = format["CAS mission called costing you %1 pop tabs. You earned %2 respect.", _totalCost, _respectEarned];
    
    if(_respectEarned == 0) then {
        _respectText = format["CAS mission called costing you %1 pop tabs.", _totalCost];
    };
    if(_respectEarned < 0) then {
        _respectText = format["CAS mission called costing you %1 pop tabs. You lost %2 respect.", _totalCost, _respectEarned];
    };


    ["infoTitleAndText",    
        [
            "AI Support - CAS Mission",  
            format["%1", _respectText]
        ]
    ] call ExileClient_gui_toaster_addTemplateToast;     
 
 
    if(_playerTabs < _totalCost) exitWith {};
   // if(_playerRespect < _respect) exitWith {};
 
    if(_playerMoney >= _totalCost) then {  
        _newMoneyAmount = _playerMoney - _totalCost;   
        [player, _newMoneyAmount] remoteExec ["AIS_Server_fnc_SetPlayerMoney", 2];                            
    }
    else {        
        _newLockerAmount = (_playerLocker - _totalCost) + _playerMoney; 
        [player, 0] remoteExec ["AIS_Server_fnc_SetPlayerMoney", 2];         
        [player, _newLockerAmount] remoteExec ["AIS_Server_fnc_SetPlayerLocker", 2];          
    }; 
    
    _newRespect = _playerRespect + _respectEarned; 
    [player, _newRespect] remoteExec ["AIS_Server_fnc_SetPlayerRespect", 2];    
 

    [] call AIS_Apps_CAS_UpdateTotalCost;
};