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

GetClosestAvailableFireTeam = {
	params ["_position"];
		
	private _closestFireTeam = nil;
	_closestDistance = 99999;
	{
	    _unit = (_x select 1) select 0;
		_distance = _unit distance2D _position;  
		if(_distance < _closestDistance) then {
			_closestFireTeam = _x;
			_closestDistance = _distance;
		};
		
	}foreach AISupport_InactiveFireTeams; 
	_closestFireTeam
}