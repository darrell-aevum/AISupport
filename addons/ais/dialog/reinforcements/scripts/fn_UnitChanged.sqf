	params["_selected"];
	private["_unit"];

	disableSerialization;

	_cost = 0;
  	_requiredRespect = 0;
	_description = "";

	_playerLocker = player getVariable ["ExileLocker", 99];
	_playerMoney = player getVariable ["ExileMoney", 9999];  
	_playerTabs = _playerLocker + _playerMoney;        
	_playerRespect = ExileClientPlayerScore;  

	_unitListBox = _selected select 0;
	_selectedUnitIndex = _selected select 1;


	_selectedUnitTypeIndex =  lbCurSel AIS_Dialog_Reinforcements_SoldierOrSquadCombo;    
	_unitType = lbData [AIS_Dialog_Reinforcements_SoldierOrSquadCombo, _selectedUnitTypeIndex];

	switch(_unitType) do {
		case "Soldier": {
			_unit = AIS_Reinforcements_Insertion_Soldiers select _selectedUnitIndex; 
			_description = if (count _unit > 1) then [{_unit select 1 }, {""}];						 			
       		_cost = if (count _unit > 2) then [{_unit select 2 }, {0}];	
			_requiredRespect = if (count _unit > 3) then [{_unit select 3 }, {0}];				   					
		};
		case "Squad": {
 			_unit = AIS_Reinforcements_Insertion_Squads select _selectedUnitIndex; 
			 _description = if (count _unit > 1) then [{_unit select 1 }, {""}];						 
			_cost = if (count _unit > 2) then [{_unit select 2 }, {0}];			
			_requiredRespect = if (count _unit > 3) then [{_unit select 3 }, {0}];			
		};
	};
   
 	_textCbo = ((findDisplay AIS_Dialog) displayCtrl (AIS_Dialog_Reinforcements_UnitDescriptionTxt)); 
	_text = "";

	_color = "#ffffff";
	if(_playerRespect < _requiredRespect) then {				
		ctrlShow [AIS_Dialog_BtnConfirm, false];		
		ctrlShow [AIS_Dialog_BtnCancel, false];
		ctrlShow [AIS_Dialog_BtnClose, true];		
		ctrlShow [AIS_Dialog_Reinforcements_AddUnitToCargoBtn, false];
		_color = "#FF0000";
	};	
	_text = format[_text + "<t align='left'>Required Respect:</t><t color='%2' align='right'><img  size='0.75' image='addons\ais\icons\respect.paa'/> %1</t><br/>", _requiredRespect, _color];	    
	_color = "#ffffff";
	if(_playerLocker + _playerMoney < _cost) then {
		ctrlShow [AIS_Dialog_BtnConfirm, false];		
		ctrlShow [AIS_Dialog_BtnCancel, false];
		ctrlShow [AIS_Dialog_BtnClose, true];		
		ctrlShow [AIS_Dialog_Reinforcements_AddUnitToCargoBtn, false];
		_color = "#FF0000";
	};
	_text = format[_text + "<t align='left'>Cost:</t><t color='%2' align='right'><img  size='0.65' image='addons\ais\icons\poptab_ca.paa'/> %1</t><br/>", _cost, _color];

 
 	if(_description != "") then {
		_text = format[_text + "<t align='left'>Description:</t><br/>%1", _description];	
	};
 	
	_textCbo ctrlSetStructuredText  parseText  _text;
  