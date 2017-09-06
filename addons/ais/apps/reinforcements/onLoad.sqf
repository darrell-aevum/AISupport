params["_display","_slide","_idc"]; 
disableSerialization;
  
 _baseIDC = 80000;
//ExAd hacky fix 	 
_key  = format["BS%1",-1]; 
(_baseIDC + (ExAd_XM8_MAP_AIS_Reinforcements pushBack _key));

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
	(_columnHeight  * (.8) - (1 * _paddingH))
];
_columnBackRightOptions ctrlSetBackgroundColor _panelBackgroundColor;
_columnBackRightOptions ctrlEnable false;
_columnBackRightOptions ctrlCommit 0;

//Panel Right Back - Description
_columnBackRightDescription = _display ctrlCreate ["IGUIBack", -1, _slide];
_columnBackRightDescription ctrlSetPosition [ 
	_columnRX, 
	_columnY + (_columnHeight  * (.8)) + (.5 * _paddingH), 
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
_headerText = _display ctrlCreate ["RscStructuredText", AIS_Dialog_Reinforcements_HeaderText, _slide];
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

//Shell Type Combo
_unitTypeComboBox = _display ctrlCreate ["RscCombo", AIS_Dialog_Reinforcements_UnitTypeComboBox, _slide];
_unitTypeComboBox ctrlSetPosition [ 
	_columnLX + (1 * _paddingW), 
    _columnY + (1 * _labelH) + (0 * _comboBoxH) + (1.5 * _paddingH),
	_columnWidth  - (_paddingW * 2), 
	_comboBoxH 
];
_unitTypeComboBox ctrlSetEventHandler ["LBSelChanged", "AIS_Dialog_Reinforcements_SelectedUnitType = _this select 1; [] call AIS_Apps_Reinforcements_UnitTypeChanged;"]; 
_unitTypeComboBox ctrlSetTextColor _textColor;
_unitTypeComboBox ctrlSetActiveColor  [0,0,0,1];
_unitTypeComboBox ctrlSetActiveColor  _slideBackgroundColor;
_unitTypeComboBox ctrlSetBackgroundColor _listBackgroundColor;  
_unitTypeComboBox ctrlEnable true;
_unitTypeComboBox ctrlCommit 0;
 
//Unit List Box
_unitListBox = _display ctrlCreate ["RscListBox", AIS_Dialog_Reinforcements_UnitListBox, _slide];
_unitListBox ctrlSetPosition [
	_columnLX + _paddingW, 
	_columnY + (1 * _labelH) + (1 * _comboBoxH) + (2 * _paddingH), 
	_columnWidth - (_paddingW * 2), 
	(_columnHeight * .50) - (1 * _labelH) - (1 * _comboBoxH) - (3  * _paddingH)
];
_unitListBox ctrlSetEventHandler ["LBSelChanged", "AIS_Dialog_Reinforcements_SelectedUnit = _this select 1; [] call AIS_Apps_Reinforcements_SelectionChanged;"]; 
_unitListBox ctrlSetEventHandler ["LBDblClick", "AIS_Dialog_Reinforcements_SelectedUnit = _this select 1; [] call AIS_Apps_Reinforcements_AddUnitToCargo;"]; 
_unitListBox ctrlSetTextColor _textColor;
_unitListBox  ctrlSetForegroundColor  [.0,.0,.1,1];
_unitListBox  ctrlSetActiveColor  _slideBackgroundColor;
_unitListBox ctrlSetBackgroundColor _listBackgroundColor;
_unitListBox ctrlEnable true;
_unitListBox ctrlCommit 0;

//Unit Description Text
_unitDescriptionText = _display ctrlCreate ["RscStructuredText", AIS_Dialog_Reinforcements_UnitDescriptionText, _slide];
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
_durationText ctrlSetText "Selected Units";
_durationText ctrlSetTextColor _textColor;
_durationText ctrlSetBackgroundColor _labelBackgroundColor;  
_durationText ctrlEnable false;
_durationText ctrlCommit 0;

//Selected Unit List Box
_selectedUnitsListBox = _display ctrlCreate ["RscListBox", AIS_Dialog_Reinforcements_SelectedUnitsListBox, _slide];
_selectedUnitsListBox ctrlSetPosition [
	_columnRX + _paddingW, 
	_columnY + (1 * _labelH) + (1.5 * _paddingH), 
	_columnWidth - (_paddingW * 2), 
	(_columnHeight * .25)
];
_selectedUnitsListBox ctrlSetEventHandler ["LBSelChanged", "[] call AIS_Apps_Reinforcements_SelectionChanged;"]; 
_selectedUnitsListBox ctrlSetEventHandler ["LBDblClick", "[_this select 1] call AIS_Apps_Reinforcements_RemoveUnitFromCargo;"]; 
_selectedUnitsListBox ctrlSetTextColor _textColor;
_selectedUnitsListBox  ctrlSetForegroundColor  [.0,.0,.1,1];
_selectedUnitsListBox  ctrlSetActiveColor  _slideBackgroundColor;
_selectedUnitsListBox ctrlSetBackgroundColor _listBackgroundColor;
_selectedUnitsListBox ctrlEnable true;
_selectedUnitsListBox ctrlCommit 0;
 
//Shell Type Text
_insertionTypeText = _display ctrlCreate ["RscStructuredText", -1, _slide];
_insertionTypeText ctrlSetPosition [ 
	_columnRX  + _paddingW, 
    _columnY + ((_columnHeight * .25)) + (1 * _labelH) + (0 * _comboBoxH) + (2 * _paddingH),
	_columnWidth - (_paddingW * 2), 
	_labelH
];

_insertionTypeText ctrlSetText "Insertion Type";
_insertionTypeText ctrlSetTextColor _textColor;
_insertionTypeText ctrlSetBackgroundColor _labelBackgroundColor;  
_insertionTypeText ctrlEnable false;
_insertionTypeText ctrlCommit 0;
  
//Shell Type Combo
_insertionTypeComboBox = _display ctrlCreate ["RscCombo", AIS_Dialog_Reinforcements_InsertionTypeComboBox, _slide];
_insertionTypeComboBox ctrlSetPosition [ 
	_columnRX  + _paddingW, 
    _columnY + ((_columnHeight * .25)) + (2 * _labelH) + (0 * _comboBoxH) + (2.5 * _paddingH),
	_columnWidth - (_paddingW * 2), 
	_comboBoxH
];
_insertionTypeComboBox ctrlSetEventHandler ["LBSelChanged", "AIS_Dialog_Reinforcements_SelectedInsertionType = _this select 1; [] call AIS_Apps_Reinforcements_InsertionTypeChanged;"]; 
_insertionTypeComboBox ctrlSetTextColor _textColor;
_insertionTypeComboBox ctrlSetActiveColor  [0,0,0,1];
_insertionTypeComboBox ctrlSetActiveColor  _slideBackgroundColor;
_insertionTypeComboBox ctrlSetBackgroundColor _listBackgroundColor;  
_insertionTypeComboBox ctrlEnable true;
_insertionTypeComboBox ctrlCommit 0;

//Shell Type Text
_insertionVehicleText = _display ctrlCreate ["RscStructuredText", -1, _slide];
_insertionVehicleText ctrlSetPosition [
	_columnRX  + _paddingW, 
    _columnY + ((_columnHeight * .25)) + (2 * _labelH) + (1 * _comboBoxH) + (3 * _paddingH),
	_columnWidth - (_paddingW * 2), 
	_labelH
];
_insertionVehicleText ctrlSetText "Insertion Vehicle";
_insertionVehicleText ctrlSetTextColor _textColor;
_insertionVehicleText ctrlSetBackgroundColor _labelBackgroundColor;  
_insertionVehicleText ctrlEnable false;
_insertionVehicleText ctrlCommit 0;
  
//Shell Type Combo
_insertionVehicleComboBox = _display ctrlCreate ["RscCombo", AIS_Dialog_Reinforcements_InsertionVehicleComboBox, _slide];
_insertionVehicleComboBox ctrlSetPosition [ 
	_columnRX  + _paddingW, 
    _columnY + ((_columnHeight * .25)) + (3 * _labelH) + (1 * _comboBoxH) + (4 * _paddingH),
	_columnWidth - (_paddingW * 2), 
	_comboBoxH 	 
];
_insertionVehicleComboBox ctrlSetEventHandler ["LBSelChanged", "AIS_Dialog_Reinforcements_SelectedInsertionVehicle = _this select 1;"]; 
_insertionVehicleComboBox ctrlSetTextColor _textColor;
_insertionVehicleComboBox ctrlSetActiveColor  [0,0,0,1];
_insertionVehicleComboBox ctrlSetActiveColor  _slideBackgroundColor;
_insertionVehicleComboBox ctrlSetBackgroundColor _listBackgroundColor;  
_insertionVehicleComboBox ctrlEnable true;
_insertionVehicleComboBox ctrlCommit 0;





//Overall Description Text
_overallDescriptionText = _display ctrlCreate ["RscStructuredText", AIS_Dialog_Reinforcements_OverallDescriptionText, _slide];
_overallDescriptionText ctrlSetPosition [ 
	_columnRX + (1 * _paddingW), 
	_columnY + (_columnHeight  * (.8)) + (1.5 * _paddingH), 
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
_backButton ctrlSetPosition [_columnLX + (2 * _paddingW), _footerY, _bttonW, _bttonH];
_backButton ctrlSetText "Cancel";
_backButton ctrlSetEventHandler ["ButtonClick", "['extraApps', 1] call ExileClient_gui_xm8_slide;"];
_backButton ctrlSetTooltip "Back to app list.";
_backButton ctrlCommit 0; 

//Confirm Button 
_confirmButton = _display ctrlCreate ["RscExileXM8ButtonMenu", AIS_Dialog_Reinforcements_ConfirmButton, _slide];
_confirmButton ctrlSetPosition [_columnWidth - _bttonW, _footerY, _bttonW, _bttonH];
_confirmButton ctrlSetText "Confirm";
_confirmButton ctrlSetEventHandler ["ButtonClick", "[] spawn AIS_Apps_Reinforcements_ConfirmMission;"];
_confirmButton ctrlSetTooltip "Back to app list.";
_confirmButton ctrlCommit 0; 
_confirmButton ctrlEnable true;
 

 /////// MAP

_mapDisplay = findDisplay 12;

_spawnListBox = _mapDisplay ctrlCreate ["RscListBox", AIS_Dialog_Reinforcements_SpawnListBox];
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
	AIS_Dialog_Reinforcements_SelectedSpawnPoint = (_this select 0);

	if(AIS_Dialog_Reinforcements_SelectedSpawnPoint < 0) exitwith {};
	_position = spawnPositions select AIS_Dialog_Reinforcements_SelectedSpawnPoint;
	mapAnimAdd [.5, .15, _position select 1]; 
	mapAnimCommit;      

	{ 
		_markerName = format['AIS_Reinforcements_SPAWN_%1', _forEachIndex];
		_markerName setMarkerColor 'ColorKhaki'; 
	} forEach spawnPositions;

	_markerName = format['AIS_Reinforcements_SPAWN_%1', AIS_Dialog_Reinforcements_SelectedSpawnPoint];
	_markerName setMarkerColor 'ColorGreen';     

	if(AIS_Dialog_Reinforcements_SelectedSpawnPoint == 0) exitwith{
		AIS_Dialog_Reinforcements_SelectedSpawnPoint = 0;
	};		
	AIS_Dialog_Reinforcements_SelectedSpawnPoint = AIS_Dialog_Reinforcements_SelectedSpawnPoint + 1;	
};"];     
_spawnListBox ctrlEnable true;
_spawnListBox ctrlShow false;
_spawnListBox ctrlCommit 0;

//Back Button 
_closeMapButton = _mapDisplay ctrlCreate ["RscExileXM8ButtonMenu", AIS_Dialog_Reinforcements_MapCloseButton];
_closeMapButton ctrlSetPosition [
	0.75,
	0.76, 
	_bttonW, 
	_bttonH
];
_closeMapButton ctrlSetText "Close Map";
_closeMapButton ctrlSetEventHandler ["ButtonClick", "[] spawn AIS_Apps_Reinforcements_CloseMap;"];
_closeMapButton ctrlSetTooltip "ToolTip";
_closeMapButton ctrlCommit 0;    
_closeMapButton ctrlShow false; 