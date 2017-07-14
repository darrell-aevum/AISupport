
	params ["_player","_newPlayerMoney"];	  
	_player setVariable ["ExileMoney", _newPlayerMoney, true];
	format["setPlayerMoney:%1:%2", _newPlayerMoney, _player getVariable ["ExileDatabaseID", 0]] call ExileServer_system_database_query_fireAndForget;	
