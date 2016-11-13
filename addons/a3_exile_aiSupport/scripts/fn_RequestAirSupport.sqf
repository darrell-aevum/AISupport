 call AISupport_Message_AirSupport_Request;

 _canSupport = (count AISupport_InactiveAirSupportUnits > 0);
 
 if(!_canSupport)
	exitWith{  
		call AISupport_Message_AirSupport_NoAvailableTeams;
	};
	 
_inactiveTeam =  AISupport_InactiveAirSupportUnits select floor random count AISupport_InactiveAirSupportUnits;
 AISupport_InactiveAirSupportUnits = AISupport_InactiveAirSupportUnits - [_inactiveTeam]; 

 AISupport_ActiveAirSupportUnits pushBack _inactiveTeam;
  
_callSign = _inactiveTeam getVariable ["callSign", _inactiveTeam];

sleep 8;
 
_callSign call AISupport_Message_AirSupport_InRoute;

[_inactiveTeam, getPosASL player] spawn AISupport_fnc_SendAirSupport;  