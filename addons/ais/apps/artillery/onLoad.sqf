params["_display","_slide","_idc"]; 
disableSerialization;

 _baseIDC = 70000;
//ExAd hacky fix 	 

ExAd_XM8_MAP_AIS_Artillery pushBack "BS";

 
_pW = 0.025;
_pH = 0.04;
_bttonW = 0.15;
_bttonH = 0.04;
_footerY = .68;
_staticButtonX = .675;

//_leftCol = 0;
//_leftColW = 12.8;
//_rightCol = _leftCol + _leftColW + 2;
//_rightColW = _leftColW + 3;
_margin = 0.2;
_marginX = 0.010;
_marginY = 0.055;
_paddingW = 0.010;
_paddingH = 0.010;
 
_maxHeight = 1 - (_margin*2);
_maxWidth = 0.830;

_comboBoxH = 0.05;
_labelH = 0.045;

_headerY = _marginY + .005;
_columnHeight = _maxHeight - _labelH - (_paddingH * 2);
_columnWidth = (_maxWidth / 2) - _paddingW - (_paddingW / 2);
_columnY = _marginY + _labelH + _paddingH;
_columnLX = _marginX + _paddingW;
_columnRX = _columnLX + _columnWidth + _paddingW;


//Theme
_selectedTheme = AIS_XM8_Slide_Themes select AIS_XM8_Slide_Theme;
_slideBackgroundColor = _selectedTheme select 0;
_panelBackgroundColor =  _selectedTheme select 1;
_labelBackgroundColor =  _selectedTheme select 2;
_listBackgroundColor  =  _selectedTheme select 3;
_textColor  =  _selectedTheme select 4;



//////////////////////////////////////////////////// 
//         Slide Background                       //
//////////////////////////////////////////////////// 

//Slide Back
_slideBack = _display ctrlCreate ["IGUIBack", -1, _slide];
_slideBack ctrlSetPosition [_marginX, _marginY, _maxWidth, _maxHeight];
_slideBack ctrlSetBackgroundColor _slideBackgroundColor;
_slideBack ctrlEnable false;
_slideBack ctrlCommit 0;


//////////////////////////////////////////////////// 
//         Panels                                 //
//////////////////////////////////////////////////// 

//Panel Left Back - Unit List
_columnBackLeftUnitList = _display ctrlCreate ["IGUIBack", -1, _slide];
_columnBackLeftUnitList ctrlSetPosition [_columnLX, _columnY, _columnWidth, _columnHeight * .50];
_columnBackLeftUnitList ctrlSetBackgroundColor _panelBackgroundColor;
_columnBackLeftUnitList ctrlEnable false;
_columnBackLeftUnitList ctrlCommit 0; 

//Panel Left Back - Unit Description
_columnBackLeftUnitDescription = _display ctrlCreate ["IGUIBack", -1, _slide];
_columnBackLeftUnitDescription ctrlSetPosition [
	_columnLX, 
	((_columnHeight * .50) + _columnY) + (_paddingH * 1.5), 
	_columnWidth, 
	(_columnHeight * .50) - (_paddingH * 1.5)
];
_columnBackLeftUnitDescription ctrlSetBackgroundColor _panelBackgroundColor;
_columnBackLeftUnitDescription ctrlEnable false;
_columnBackLeftUnitDescription ctrlCommit 0; 

//Panel Right Back - Options
_columnBackRightOptions = _display ctrlCreate ["IGUIBack", -1, _slide];
_columnBackRightOptions ctrlSetPosition [ 
	_columnRX, 
	_columnY, 
	_columnWidth, 
	(_columnHeight  * (.6) - (1 * _paddingH))
];
_columnBackRightOptions ctrlSetBackgroundColor _panelBackgroundColor;
_columnBackRightOptions ctrlEnable false;
_columnBackRightOptions ctrlCommit 0;

