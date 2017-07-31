params["_display","_slide","_idc"]; 
disableSerialization;
  
 _baseIDC = 80000;
//ExAd hacky fix 	 
_key  = format["BS%1",-1]; 
(_baseIDC + (ExAd_XM8_MAP_AIS_CAS pushBack _key));

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
_slideBack = _display ctrlCreate ["IGUIBack", _idc, _slide];
_slideBack ctrlSetPosition [_marginX, _marginY, _maxWidth, _maxHeight];
_slideBack ctrlSetBackgroundColor _slideBackgroundColor;
_slideBack ctrlEnable false;
_slideBack ctrlCommit 0;

//////////////////////////////////////////////////// 
//         Panels                                 //
//////////////////////////////////////////////////// 

//Panel Left Back - Unit List
_columnBackLeftUnitList = _display ctrlCreate ["IGUIBack", _idc, _slide];
_columnBackLeftUnitList ctrlSetPosition [_columnLX, _columnY, _columnWidth, _columnHeight * .50];
_columnBackLeftUnitList ctrlSetBackgroundColor _panelBackgroundColor;
_columnBackLeftUnitList ctrlEnable false;
_columnBackLeftUnitList ctrlCommit 0; 

//Panel Left Back - Unit Description
_columnBackLeftUnitDescription = _display ctrlCreate ["IGUIBack", _idc, _slide];
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
_headerText = _display ctrlCreate ["RscStructuredText", AIS_Dialog_CAS_HeaderText, _slide];
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
_unitListBox = _display ctrlCreate ["RscListBox", AIS_Dialog_CAS_UnitListBox, _slide];
_unitListBox ctrlSetPosition [
	_columnLX + _paddingW, 
	_columnY + (1 * _labelH) + (1.5 * _paddingH), 
	_columnWidth - (_paddingW * 2), 
	(_columnHeight * .50) - (1 * _labelH) - (2.5 * _paddingH)
];
_unitListBox ctrlSetEventHandler ["LBSelChanged", "[] call AIS_Apps_CAS_SelectionChanged;"]; 
_unitListBox ctrlSetTextColor _textColor;
_unitListBox  ctrlSetForegroundColor  [.0,.0,.1,1];
_unitListBox  ctrlSetActiveColor  _slideBackgroundColor;
_unitListBox ctrlSetBackgroundColor _listBackgroundColor;
_unitListBox ctrlEnable true;
_unitListBox ctrlCommit 0;

//Unit Description Text
_unitDescriptionText = _display ctrlCreate ["RscStructuredText", AIS_Dialog_CAS_UnitDescriptionText, _slide];
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
_durationText = _display ctrlCreate ["RscStructuredText", -1, _slide];
_durationText ctrlSetPosition [
	_columnRX  + _paddingW, 
    _columnY + (0 * _labelH) + (0 * _comboBoxH) + (1 * _paddingH),
	_columnWidth - (_paddingW * 2), 
	_labelH
];
_durationText ctrlSetText "Support Duration";
_durationText ctrlSetTextColor _textColor;
_durationText ctrlSetBackgroundColor _labelBackgroundColor;  
_durationText ctrlEnable false;
_durationText ctrlCommit 0;

//Shell Type Combo
_durationComboBox = _display ctrlCreate ["RscCombo", AIS_Dialog_CAS_DurationComboBox, _slide];
_durationComboBox ctrlSetPosition [ 
	_columnRX  + _paddingW, 
    _columnY + (1 * _labelH) + (0 * _comboBoxH) + (1.5 * _paddingH),
	_columnWidth  - (_paddingW * 2), 
	_comboBoxH
];
_durationComboBox ctrlSetEventHandler ["LBSelChanged", "[] call AIS_Apps_CAS_UpdateTotalCost;  AIS_Dialog_CAS_SelectedDuration = (_this select 1);"]; 
_durationComboBox ctrlSetTextColor _textColor;
_durationComboBox ctrlSetActiveColor  [0,0,0,1];
_durationComboBox ctrlSetActiveColor  _slideBackgroundColor;
_durationComboBox ctrlSetBackgroundColor _listBackgroundColor;  
_durationComboBox ctrlEnable true;
_durationComboBox ctrlCommit 0;

//Shell Count Text
_departFromText = _display ctrlCreate ["RscStructuredText", -1, _slide];
_departFromText ctrlSetPosition [
	_columnRX  + _paddingW, 
    _columnY + (1 * _labelH) + (1 * _comboBoxH) + (3 * _paddingH),
	_columnWidth - (_paddingW * 2), 
	_labelH
];
_departFromText ctrlSetText "Air Field";
_departFromText ctrlSetTextColor _textColor;
_departFromText ctrlSetBackgroundColor _labelBackgroundColor;
_departFromText ctrlEnable false;
_departFromText ctrlCommit 0; 

 //Shell Count Combo
