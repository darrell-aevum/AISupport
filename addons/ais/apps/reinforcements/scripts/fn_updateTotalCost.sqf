AIS_Apps_CAS_UpdateTotalCost = {  	
	private["_text"];
 	disableSerialization;
 
    _display = uiNameSpace getVariable ["RscExileXM8", displayNull];

	_playerLocker = player getVariable ["ExileLocker", 0];
	_playerMoney = player getVariable ["ExileMoney", 0];      
	_playerTabs = _playerLocker + _playerMoney;		    
	_playerRespect = ExileClientPlayerScore; 

	_headerTextCntrl = _display displayCtrl AIS_Dialog_CAS_HeaderText;    
    _headerText = "<t align='left'>%2 - [%1]</t>";
    _headerText = format[_headerText + "<t align='right'><img  size='0.85' image='addons\ais\icons\respect.paa'/> %3   <img  size='0.75' image='addons\ais\icons\poptab_ca.paa'/> %4</t>",group player, profileName, _playerRespect,_playerTabs];
    _headerTextCntrl ctrlSetStructuredText (parseText _headerText);
	_headerTextCntrl ctrlCommit 0; 

	ctrlEnable [AIS_Dialog_CAS_ConfirmButton, true];	
	ctrlEnable [AIS_Dialog_CAS_MapButton, true];
	
	_mapButton = _display displayCtrl AIS_Dialog_CAS_MapButton;  
	_mapButton	ctrlSetTextColor ((AIS_XM8_Slide_Themes select AIS_XM8_Slide_Theme) select 4);
 
    
	if(isNil "AIS_Dialog_CAS_SelectedUnit" || AIS_Dialog_CAS_SelectedUnit < 0) exitwith{};

    _unit = AIS_CAS_Units select AIS_Dialog_CAS_SelectedUnit;    

    _class = lbData [AIS_Dialog_CAS_UnitListBox, AIS_Dialog_CAS_SelectedUnit];
	_unitName = lbText [AIS_Dialog_CAS_UnitListBox, AIS_Dialog_CAS_SelectedUnit];
 
	_totalCost = 0;

	_unitCost = if (count _unit > 2) then [{ _unit select 2 }, {0}];
	_unitRespect = if (count _unit > 3) then [{ _unit select 3 }, {0}];
  
 	
	_spawnPositions = if (!isNil { _unit select 6 }) then [{ _unit select 6}, {[]}];   
	_spawnPosition = if (count _spawnPositions > AIS_Dialog_CAS_SelectedSpawnPoint) then [{ _spawnPositions select AIS_Dialog_CAS_SelectedSpawnPoint }, {[]}];   
  	_spawnPositionCost = if (count _spawnPosition > 3) then [{ _spawnPosition select 3 }, {0}];
    _spawnPositionRespect = if (count _spawnPosition > 4) then [{ _spawnPosition select 4 }, {0}];

	if(AIS_Dialog_CAS_SelectedSpawnPoint == 0) then {
		_spawnPositionCost = AIS_Cas_PatrolUnit_Cost;
		_spawnPositionRespect = AIS_Cas_PatrolUnit_Respect;
	};

	if(count _spawnPositions <= 1) then {
			ctrlEnable [AIS_Dialog_CAS_MapButton, false];		
	};


	_durations = if (count _unit > 7) then [{ _unit select 7 }, {[]}]; 
	_duration = if (count _durations > AIS_Dialog_CAS_SelectedDuration) then [{ _durations select AIS_Dialog_CAS_SelectedDuration }, {[]}]; 
	_durationCost = if (count _duration > 1) then [{ _duration select 1 }, {0}];	
	_durationRespect = if (count _duration > 2) then [{ _duration select 2 }, {0}];
    
	_totalCost = _unitCost + _durationCost + _spawnPositionCost;
	
	_textCbo = _display displayCtrl AIS_Dialog_CAS_OverallDescriptionText;  
 
	_text = "";

	_requiredRespect = 	_unitRespect;
	if(_requiredRespect < _durationRespect) then {
		_requiredRespect = _durationRespect;
	};
	if(_requiredRespect < _spawnPositionRespect) then {
		_requiredRespect = _spawnPositionRespect;
	}; 
 
	_color = "#ffffff";	
	if(_playerTabs < _durationCost) then {				
		ctrlEnable [AIS_Dialog_CAS_ConfirmButton, false];			
		_color = "#FF0000";
	};			
	_text = format[_text + "<t align='left'size='.75'>Duration - Cost:</t><t color='%2' align='right' size='.75'><img  size='0.50' image='addons\ais\icons\poptab_ca.paa'/> %1</t><br/>", _durationCost, _color];	    

	_color = "#ffffff";	
	if(_playerRespect < _durationRespect) then {				
		ctrlEnable [AIS_Dialog_CAS_ConfirmButton, false];			
		_color = "#FF0000";
	};			
	_text = format[_text + "<t align='left'size='.75'>Duration - Respect:</t><t color='%2' align='right' size='.75'><img  size='0.60' image='addons\ais\icons\respect.paa'/> %1</t><br/>", _durationRespect, _color];	    
 
	_color = "#ffffff";	
	if(_playerTabs < _spawnPositionCost) then {				
		ctrlEnable [AIS_Dialog_CAS_ConfirmButton, false];			
		_color = "#FF0000";
	};			
	_text = format[_text + "<t align='left'size='.75'>Air Field - Cost</t><t color='%2' align='right' size='.75'><img  size='0.50' image='addons\ais\icons\poptab_ca.paa'/> %1</t><br/>", _spawnPositionCost, _color];	    

	_color = "#ffffff";	
	if(_playerRespect < _spawnPositionRespect) then {				
		ctrlEnable [AIS_Dialog_CAS_ConfirmButton, false];			
		_color = "#FF0000";
	};			
	_text = format[_text + "<t align='left'size='.75'>Air Field - Respect</t><t color='%2' align='right' size='.75'><img  size='0.60' image='addons\ais\icons\respect.paa'/> %1</t><br/>", _spawnPositionRespect, _color];	    


	_color = "#ffffff";
	if(_playerTabs < _totalCost) then {				
		ctrlEnable [AIS_Dialog_CAS_ConfirmButton, false];							
		_color = "#FF0000";
	};	
	_text = format[_text + "<t align='left'size='.75'>Total Cost:</t><t color='%2' size='.75' align='right' size='.75'><img  size='0.50' image='addons\ais\icons\poptab_ca.paa'/> %1</t><br/>", _totalCost, _color];	    
 	
	_textCbo ctrlSetStructuredText parseText _text;	 
};