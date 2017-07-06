 AIS_DropdownLists_GetTraderCategories = {
	_traderCategories = [];
	{ 
		_class = _x;
		_name = getText (missionconfigfile >> "CfgTraders" >> _class >> "name");
		_categories = getArray (missionconfigfile >> "CfgTraders" >> _class >> "categories");

		if(_class in AIS_Trader_Categories) then {			
			_traderCategories = _traderCategories + [[_class, _name, _categories]];
		}
	} forEach AIS_Trader_Categories; 
	_traderCategories;
}; 

AIS_DropdownLists_GetTraderItemCattegories = {
	params ["_selectedIndex"];	
	
	_traderCategory = ([] call AIS_DropdownLists_GetTraderCategories) select _selectedIndex;
	_traderCategoryClass =  _traderCategory select 0;
	_traderItemCategories = _traderCategory select 2;

	_categoryItems = [];
	
	{
		_name = getText (missionconfigfile >> "CfgTraderCategories" >> _x >> "name");
		_icon = getText (missionconfigfile >> "CfgTraderCategories" >> _x >> "icon");
		_items = getArray (missionconfigfile >> "CfgTraderCategories" >> _x >> "items");
  
		if(_x in AIS_Trader_Item_Categories) then {  
			_categoryItems = _categoryItems + [[_x, _name, _icon, _items]];
		}		
	} forEach _traderItemCategories; 

 

	 _categoryItems;
}; 