//Panel Right Back - Description
_columnBackRightDescription = _display ctrlCreate ["IGUIBack", -1, _slide];
_columnBackRightDescription ctrlSetPosition [ 
	_columnRX, 
	_columnY + (_columnHeight  * (.6)) + (.5 * _paddingH), 
	_columnWidth, 
	(_columnHeight  * (.4) - (.5 * _paddingH))
];
_columnBackRightDescription ctrlSetBackgroundColor _panelBackgroundColor;
_columnBackRightDescription ctrlEnable false;
_columnBackRightDescription ctrlCommit 0; 

//////////////////////////////////////////////////// 
//         Header Controls                        //
//////////////////////////////////////////////////// 

//Header Text
_headerText = _display ctrlCreate ["RscStructuredText", AIS_Dialog_Artillery_HeaderText, _slide];
_headerText ctrlSetPosition [_marginX, _headerY, _maxWidth, _labelH]; 
_headerText ctrlEnable false;
_headerText ctrlCommit 0;


//////////////////////////////////////////////////// 
//         Left Column Controls                   //
//////////////////////////////////////////////////// 

//Unit List Text
_unitListText = _display ctrlCreate ["RscStructuredText", -1, _slide];
_unitListText ctrlSetPosition [
	_columnLX + (1 * _paddingW), 
	_columnY + (0 * _labelH) + (1 * _paddingH), 
	_columnWidth - (_paddingW * 2), 
	_labelH
];
_unitListText ctrlSetText "Available Units";
_unitListText ctrlSetTextColor _textColor;
_unitListText ctrlSetBackgroundColor _labelBackgroundColor;
_unitListText ctrlEnable false;
_unitListText ctrlCommit 0;

//Unit List Box
_unitListBox = _display ctrlCreate ["RscListBox", AIS_Dialog_Artillery_UnitListBox, _slide];
_unitListBox ctrlSetPosition [
	_columnLX + _paddingW, 
	_columnY + (1 * _labelH) + (1.5 * _paddingH), 
	_columnWidth - (_paddingW * 2), 
	(_columnHeight * .50) - (1 * _labelH) - (2.5 * _paddingH)
];
_unitListBox ctrlSetEventHandler ["LBSelChanged", "[] call AIS_Apps_Artillery_SelectionChanged;"]; 
_unitListBox ctrlSetTextColor _textColor;
_unitListBox  ctrlSetForegroundColor  [.0,.0,.1,1];
_unitListBox  ctrlSetActiveColor  _slideBackgroundColor;
_unitListBox ctrlSetBackgroundColor _listBackgroundColor;
_unitListBox ctrlEnable true;
_unitListBox ctrlCommit 0;

//Unit Description Text
_unitDescriptionText = _display ctrlCreate ["RscStructuredText", AIS_Dialog_Artillery_UnitDescriptionText, _slide];
_unitDescriptionText ctrlSetPosition [
	_columnLX + _paddingW, 
	((_columnHeight * .50) + _columnY) + (_paddingH * 2.5), 
	_columnWidth - (_paddingW * 2), 
	(_columnHeight * .50) - (_paddingH * 3.5)
];
_unitDescriptionText ctrlSetTextColor _textColor;
_unitDescriptionText ctrlSetBackgroundColor _labelBackgroundColor;
_unitDescriptionText ctrlEnable false;
_unitDescriptionText ctrlCommit 0;

//////////////////////////////////////////////////// 
//         Right Column Controls                  //
////////////////////////////////////////////////////

//Shell Type Text
_shellTypeText = _display ctrlCreate ["RscStructuredText", -1, _slide];
_shellTypeText ctrlSetPosition [
	_columnRX  + _paddingW, 
    _columnY + (0 * _labelH) + (0 * _comboBoxH) + (1 * _paddingH),
	_columnWidth - (_paddingW * 2), 
	_labelH
];
_shellTypeText ctrlSetText "Shell Type";
_shellTypeText ctrlSetTextColor _textColor;
_shellTypeText ctrlSetBackgroundColor _labelBackgroundColor;  
_shellTypeText ctrlEnable false;
_shellTypeText ctrlCommit 0;

