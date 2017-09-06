 	_cargoCost = 0;
	_insertionCost = 0;
	_unitsTransporting = 0;
	_insertionVicsNeeded = 0;
  	_totalCost = 0;
	 
	_playerLocker = player getVariable ["ExileLocker", 99];
	_playerMoney = player getVariable ["ExileMoney", 9999];  
	_playerTabs = _playerLocker + _playerMoney;        
	_playerRespect = ExileClientPlayerScore;  


 	_cargoListBox = ((findDisplay AIS_Dialog) displayCtrl (AIS_Dialog_Reinforcements_CargoListBox));		 
 
	 //Do Some Math
	for "_i" from 0 to (lbSize _cargoListBox - 1) do { 
		private["_unit"];
		_unitType = _cargoListBox lbData _i;
		_unitIndex = _cargoListBox lbValue _i;		
		if(_unitType == "Soldier") then {
			_unit = AIS_Reinforcements_Insertion_Soldiers select _unitIndex; 
			_unitsTransporting = _unitsTransporting + 1;
		}
		else {
			_unit =  AIS_Reinforcements_Insertion_Squads select _unitIndex;
			_unitCount = if (count _unit > 6) then [{ count (_unit select 6) }, {0}];	
			_unitsTransporting = _unitsTransporting + _unitCount;
		};
					 			
		_cost = if (count _unit > 2) then [{_unit select 2 }, {0}];	
		_cargoCost = _cargoCost + _cost;
	};	 
 	
 

	_totalCost = _totalCost + _cargoCost;
  
	_insertionVehicleIndex = lbCurSel AIS_Dialog_Reinforcements_InsertiontVehicleListBox;           
	_selectedInsertionVic = AIS_Reinforcements_Insertion_Vehicles select _insertionVehicleIndex;

	_deliveryVicCost = if (count _selectedInsertionVic > 2) then [{_selectedInsertionVic select 2 }, {100}];
	_deliveryVicRespect = if (count _selectedInsertionVic > 3) then [{_selectedInsertionVic select 3 }, {100}];
 
 	_insertionVicClass = if (count _selectedInsertionVic > 0) then [{_selectedInsertionVic select 0 }, {100}];
 	_insertionVicCost = if (count _selectedInsertionVic > 2) then [{_selectedInsertionVic select 2 }, {100}];
	_insertionVicRespect = if (count _selectedInsertionVic > 3) then [{_selectedInsertionVic select 3 }, {100}];


	_crewSeats = [_insertionVicClass, false] call BIS_fnc_crewCount; 
	_totalSeats = [_insertionVicClass, true] call BIS_fnc_crewCount; // Number of total seats: crew + non-FFV cargo/passengers + FFV cargo/passengers
	_cargoSeats = _totalSeats - _crewSeats;
 
	_insertionVicsNeeded = ceil (_unitsTransporting / _cargoSeats);
	_insertionVicCost = (_deliveryVicCost * _insertionVicsNeeded);

	_totalCost = _totalCost + _insertionVicCost;
 
	_textCbo = ((findDisplay AIS_Dialog) displayCtrl (AIS_Dialog_Reinforcements_CargoTotalTxt)); 
	_text = "";
	 
 
	ctrlShow [AIS_Dialog_BtnConfirm, true];		
	ctrlShow [AIS_Dialog_BtnCancel, true];
	ctrlShow [AIS_Dialog_BtnClose, false];		

  
	_text = format[_text + "<t align='left'>Toatal PAX:</t><t align='right'>%1</t><br/>", _unitsTransporting];
	_text = format[_text + "<t align='left'>Insertion Vehiclal Seats:</t><t align='right'>%1</t><br/>", _cargoSeats]; 		
	_text = format[_text + "<t align='left'>Insertion Vehiclals Needed:</t><t align='right'>%1</t><br/>", _insertionVicsNeeded]; 	


	_color = "#ffffff";
	if(_playerRespect < _insertionVicRespect) then {				
		ctrlShow [AIS_Dialog_BtnConfirm, false];		
		ctrlShow [AIS_Dialog_BtnCancel, false];
		ctrlShow [AIS_Dialog_BtnClose, true];		
		_color = "#FF0000";
	};	
	_text = format[_text + "<t align='left'>Delivery Vehicle Respect:</t><t color='%2' align='right'><img  size='0.75' image='addons\ais\icons\respect.paa'/> %1</t><br/>", _insertionVicRespect, _color];	    

	_color = "#ffffff";
	if(_playerTabs < _insertionVicCost) then {
		ctrlShow [AIS_Dialog_BtnConfirm, false];		
		ctrlShow [AIS_Dialog_BtnCancel, false];
		ctrlShow [AIS_Dialog_BtnClose, true];		
		_color = "#FF0000";
	};
	_text = format[_text + "<t align='left'>Insertion Vehiclal Cost:</t><t color='%2' align='right'><img  size='0.65' image='addons\ais\icons\poptab_ca.paa'/> %1</t><br/>", _insertionVicCost, _color];

	_color = "#ffffff";
	if(_playerTabs < _cargoCost) then {
		ctrlShow [AIS_Dialog_BtnConfirm, false];		
		ctrlShow [AIS_Dialog_BtnCancel, false];
		ctrlShow [AIS_Dialog_BtnClose, true];		
		_color = "#FF0000";
	};
	_text = format[_text + "<t align='left'>Cargo Cost:</t><t color='%2' align='right'><img  size='0.65' image='addons\ais\icons\poptab_ca.paa'/> %1</t><br/>", _cargoCost, _color];

	_color = "#ffffff";
	if(_playerTabs < _totalCost) then {
		ctrlShow [AIS_Dialog_BtnConfirm, false];		
		ctrlShow [AIS_Dialog_BtnCancel, false];
		ctrlShow [AIS_Dialog_BtnClose, true];		
		_color = "#FF0000";
	};
	_text = format[_text + "<t align='left'>Total Cost:</t><t color='%2' align='right'><img  size='0.65' image='addons\ais\icons\poptab_ca.paa'/> %1</t><br/>", _totalCost, _color];
 	
	_textCbo ctrlSetStructuredText  parseText  _text;
	