_departFromComboBox = _display ctrlCreate ["RscCombo", AIS_Dialog_CAS_SpawnPositionsComboBox, _slide];
_departFromComboBox  ctrlSetPosition [ 
	_columnRX  + _paddingW, 
    _columnY + (2 * _labelH) + (1 * _comboBoxH) + (3.5 * _paddingH),
	_columnWidth  - (_paddingW * 2), 
	_comboBoxH
];
_departFromComboBox ctrlSetEventHandler ["LBSelChanged", "[] call AIS_Apps_CAS_UpdateTotalCost; AIS_Dialog_CAS_SelectedSpawnPoint = (_this select 1);"]; 
_departFromComboBox ctrlSetTextColor _textColor;
_departFromComboBox ctrlSetActiveColor  _slideBackgroundColor;
_departFromComboBox ctrlSetBackgroundColor _listBackgroundColor;
_departFromComboBox ctrlEnable true;
_departFromComboBox ctrlCommit 0;

//Open Map Button 
_mapButton = _display ctrlCreate ["RscExileXM8ButtonMenu",AIS_Dialog_CAS_MapButton, _slide];
_mapButton ctrlSetTextColor _textColor;
_mapButton ctrlSetBackgroundColor [0.1,0.1,0.1,1];
_mapButton ctrlSetBackgroundColor _labelBackgroundColor;
_mapButton  ctrlSetPosition [ 
	_columnRX  + _paddingW, 
    _columnY + (2 * _labelH) + (2 * _comboBoxH) + (5 * _paddingH),
	_columnWidth  - (_paddingW * 2), 
	_bttonH * 1.5
];
_mapButton ctrlSetStructuredText parseText "<t size='1.5'>View Supporting Bases</t>";
_mapButton ctrlSetEventHandler ["ButtonClick", "[] spawn AIS_Apps_CAS_GetSpawnPositions;"];
_mapButton ctrlCommit 0;  
 
//Overall Description Text
_overallDescriptionText = _display ctrlCreate ["RscStructuredText", AIS_Dialog_CAS_OverallDescriptionText, _slide];
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
_backButton = _display ctrlCreate ["RscExileXM8ButtonMenu",_idc,_slide];
_backButton ctrlSetPosition [(_staticButtonX - _bttonW) - (_paddingW * 3), _footerY, _bttonW, _bttonH];
_backButton ctrlSetText "Cancel";
_backButton ctrlSetEventHandler ["ButtonClick", "['extraApps', 1] call ExileClient_gui_xm8_slide;"];
_backButton ctrlSetTooltip "Back to app list.";
_backButton ctrlCommit 0; 

//Confirm Button 
_backButton = _display ctrlCreate ["RscExileXM8ButtonMenu", AIS_Dialog_CAS_ConfirmButton, _slide];
_backButton ctrlSetPosition [_staticButtonX, _footerY, _bttonW, _bttonH];
_backButton ctrlSetText "Confirm";
_backButton ctrlSetEventHandler ["ButtonClick", "[] spawn AIS_Apps_CAS_ConfirmMission;"];
_backButton ctrlSetTooltip "Back to app list.";
_backButton ctrlCommit 0; 
_backButton ctrlEnable false;
 

 /////// MAP

_mapDisplay = findDisplay 12;

_spawnListBox = _mapDisplay ctrlCreate ["RscListBox", AIS_Dialog_CAS_SpawnListBox];
_spawnListBox ctrlSetPosition [
	safeZoneX - (safeZoneX * .05), 
	safeZoneY + .5,
	.15,
	.5
];
_spawnListBox ctrlSetTextColor _textColor;
_spawnListBox ctrlSetActiveColor  [0,0,0,1];
_spawnListBox ctrlSetActiveColor  _slideBackgroundColor;
_spawnListBox ctrlSetBackgroundColor _listBackgroundColor;  
_spawnListBox ctrlSetEventHandler ["LBSelChanged", "[_this select 1] spawn {
	disableSerialization;
	AIS_Dialog_CAS_SelectedSpawnPoint = (_this select 0);

	if(AIS_Dialog_CAS_SelectedSpawnPoint < 0) exitwith {};
	_position = spawnPositions select AIS_Dialog_CAS_SelectedSpawnPoint;
	mapAnimAdd [.5, .15, _position select 1]; 
	mapAnimCommit;      

	{ 
		_markerName = format['AIS_CAS_SPAWN_%1', _forEachIndex];
		_markerName setMarkerColor 'ColorKhaki'; 
	} forEach spawnPositions;

	_markerName = format['AIS_CAS_SPAWN_%1', AIS_Dialog_CAS_SelectedSpawnPoint];
	_markerName setMarkerColor 'ColorGreen';     

	if(AIS_Dialog_CAS_SelectedSpawnPoint == 0) exitwith{
		AIS_Dialog_CAS_SelectedSpawnPoint = 0;
	};		
	AIS_Dialog_CAS_SelectedSpawnPoint = AIS_Dialog_CAS_SelectedSpawnPoint + 1;	
};"];     
_spawnListBox ctrlEnable true;
_spawnListBox ctrlShow false;
_spawnListBox ctrlCommit 0;

//Back Button 
_closeMapButton = _mapDisplay ctrlCreate ["RscExileXM8ButtonMenu", AIS_Dialog_CAS_MapCloseButton];
_closeMapButton ctrlSetPosition [
	0.75,
	0.76, 
	_bttonW, 
	_bttonH
];
_closeMapButton ctrlSetText "Close Map";
_closeMapButton ctrlSetEventHandler ["ButtonClick", "[] spawn AIS_Apps_CAS_CloseMap;"];
_closeMapButton ctrlSetTooltip "ToolTip";
_closeMapButton ctrlCommit 0;    
_closeMapButton ctrlShow false; 