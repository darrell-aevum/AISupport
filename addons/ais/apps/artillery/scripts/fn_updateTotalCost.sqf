AIS_Apps_Artillery_UpdateTotalCost = {  	
 	disableSerialization;

    _display = uiNameSpace getVariable ["RscExileXM8", displayNull];

	_playerLocker = player getVariable ["ExileLocker", 0];
	_playerMoney = player getVariable ["ExileMoney", 0];      
	_playerTabs = _playerLocker + _playerMoney;		    
	_playerRespect = ExileClientPlayerScore; 

	_headerText = _display displayCtrl AIS_Dialog_Artillery_HeaderText;    
    _text = "<t align='left'>%2 - [%1]</t>";
    _text = format[_text + "<t align='right'><img  size='0.85' image='addons\ais\icons\respect.paa'/> %3   <img  size='0.75' image='addons\ais\icons\poptab_ca.paa'/> %4</t>",group player, profileName, _playerRespect,_playerTabs];
    _headerText ctrlSetStructuredText (parseText _text);
	_headerText ctrlCommit 0; 

	ctrlEnable [AIS_Dialog_Artillery_ConfirmButton, true];	

	_mapButton = _display displayCtrl AIS_Dialog_Artillery_MapButton;  
	_mapButton	ctrlSetTextColor ((AIS_XM8_Slide_Themes select AIS_XM8_Slide_Theme) select 4);
 

    _unitIndex = lbCurSel AIS_Dialog_Artillery_UnitListBox;       
	if(isNil "_unitIndex" || _unitIndex < 0) exitwith{};

    _unit = AIS_Artillery_Units select _unitIndex;    

    _class = lbData [AIS_Dialog_Artillery_UnitListBox, _unitIndex];
	_unitName = lbText [AIS_Dialog_Artillery_UnitListBox, _unitIndex];
 
	_totalCost = 0;

	_cost = if (count _unit > 2) then [{ _unit select 2 }, {0}];
	_respect = if (count _unit > 3) then [{ _unit select 3 }, {0}];
 
    _shellCountIndex = lbCurSel AIS_Dialog_Artillery_ShellCountToFire;
	_shellCount = lbValue [AIS_Dialog_Artillery_ShellCountToFire, _shellCountIndex];	 
   
	_shellTypeIndex = lbCurSel AIS_Dialog_Artillery_ShellTypeToFire;
	_shellType = lbText [AIS_Dialog_Artillery_ShellTypeToFire, _shellTypeIndex];	 
  
	_totalCost = _cost * _shellCount;

	_textCbo = _display displayCtrl AIS_Dialog_Artillery_OverallDescriptionText;  

	_text = format["<t align='left' size='.75'>Selected Unit:</t><t align='right' size='.75'>%1</t><br/>", _unitName];
	_text = format[_text + "<t align='left'size='.75'>Shell Type:</t><t size='.75' align='right' size='.75'>%1</t><br/>", _shellType];	    
	_text = format[_text + "<t align='left'size='.75'>Shell Count:</t><t  size='.75' align='right' size='.75'> %1</t><br/>", _shellCount];	    

	if( isNil { AIS_Dialog_Artillery_SelectedTargetPosition } ) then { 
	 
		_mapButton	ctrlSetTextColor [1,0,0,1];		
		_text = format[_text + "<t align='left'size='.75'>Target Position:</t><t color='#ff0000' align='right' size='.75'>No Target</t><br/>"];			
	} else {
		_text = format[_text + "<t align='left'size='.75'>Target Position:</t><t color='%2' align='right' size='.75'> %1</t><br/>", mapGridPosition AIS_Dialog_Artillery_SelectedTargetPosition];	    
	};
	

	_color = "#ffffff";	
	if(_playerRespect < _respect) then {				
		ctrlEnable [AIS_Dialog_Artillery_ConfirmButton, false];			
		_color = "#FF0000";
	};			
	_text = format[_text + "<t align='left'size='.75'>Required Respect:</t><t color='%2' align='right' size='.75'><img  size='0.50' image='addons\ais\icons\respect.paa'/> %1</t><br/>", _respect, _color];	    

	_color = "#ffffff";
	if(_playerTabs < _totalCost) then {				
		ctrlEnable [AIS_Dialog_Artillery_ConfirmButton, false];							
		_color = "#FF0000";
	};	
	_text = format[_text + "<t align='left'size='.75'>Total Cost:</t><t color='%2' size='.75' align='right' size='.75'><img  size='0.50' image='addons\ais\icons\poptab_ca.paa'/> %1</t><br/>", _totalCost, _color];	    
 	
	_textCbo ctrlSetStructuredText parseText _text;	 
};