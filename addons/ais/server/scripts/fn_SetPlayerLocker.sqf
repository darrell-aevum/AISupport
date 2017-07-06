	params ["_player","_newLockerAmount"];
	_player setVariable ["ExileLocker", _newLockerAmount, true];
	format["updateLocker:%1:%2", _newLockerAmount, getPlayerUID _player] call ExileServer_system_database_query_fireAndForget;
