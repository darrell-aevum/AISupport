params ["_delay"];
 
while{true} do
{  
 
	if(isServer) then {
 		waitUntil{!isNil "ExileClientLoadedIn"};
		UISleep 0.1;
		waitUntil{ExileClientLoadedIn};
		UISleep 0.1;
		waitUntil{alive player};
		UISleep 0.1;
		waitUntil{!ExileClientPlayerIsBambi};
		UISleep 0.1;
	} else {
	//	player setVariable ["ExileLocker", 5002];
	//	player setVariable ["ExileScore", 1523];	
	};
	
	_playerActions = player getVariable ["actions", []]; 

	if(!alive player) 
		exitWith{
 			{
				player removeAction _x;
			} foreach _playerActions;		
		}; 

	if(count _playerActions <= 0) then {
		{ 
			_playerAction = player addAction (_x select 0);
			_playerActions pushBack _playerAction;
		} foreach AISupport_Player_Actions; 
		player setVariable ["actions", _playerActions]; 	 	
	};

	{
		_action = _x select 0;
		_actionText = _action select 0;
		_actionFunction = _action select 1;
		  
 		_requiredItems = _x select 1;  
		 
		_playerAction = _playerActions select _forEachIndex;
		
		_text = ""; 
		_canSupport = false;
		_supportType = "";
		switch (_forEachIndex) do {
			case 0:{
				_supportType = "airSupport";				
			};
			case 1:{
				_supportType = "fireMisison";				
			};
			case 2:{ 
				_supportType = "reinforcements";				
			};
			default {  };
		};
		
		_canSupport = [_supportType] call AIS_CanSupportPlayer;
		  
		if(!_canSupport) then {
			_text = format["<t color='#aaaa00'>%1</t>", _actionText];
		}
		else {
			_text = format["<t color='#00BFFF'>%1</t>", _actionText];
		}; 

		if!(isNil "_requiredItems") then {
			_hasItems = true;
			{
				if!(_x call IsItemInInventory) then {				
					_hasItems = false;
				};

			}foreach _requiredItems; 
			if!(_hasItems) then {
				_text = format["<t color='#FF0000'>%1</t>", _actionText];
			};
		};  

		player setUserActionText [_playerAction, _text];
	} foreach AISupport_Player_Actions;  
	sleep _delay;
};