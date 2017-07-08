	private ["_class", "_description", "_cost", "_respect", "_requiredGear"]; 

	disableSerialization;
	ctrlShow [AIS_Dialog_BtnConfirm, true];
	ctrlShow [AIS_Dialog_BtnCancel, true];
	ctrlShow [AIS_Dialog_BtnClose, false];
	ctrlShow [AIS_Dialog_Resupply_AddItemToCrate, false];
 
 
	_index =  lbCurSel AIS_Dialog_Resupply_TraderItems;    
	_class = lbData [AIS_Dialog_Resupply_TraderItems, _index];
  
  	_currentSelection = lbCurSel AIS_Dialog_Resupply_TraderItems;
 
 	_retail = getNumber (missionconfigfile >> "CfgExileArsenal" >> _class >> "price");
	 
	_itemMarkup = round(_retail * AIS_Resupply_ItemMarkup);
	_cost = round (_itemMarkup + _retail);
	_quality = getNumber (missionconfigfile >> "CfgExileArsenal" >> _class >> "quality");
    _respect = getNumber ((missionconfigfile >> "CfgTrading" >> "requiredRespect") select _quality);
	_description = "";

	lbSetValue[AIS_Dialog_Resupply_TraderItems, _index,  _cost];

	if (_currentSelection == -1) exitWith {};
	ctrlShow [AIS_Dialog_Resupply_AddItemToCrate, true];

	_playerLocker = player getVariable ["ExileLocker", 99];
	_playerMoney = player getVariable ["ExileMoney", 9999];        
	_playerRespect = ExileClientPlayerScore;    

	_textCbo = ((findDisplay AIS_Dialog) displayCtrl (AIS_Dialog_Resupply_TraderItemDescription)); 
	_text = "";

	_color = "#ffffff";
	if(_playerRespect < _respect) then {				
		ctrlShow [AIS_Dialog_BtnConfirm, false];		
		ctrlShow [AIS_Dialog_BtnCancel, false];
		ctrlShow [AIS_Dialog_BtnClose, true];		
		ctrlShow [AIS_Dialog_Resupply_AddItemToCrate, false];
		_color = "#FF0000";
	};	
	_text = format[_text + "<t align='left'>Required Respect:</t><t color='%2' align='right'><img  size='0.75' image='addons\ais\icons\respect.paa'/> %1</t><br/><br/>", _respect, _color];	    

	_text = format[_text + "<t align='left'>Trader Price:</t><t color='#555555' align='right'><img  size='0.75' image='addons\ais\icons\poptab_ca.paa'/> %1</t><br/>", _retail];	    
	_text =  format[_text + "<t align='left'>Processing Fee:</t><t  color='#555555' align='right'><img  size='0.75' image='addons\ais\icons\poptab_ca.paa'/> %1</t><br/>", _itemMarkup];	 

	_color = "#ffffff";
	if(_playerLocker + _playerMoney < _cost) then {
		ctrlShow [AIS_Dialog_BtnConfirm, false];		
		ctrlShow [AIS_Dialog_BtnCancel, false];
		ctrlShow [AIS_Dialog_BtnClose, true];		
		ctrlShow [AIS_Dialog_Resupply_AddItemToCrate, false];
		_color = "#FF0000";
	};
	_text = format[_text + "<t align='left'>Total Cost:</t><t color='%2' align='right'><img  size='0.65' image='addons\ais\icons\poptab_ca.paa'/> %1</t><br/>", _cost, _color];




 	if(_description != "") then {
		_text = format[_text + "<t align='left'>Description:</t><br/>%1", _description];	
	};
 	
	_textCbo ctrlSetStructuredText  parseText  _text;
  
 