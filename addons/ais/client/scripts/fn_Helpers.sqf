GetInheritance =
{	
	private["_type"];
	private _parents = [];
	
	_type = "cfgVehicles";
	_obj = (configFile >> _type >> _this); 			

	if (isNull _obj) then {
		_type = "cfgWeapons";
		_obj = (configFile >> _type >>  _this); 
	};				 					
	if (isNull _obj) then {
		_type = "cfgMagazines";
		_obj = (configFile >> _type >>  _this); 
	};	
	if (isNull _obj) then {
		_type = "cfgAmmo";
		_obj = (configFile >> _type >>  _this); 
	};	

	if !(isNull _obj) then {
		while {!isNull _obj} do
		{
			_parents pushBack configName _obj;  
			_obj = inheritsFrom _obj;
		};
		
		reverse _parents;
	}; 

	_parents;
};

// Example:
(configFile >> "CfgVehicles" >> typeOf player) call fnc_printParents;
AddItemToCrate = {
	params["_crate", "_class"];
 		 
	_parents =	_class call GetInheritance;			 
	if("CA_Magazine" in _parents) then {
		_crate addMagazineCargoGlobal [_class, 1];
	};
	if("Rifle" in _parents) then {
		_crate addWeaponCargoGlobal [_class, 1]; 
	};
	if("Pistol" in _parents) then {
		_crate addWeaponCargoGlobal [_class, 1]; 
	};			
	if("ItemCore" in _parents) then {
		_crate addItemCargoGlobal [_class, 1];
	};
	if("Bag_Base" in _parents) then {
		_crate addBackpackCargoGlobal [_class, 1];
	};	 
};

IsItemInInventory = {
	if !(params
	[
		"_item"
	])
	exitWith
	{	
		false;
	};

	private _hasItem = false;

    _playerItems = []; 	 
    _playerItems = _playerItems + items player;
    _playerItems = _playerItems + magazines player;
    _playerItems = _playerItems + weapons player;
    _playerItems = _playerItems + assignedItems player;
   
	switch (_item) do {
		case "SmokeShell": {  
			{
				if(_x == "SmokeShell") then {
					_hasItem = true;
				}
				else {
					_inheritance = _x call GetInheritance;					
					_type = _inheritance select (count _inheritance - 2);
					if(_type == "SmokeShell") then {
						_hasItem = true;
					};
				};
			} foreach _playerItems;
		};    
		default {   
			if (_item in _playerItems) then {
				_hasItem = true;
			};			 
		};
	}; 	   
	_hasItem
};  