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
		
	}foreach AIS_InactiveFireTeams; 
	_closestFireTeam
};
 
AIS_CanSupportPlayer = {	
	params ["_supportType"];
	private _canSupport = false;
		 
	_supportLevel = [];
	_cost = 999999;

	_playerTabs = player getVariable ["ExileLocker", 0];
	_playerRespect = player getVariable ["ExileScore", 0];
	 
	switch (_supportType) do {
		case "airSupport":{
			_supportLevel = [AIS_AirSupport_SupportLevels] call AIS_GetPlayerSupportLevel;					
		};
		case "fireMisison":{
			_supportLevel = [AIS_FireMission_SupportLevels] call AIS_GetPlayerSupportLevel;					
		};
		case "reinforcements":{ 
			_supportLevel = [AIS_Reinforcements_SupportLevels] call AIS_GetPlayerSupportLevel;				
		};
		default {  };
	}; 
	
	if(count _supportLevel > 0) then {
		_cost = _supportLevel select 2;
		if(_cost <= _playerTabs) then {
			_canSupport = true;
		};
	}; 
	//Until I figure out how to get player respect....
	_cansupport = true;
	_canSupport
};

AIS_GetPlayerSupportLevel = {	
	params ["_supportLevels"];
	private _supportLevel = [];
	
	_playerTabs = player getVariable ["ExileLocker", 0];							
	_playerRespect = player getVariable ["ExileScore", 0];  
	{	 
		_respect = _x select 1;
		if(_playerRespect > _respect) then {
			_supportLevel = _x;
		};									 
	} foreach _supportLevels;  
	_supportLevel
};