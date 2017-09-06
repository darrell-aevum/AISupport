 
private["_display"]; 

_display = uiNameSpace getVariable ["RscExileXM8", displayNull];
disableSerialization;    
_playerLocker = player getVariable ["ExileLocker", 0];
_playerMoney = player getVariable ["ExileMoney", 0];      
_playerTabs = _playerLocker + _playerMoney;		    
_playerRespect = ExileClientPlayerScore; 

_headerText = _display displayCtrl AIS_Dialog_Reinforcements_HeaderText;    
_text = "<t align='left'>%2 - [%1]</t>";
_text = format[_text + "<t align='right'><img  size='0.85' image='addons\ais\icons\respect.paa'/> %3   <img  size='0.75' image='addons\ais\icons\poptab_ca.paa'/> %4</t>",group player, profileName, _playerRespect,_playerTabs];
_headerText ctrlSetStructuredText (parseText _text);
_headerText ctrlCommit 0; 

_unitListBox = _display displayCtrl AIS_Dialog_Reinforcements_UnitListBox;
lbCLear _unitListBox;

_unitTypeComboBox = _display displayCtrl AIS_Dialog_Reinforcements_UnitTypeComboBox;
lbCLear _unitTypeComboBox;
_unitTypeComboBox lbAdd("Soldiers");   
_unitTypeComboBox lbAdd("Teams");   
_unitTypeComboBox lbAdd("Squads");

_insertionTypeComboBox = _display displayCtrl AIS_Dialog_Reinforcements_InsertionTypeComboBox;
lbCLear _insertionTypeComboBox;

{
    _insertionTypeComboBox lbAdd(_x select 0);
} forEach AIS_Reinforcements_InsertionTypes;


lbSetCurSel [AIS_Dialog_Reinforcements_UnitTypeComboBox, AIS_Dialog_Reinforcements_SelectedUnitType]; 	 
lbSetCurSel [AIS_Dialog_Reinforcements_InsertionTypeComboBox, AIS_Dialog_Reinforcements_SelectedInsertionType]; 	 


 