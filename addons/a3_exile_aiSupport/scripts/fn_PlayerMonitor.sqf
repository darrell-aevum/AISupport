params ["_delay"]; 
 	if(isMultiplayer) then {
 		waitUntil{!isNil "ExileClientLoadedIn"};
		UISleep 0.1;
		waitUntil{ExileClientLoadedIn};
		UISleep 0.1; 
		//waitUntil{!ExileClientPlayerIsBambi};
		//UISleep 0.1;
	} else {
		//	player setVariable ["ExileLocker", 5002, true];
		//	player setVariable ["ExileScore", 1523, true];
	};

	_playerActions = player getVariable ["actions", []]; 
	_teamMembers = player getVariable ["teamMembers", []];

	if(!alive player) 
		exitWith{
 			{
				player removeAction _x;
			} foreach _playerActions;
			{
				_x setdammage 1; 
				_teamMembers = _teamMembers - [_x]; 
			} foreach _teamMembers;
			player setVariable ["teamMembers", _teamMembers];					
			sleep _delay;
 			[_delay] spawn AIS_fnc_PlayerMonitor;
		}; 

	if(count _playerActions <= 0) then {
		{ 
			_playerAction = player addAction (_x select 0);
			_playerActions pushBack _playerAction;
		} foreach AIS_Player_Actions; 
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
	} foreach AIS_Player_Actions;  


	{
		if!(isPlayer _x) then {
			if!(alive _x) then {
 
				_teamMembers = _teamMembers - [_x];
				[_teamMembers, _x] spawn { 
					params["_teamMembers", "_ai"]; 
					if(count _teamMembers > 0) then {
						systemChat (format["[%1] %2, we've lost a man.", (name (_teamMembers select 0)), (name player)]);
					} else {
						["ErrorTitleAndText", ["AI Support - Reinforcements", "All of your team members have been killed."]] call ExileClient_gui_toaster_addTemplateToast;
					}; 
				};
			};
		};
	} foreach _teamMembers;

	player setVariable ["teamMembers", _teamMembers];

	sleep _delay;
 	[_delay] spawn AIS_fnc_PlayerMonitor;