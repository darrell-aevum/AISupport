	private ["_class", "_description", "_cost", "_respect", "_requiredGear"];

	ctrlShow [AIS_Dialog_BtnConfirm, true];
	ctrlShow [AIS_Dialog_BtnCancel, true];
	ctrlShow [AIS_Dialog_BtnClose, false];

 
	disableSerialization;
	_index =  lbCurSel AIS_Dialog_Cas_UnitList;    
	_class = lbData [AIS_Dialog_Cas_UnitList, _index];

    _item = AIS_Cas_Units select _index;
 
	_description = if (count _item > 1) then [{ _item select 1 }, {""}];
	_cost = if (count _item > 2) then [{ _item select 2 }, {0}];
	_respect = if (count _item > 3) then [{ _item select 3 }, {0}];
	_requiredGear = if (count _item > 4) then [{_item select 4 }, {[]}]; 
	  
	_playerTabs = player getVariable ["ExileLocker", 999999];
	_playerRespect = player getVariable ["ExileScore", 999999];
  
	_textCbo = ((findDisplay AIS_Dialog) displayCtrl (AIS_Dialog_Cas_UnitDescription)); 
	
	_color = "#ffffff";
	if(_playerTabs < _cost) then {
		ctrlShow [AIS_Dialog_BtnConfirm, false];		
		ctrlShow [AIS_Dialog_BtnCancel, false];
		ctrlShow [AIS_Dialog_BtnClose, true];		
		_color = "#FF0000";
	};
	_text = format["<t align='left'>Cost:</t><t color='%2' align='right'><img  size='0.65' image='addons\ais\icons\poptab_ca.paa'/> %1</t><br/>", _cost, _color];

	_color = "#ffffff";
	if(_playerRespect < _respect) then {				
		ctrlShow [AIS_Dialog_BtnConfirm, false];		
		ctrlShow [AIS_Dialog_BtnCancel, false];
		ctrlShow [AIS_Dialog_BtnClose, true];		
		_color = "#FF0000";
	};	
	_text = format[_text + "<t align='left'>Respect:</t><t color='%2' align='right'><img  size='0.75' image='addons\ais\icons\respect.paa'/> %1</t><br/>", _respect, _color];	    


	_text = format[_text + "<t align='left'>Required Gear:</t>"];
	if(count _requiredGear <= 0) then 
	{
		_text = format[_text + "<t align='right'>None</t><br/>"];			
	}
	else
	{ 
		_text = format[_text + "<t align='right'>"];			
		{ 
			private["_type"];

			_type = "cfgVehicles";
			_obj = (configFile >> _type >> _x); 			

			if (isNull _obj) then {
				_type = "cfgWeapons";
				_obj = (configFile >> _type >> _x); 
			};				 					
			if (isNull _obj) then {
				_type = "cfgMagazines";
				_obj = (configFile >> _type >> _x); 
			};	
			if (isNull _obj) then {
				_type = "cfgAmmo";
				_obj = (configFile >> _type >> _x); 
			};	
			if (isNull _obj) then {
				_type = nil;				
			};	

			
			_name = (getText(configFile >> _type >> _x >> "displayName"));
			_picture = (getText(configFile >> _type >> _x >> "picture"));
			if (_picture == "") then {
				_picture = (getText(configFile >> _type >> _x >> "icon"));
			};				 					
			if (_picture == "") then {
				_picture = (getText(configFile >> _type >> _x >> "editorPreview"));
			};	

			_color = "#ffffff";
			if!(_x call IsItemInInventory) then {	
				ctrlShow [AIS_Dialog_BtnConfirm, false];		
				ctrlShow [AIS_Dialog_BtnCancel, false];
				ctrlShow [AIS_Dialog_BtnClose, true];		
				_color = "#FF0000";
			};

			_text = format[_text + "<t color='%3'><img  size='0.75' image='%2'/> %1</t><br/>", _name, _picture, _color];			

			
		} forEach _requiredGear;		
		_text = format[_text + "</t><br/>"];					
	};

 	if(_description != "") then {
		_text = format[_text + "<t align='left'>Description:</t><br/>%1", _description];	
	};
 	
	_textCbo ctrlSetStructuredText  parseText  _text;


    
    lbSetCurSel [AIS_Dialog_Artillery_RoundTypeToFire, 0];