    params ["_player"];
 
	if(!alive _player) 
		exitWith{
 			{
				_player removeAction _x;
			} foreach _playerActions;		
		}; 

	if(count _playerActions <= 0) then {
		{ 
			_playerAction = _player addAction (_x select 0);
			_playerActions pushBack _playerAction;
		} foreach AIS_Player_Actions; 
		_player setVariable ["actions", _playerActions]; 	 	
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

		_player setUserActionText [_playerAction, _text];
	} foreach AIS_Player_Actions;  
 
 