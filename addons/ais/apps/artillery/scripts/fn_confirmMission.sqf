AIS_Apps_Artillery_ConfirmMission = {
    disableSerialization;    
 
	_playerLocker = player getVariable ["ExileLocker", 0];
	_playerMoney = player getVariable ["ExileMoney", 0];      
	_playerTabs = _playerLocker + _playerMoney;		    
	_playerRespect = ExileClientPlayerScore; 

	ctrlEnable [AIS_Dialog_Artillery_ConfirmButton, true];	

    _unitIndex = lbCurSel AIS_Dialog_Artillery_UnitListBox;       
	if(isNil "_unitIndex" || _unitIndex < 0) exitwith{};

    _unit = AIS_Artillery_Units select _unitIndex;    
    //[Class [Class Name, Title], Description, Cost, Respect, Required Items, Min Rounds To Fire, Max Rounds To Fire, Accuracy,  RespectEarned per round fired]	
    _accuracy =  if (count _unit > 7) then [{_unit select 7 }, {100}];
    _cost = if (count _unit > 2) then [{_unit select 2 }, {100}];
    _respect = if (count _unit > 3) then [{_unit select 3 }, {100}];
    _respectEarned = if (count _unit > 8) then [{_unit select 8 }, {0}];


    _class = lbData [AIS_Dialog_Artillery_UnitListBox, _unitIndex];
	_unitName = lbText [AIS_Dialog_Artillery_UnitListBox, _unitIndex];
 
	_totalCost = 0;
 
    _shellCountIndex = lbCurSel AIS_Dialog_Artillery_ShellCountToFire;
	_shellCount = lbValue [AIS_Dialog_Artillery_ShellCountToFire, _shellCountIndex];	 
   


	_shellTypeIndex = lbCurSel AIS_Dialog_Artillery_ShellTypeToFire;
	_shellType = lbData [AIS_Dialog_Artillery_ShellTypeToFire, _shellTypeIndex];	 
  
      _respectEarned = _respectEarned * _shellCount;
	_totalCost = _cost * _shellCount;
  
    if(_playerTabs < _totalCost) exitWith {
        ["errorTitleAndText",    
            [
                "AI Support - Fire Mission",  
                "You need more pop tabs for the fire mission..."
            ]
        ] call ExileClient_gui_toaster_addTemplateToast;             
    };
    if(_playerRespect < _respect) exitWith {        
        ["errorTitleAndText",    
            [
                "AI Support - Fire Mission",  
                "You need more respect for the fire mission..."
            ]
        ] call ExileClient_gui_toaster_addTemplateToast;                          
    };

    ///////////////////////////////////////////////
    //      Fire Artillery                       //
    ///////////////////////////////////////////////
    [_shellCount, _shellType, AIS_Dialog_Artillery_SelectedTargetPosition, _accuracy] spawn AIS_Client_fnc_FireVirtualArtillery;
    AIS_Dialog_Artillery_SelectedTargetPosition = nil;

    _respectText = format["Fire mission called costing you %1 pop tabs. You earned %2 respect.", _totalCost, _respectEarned];
    
    if(_respectEarned < 0) then {
        _respectText = format["Fire mission called costing you %1 pop tabs. You lost %2 respect.", _totalCost, _respectEarned];
    };

    ["infoTitleAndText",    
        [
            "AI Support - Fire Mission",  
            format["%1", _respectText]
        ]
    ] call ExileClient_gui_toaster_addTemplateToast;     
 

    ///////////////////////////////////////////////
    //    Update Player Money/Locker/Respect     //
    ///////////////////////////////////////////////
    if(_playerTabs < _totalCost) exitWith {};
    if(_playerRespect < _respect) exitWith {};
 
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
 

    ///////////////////////////////////////////////
    //    Update Total Cost                      //
    ///////////////////////////////////////////////
    [] spawn AIS_Apps_Artillery_UpdateTotalCost;
};