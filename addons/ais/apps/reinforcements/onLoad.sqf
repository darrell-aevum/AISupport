params["_display","_slide","_idc"]; 
disableSerialization;
  
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


_headerText = _display ctrlCreate ["RscStructuredText", AIS_Dialog_CAS_HeaderText, _slide];
_headerText ctrlSetPosition [_marginX, _headerY, _maxWidth, _labelH]; 
_headerText ctrlSetText "Still in testing phase... Click confirm to add an Engineer to your group.";
_headerText ctrlCommit 0;


//////////////////////////////////////////////////// 
//         Slide Background                       //
//////////////////////////////////////////////////// 

//Slide Back
_slideBack = _display ctrlCreate ["IGUIBack", _idc, _slide];
_slideBack ctrlSetPosition [_marginX, _marginY, _maxWidth, _maxHeight];
_slideBack ctrlSetBackgroundColor _slideBackgroundColor;
_slideBack ctrlEnable false;
_slideBack ctrlCommit 0;
 
 
//Back Button 
_backButton = _display ctrlCreate ["RscExileXM8ButtonMenu",_idc,_slide];
_backButton ctrlSetPosition [(_staticButtonX - _bttonW) - (_paddingW * 3), _footerY, _bttonW, _bttonH];
_backButton ctrlSetText "Cancel";
_backButton ctrlSetEventHandler ["ButtonClick", "['extraApps', 1] call ExileClient_gui_xm8_slide;"];
_backButton ctrlSetTooltip "Back to app list.";
_backButton ctrlCommit 0; 

//Confirm Button 
_backButton = _display ctrlCreate ["RscExileXM8ButtonMenu", AIS_Dialog_Reinforcements_ConfirmButton, _slide];
_backButton ctrlSetPosition [_staticButtonX, _footerY, _bttonW, _bttonH];
_backButton ctrlSetText "Confirm";
_backButton ctrlSetEventHandler ["ButtonClick", "[] spawn AIS_Apps_Reinforcements_ConfirmMission;"];
_backButton ctrlSetTooltip "Confirm.";
_backButton ctrlCommit 0; 
_backButton ctrlEnable true;
 
 