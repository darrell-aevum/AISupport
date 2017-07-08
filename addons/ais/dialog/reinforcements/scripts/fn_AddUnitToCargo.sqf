  	
	params ["_selected"];
	private ["_playerLocker","_playerMoney","_playerTabs","_playerRespect","_data","_value","_picture","_text",
			 "_selectedUnitTypeIndex","_unitType","_unit", "_cost", "_requiredRespect", "_description"];
	
	disableSerialization;  
 
	_selectedIndex = _selected select 1;

	_playerLocker = player getVariable ["ExileLocker", 99];
	_playerMoney = player getVariable ["ExileMoney", 99999];      
	_playerTabs = _playerLocker + _playerMoney;		    
	_playerRespect = ExileClientPlayerScore; 

	_cost = 0;
	_requiredRespect = 0;
	_description = "";			
	_unit = [];

	//Selected Unit

	_value = _selectedIndex;	  
	_picture = lbPicture [AIS_Dialog_Reinforcements_UnitListBox, _selectedIndex];	  
	_text = lbText [AIS_Dialog_Reinforcements_UnitListBox, _selectedIndex];	  
 
	_selectedUnitTypeIndex =  lbCurSel AIS_Dialog_Reinforcements_SoldierOrSquadCombo;    

	_unitType = lbData [AIS_Dialog_Reinforcements_SoldierOrSquadCombo, _selectedUnitTypeIndex];
 	_data = _unitType;

	if(_unitType == "Soldier") then {		
		_unit = AIS_Reinforcements_Insertion_Soldiers select _selectedIndex;    		
	}
	else {
		_unit = AIS_Reinforcements_Insertion_Squads select _selectedIndex; 
	};
	 
	_description = if (count _unit > 1) then [{_unit select 1 }, {""}];						 			
	_cost = if (count _unit > 2) then [{_unit select 2 }, {0}];	
	_requiredRespect = if (count _unit > 3) then [{_unit select 3 }, {0}];				   					


	if(_playerRespect < _requiredRespect) exitWith{};
	if(_playerTabs < _cost) exitWith{};


	ctrlShow [AIS_Dialog_BtnConfirm, true];		
	ctrlShow [AIS_Dialog_BtnCancel, true];
	ctrlShow [AIS_Dialog_BtnClose, false];		

 	_cargoListBox = ((findDisplay AIS_Dialog) displayCtrl (AIS_Dialog_Reinforcements_CargoListBox));		 

	_cargoListBox lbAdd(_text);		 
	_cargoListBox lbSetData[(lbSize _cargoListBox)-1,  _data];
	_cargoListBox lbSetValue[(lbSize _cargoListBox)-1,  _value];
	_cargoListBox lbSetPicture[(lbSize _cargoListBox)-1,  _picture];

	lbSetCurSel [AIS_Dialog_Reinforcements_CargoListBox, (lbSize _cargoListBox)-1];
  
	[] call AIS_Dialog_Reinforcements_fnc_CargoChanged;