//Shell Type Combo
_shellTypeComboBox = _display ctrlCreate ["RscCombo", AIS_Dialog_Artillery_ShellTypeToFire, _slide];
_shellTypeComboBox ctrlSetPosition [ 
	_columnRX  + _paddingW, 
    _columnY + (1 * _labelH) + (0 * _comboBoxH) + (1.5 * _paddingH),
	_columnWidth  - (_paddingW * 2), 
	_comboBoxH
];  
_shellTypeComboBox ctrlSetEventHandler ["LBSelChanged", "[] call AIS_Apps_Artillery_UpdateTotalCost; AIS_Dialog_Artillery_SelectedShellType = (_this select 1);"]; 
_shellTypeComboBox ctrlSetTextColor _textColor;
_shellTypeComboBox ctrlSetActiveColor  [0,0,0,1];
_shellTypeComboBox ctrlSetActiveColor  _slideBackgroundColor;
_shellTypeComboBox ctrlSetBackgroundColor _listBackgroundColor;  
_shellTypeComboBox ctrlEnable true;
_shellTypeComboBox ctrlCommit 0;

//Shell Count Text
_shellCountText = _display ctrlCreate ["RscStructuredText", -1, _slide];
_shellCountText ctrlSetPosition [
	_columnRX  + _paddingW, 
    _columnY + (1 * _labelH) + (1 * _comboBoxH) + (3 * _paddingH),
	_columnWidth - (_paddingW * 2), 
	_labelH
];
_shellCountText ctrlSetText "Shell Count";
_shellCountText ctrlSetTextColor _textColor;
_shellCountText ctrlSetBackgroundColor _labelBackgroundColor;
_shellCountText ctrlEnable false;
_shellCountText ctrlCommit 0;


//Shell Count Combo
_shellCountComboBox = _display ctrlCreate ["RscCombo", AIS_Dialog_Artillery_ShellCountToFire, _slide];
_shellCountComboBox  ctrlSetPosition [ 
	_columnRX  + _paddingW, 
    _columnY + (2 * _labelH) + (1 * _comboBoxH) + (3.5 * _paddingH),
	_columnWidth  - (_paddingW * 2), 
	_comboBoxH
];
_shellCountComboBox ctrlSetEventHandler ["LBSelChanged", "[] call AIS_Apps_Artillery_UpdateTotalCost;  AIS_Dialog_Artillery_SelectedShellCount = (_this select 1);"]; 
_shellCountComboBox ctrlSetTextColor _textColor;
_shellCountComboBox ctrlSetActiveColor  _slideBackgroundColor;
_shellCountComboBox ctrlSetBackgroundColor _listBackgroundColor;
_shellCountComboBox ctrlEnable true;
_shellCountComboBox ctrlCommit 0;

//Open Map Button 
_mapButton = _display ctrlCreate ["RscExileXM8ButtonMenu",AIS_Dialog_Artillery_MapButton,_slide];
_mapButton ctrlSetTextColor _textColor;
_mapButton ctrlSetBackgroundColor [0.1,0.1,0.1,1];
_mapButton ctrlSetBackgroundColor _labelBackgroundColor;
_mapButton  ctrlSetPosition [ 
	_columnRX  + _paddingW, 
    _columnY + (2 * _labelH) + (2 * _comboBoxH) + (5 * _paddingH),
	_columnWidth  - (_paddingW * 2), 
	_bttonH * 1.5
];
_mapButton ctrlSetStructuredText parseText "<t size='1.5'>Mark Taget Position</t>";
_mapButton ctrlSetEventHandler ["ButtonClick", "[] spawn AIS_Apps_Artillery_GetTargetPosition;"];
_mapButton ctrlCommit 0;  

//Overall Description Text
_overallDescriptionText = _display ctrlCreate ["RscStructuredText", AIS_Dialog_Artillery_OverallDescriptionText, _slide];
_overallDescriptionText ctrlSetPosition [ 
	_columnRX + (1 * _paddingW), 
	_columnY + (_columnHeight  * (.6)) + (1.5 * _paddingH), 
	_columnWidth - (2 * _paddingW), 	
	(_columnHeight  * (.4) - (2.5 * _paddingH))
];
_overallDescriptionText ctrlSetTextColor _textColor;
_overallDescriptionText ctrlSetBackgroundColor _labelBackgroundColor;
_overallDescriptionText ctrlEnable false;
_overallDescriptionText ctrlCommit 0;

