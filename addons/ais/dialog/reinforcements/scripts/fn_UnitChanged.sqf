	disableSerialization;
	_index =  lbCurSel AIS_Dialog_Resupply_TraderCategories;    
	_category = lbData [AIS_Dialog_Resupply_TraderCategories, _index];

 	_traderItemsCategories = ((findDisplay AIS_Dialog) displayCtrl (AIS_Dialog_Resupply_TraderItemCategories));		 
	lbCLear _traderItemsCategories;

	_categories = [_index] call AIS_DropdownLists_GetTraderItemCattegories;
 
	{ 
		_class = _x select 0;
		_name = _x select 1;
		_icon = _x select 2;

		_traderItemsCategories lbAdd(_name);		
		_traderItemsCategories lbSetData[_forEachIndex,  _class];
		_traderItemsCategories lbSetPicture[_forEachIndex,  _icon];
	} forEach (_categories);

    lbSetCurSel [AIS_Dialog_Resupply_TraderItemCategories, 0];
  
 