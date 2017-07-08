
	params ["_player","_newRespect"];	 
	  
	_player setVariable ["ExileScore", _newRespect]; 
	ExileClientPlayerScore = _newRespect;
	(owner _player) publicVariableClient "ExileClientPlayerScore";

	// Update respect in database
	format["setAccountScore:%1:%2", _newRespect, getPlayerUID _player] call ExileServer_system_database_query_fireAndForget;	
	// Send updated respect value to client

	