  	
	params ["_selectedIndex"];
	disableSerialization; 
  
	lbDelete [AIS_Dialog_Resupply_CrateList, _selectedIndex];  
	lbSetCurSel [AIS_Dialog_Resupply_CrateList, (lbSize _crateList)-1];
 

    	
 	_crateList = ((findDisplay AIS_Dialog) displayCtrl (AIS_Dialog_Resupply_CrateList));		 

	_crateCost = 0;
  	_totalCost = 0;

	for "_i" from 0 to (lbSize _crateList - 1) do {
		_value = _crateList lbValue _i;
		_crateCost = _crateCost + _value;
	};	 
	_totalCost = _totalCost + _crateCost;

	_playerLocker = player getVariable ["ExileLocker", 99];
	_playerMoney = player getVariable ["ExileMoney", 9999];  
	_playerTabs = _playerLocker + _playerMoney;        
	_playerRespect = ExileClientPlayerScore;  

	_deliveryVehicleIndex = lbCurSel AIS_Dialog_Resupply_DeliveryVehicle;           
	_selectedDeliveryVic = AIS_Resupply_Delivery_Vehicles select _deliveryVehicleIndex;

	_deliveryVicCost = if (count _selectedDeliveryVic > 2) then [{_selectedDeliveryVic select 2 }, {100}];
	_deliveryVicRespect = if (count _selectedDeliveryVic > 3) then [{_selectedDeliveryVic select 3 }, {100}];
 
	_totalCost = _totalCost + _deliveryVicCost;

	_textCbo = ((findDisplay AIS_Dialog) displayCtrl (AIS_Dialog_Resupply_CrateTotal)); 
	_text = "";
	 
	ctrlShow [AIS_Dialog_BtnConfirm, true];		
	ctrlShow [AIS_Dialog_BtnCancel, true];
	ctrlShow [AIS_Dialog_BtnClose, false];		

 
	_color = "#ffffff";
	if(_playerTabs < _deliveryVicCost) then {
		ctrlShow [AIS_Dialog_BtnConfirm, false];		
		ctrlShow [AIS_Dialog_BtnCancel, false];
		ctrlShow [AIS_Dialog_BtnClose, true];		
		_color = "#FF0000";
	};
	_text = format[_text + "<t align='left'>Delivery Vehiclal Cost:</t><t color='%2' align='right'><img  size='0.65' image='addons\ais\icons\poptab_ca.paa'/> %1</t><br/>", _deliveryVicCost, _color];

	_color = "#ffffff";
	if(_playerRespect < _deliveryVicRespect) then {				
		ctrlShow [AIS_Dialog_BtnConfirm, false];		
		ctrlShow [AIS_Dialog_BtnCancel, false];
		ctrlShow [AIS_Dialog_BtnClose, true];		
		_color = "#FF0000";
	};	
	_text = format[_text + "<t align='left'>Delivery Vehicle Respect:</t><t color='%2' align='right'><img  size='0.75' image='addons\ais\icons\respect.paa'/> %1</t><br/>", _deliveryVicRespect, _color];	    

 
	_color = "#ffffff";
	if(_playerTabs < _crateCost) then {
		ctrlShow [AIS_Dialog_BtnConfirm, false];		
		ctrlShow [AIS_Dialog_BtnCancel, false];
		ctrlShow [AIS_Dialog_BtnClose, true];		
		_color = "#FF0000";
	};
	_text = format[_text + "<t align='left'>Crate Cost:</t><t color='%2' align='right'><img  size='0.65' image='addons\ais\icons\poptab_ca.paa'/> %1</t><br/>", _crateCost, _color];

	_color = "#ffffff";
	if(_playerTabs < _totalCost) then {
		ctrlShow [AIS_Dialog_BtnConfirm, false];		
		ctrlShow [AIS_Dialog_BtnCancel, false];
		ctrlShow [AIS_Dialog_BtnClose, true];		
		_color = "#FF0000";
	};
	_text = format[_text + "<t align='left'>Total Cost:</t><t color='%2' align='right'><img  size='0.65' image='addons\ais\icons\poptab_ca.paa'/> %1</t><br/>", _totalCost, _color];
 	
	_textCbo ctrlSetStructuredText  parseText  _text;
	