//////////////////////////////////////////////////// 
//         Footer Controls                        //
//////////////////////////////////////////////////// 
 
//Back Button 
_backButton = _display ctrlCreate ["RscExileXM8ButtonMenu",-1,_slide];
_backButton ctrlSetPosition [(_staticButtonX - _bttonW) - (_paddingW * 3), _footerY, _bttonW, _bttonH];
_backButton ctrlSetText "Cancel";
_backButton ctrlSetEventHandler ["ButtonClick", "['extraApps', 1] call ExileClient_gui_xm8_slide;"];
_backButton ctrlSetTooltip "Back to app list.";
_backButton ctrlCommit 0; 

//Confirm Button 
_backButton = _display ctrlCreate ["RscExileXM8ButtonMenu", AIS_Dialog_Artillery_ConfirmButton, _slide];
_backButton ctrlSetPosition [_staticButtonX, _footerY, _bttonW, _bttonH];
_backButton ctrlSetText "Confirm";
_backButton ctrlSetEventHandler ["ButtonClick", "[] call AIS_Apps_Artillery_ConfirmMission;"];
_backButton ctrlSetTooltip "Back to app list.";
_backButton ctrlCommit 0; 
_backButton ctrlEnable false;
 
//map controls
_mapDisplay = findDisplay 12; 
 //Back Button  
 
//Button Panel Back


_mapControlGroup = _mapDisplay ctrlCreate ["RscControlsGroup", AIS_Dialog_Artillery_MapControl];
_mapControlGroup ctrlSetPosition [
	safeZoneW - (abs safeZoneX) - (_bttonW * 4),
	safeZoneY - (safeZoneY * .3),
	_bttonW * 3 + (_paddingW * 1.25), 
	_bttonH * 1.5 + (_paddingH * .5)
]; 
_mapControlGroup ctrlCommit 0; 
_mapControlGroup ctrlShow false; 
 

_mapControlGroupBack = _display ctrlCreate ["IGUIBack", -1, _mapControlGroup];
_mapControlGroupBack ctrlSetPosition [
	0,
	0,
	(ctrlPosition _mapControlGroup) select 2, 
	(ctrlPosition _mapControlGroup) select 3
];
_mapControlGroupBack ctrlSetBackgroundColor _slideBackgroundColor;
_mapControlGroupBack ctrlEnable false;
_mapControlGroupBack ctrlCommit 0;


_clearTargetsButton = _mapDisplay ctrlCreate ["RscExileXM8ButtonMenu", AIS_Dialog_Artillery_MapCloseButton, _mapControlGroup];
_clearTargetsButton ctrlSetPosition [
	0,
	0,
	_bttonW * 1.5, 
	_bttonH * 1.5
];
_clearTargetsButton ctrlSetTextColor _textColor;
_clearTargetsButton ctrlSetBackgroundColor [0.1,0.1,0.1,1];
_clearTargetsButton ctrlSetStructuredText parseText "<t size='1.5'>Clear Targets</t>";
_clearTargetsButton ctrlSetEventHandler ["ButtonClick", "sAIS_Dialog_Artillery_SelectedTargetPosition = nil;"];
_clearTargetsButton ctrlCommit 0;    

_mapCloseButton = _mapDisplay ctrlCreate ["RscExileXM8ButtonMenu", AIS_Dialog_Artillery_MapCloseButton, _mapControlGroup];
_mapCloseButton ctrlSetPosition [
	_bttonW * 1.5 + _paddingW,
	0,
	_bttonW * 1.5, 
	_bttonH * 1.5
];
_mapCloseButton ctrlSetTextColor _textColor;
_mapCloseButton ctrlSetBackgroundColor [0.1,0.1,0.1,1];
//_mapButton ctrlSetBackgroundColor _labelBackgroundColor;

_mapCloseButton ctrlSetStructuredText parseText "<t size='1.5'>Close Map</t>";
_mapCloseButton ctrlSetEventHandler ["ButtonClick", "openMap false;"];
_mapCloseButton ctrlCommit 0;    
