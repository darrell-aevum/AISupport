IsItemInInventory = {
	if !(params
	[
		"_item"
	])
	exitWith
	{	
		false;
	};

	private _hasItem = true;
	 
	_items = items player;
	_magazines = magazines player;	 
	switch (_item) do {
		case "SmokeShell": { 		   	 
			_hasItem = false;
			_smokeShells = ["SmokeShell","SmokeShellRed","SmokeShellGreen","SmokeShellYellow","SmokeShellPurple","SmokeShellBlue","SmokeShellOrange"];
			{					
				if (_x in _smokeShells) then {
					_hasItem = true;
				};								
			} foreach _magazines; 
		};    
		default {   
			if !(_item in _items || _item in _magazines) then {
				_hasItem = false;
			};			 
		};
	}; 	  
	_hasItem
};