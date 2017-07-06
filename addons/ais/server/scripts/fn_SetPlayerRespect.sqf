
	params ["_player","_newRespect"];	 
		
	private _playerUID = getPlayerUID _player;
	// Set client's respect 
	_player setVariable ["ExileScore",_newRespect];
 
	// Update respect in database
	format["setAccountScore:%1:%2", _newRespect, _playerUID] call ExileServer_system_database_query_fireAndForget;

	// Send updated respect value to client
	ExileClientPlayerScore = _newRespect;
	(owner _player) publicVariableClient "ExileClientPlayerScore";
	