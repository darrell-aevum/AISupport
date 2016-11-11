params ["_delay"];
 
while{true} do
{  
 
	if(isDedicated) then {
 		waitUntil{!isNil "ExileClientLoadedIn"};
		UISleep 0.1;
		waitUntil{ExileClientLoadedIn};
		UISleep 0.1;
		waitUntil{alive player};
		UISleep 0.1;
		waitUntil{!ExileClientPlayerIsBambi};
		UISleep 0.1;
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
		
		_minCost = _x select 1;
		_minRespect = _x select 2;
 		_requiredItems = _x select 3;

		_playerTabs = 100000;// player getVariable ["ExileLocker", 0];
		_playerRespect =  100000; // player getVariable ["Score", 0]; 
 
		_playerAction = _playerActions select _forEachIndex;
		
		_text = "";

		if(_playerTabs < _minCost || _playerRespect < _minRespect) then {
			_text = format["<t color='#FFFF00'>%1</t>", _actionText];
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