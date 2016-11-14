 _canSupport = ["airSupport"] call AIS_CanSupportPlayer;
 if(!_canSupport)
 	exitWith{  
		_supportLevel = [AIS_AirSupport_SupportLevels] call AIS_GetPlayerSupportLevel;
		hint format["%1",_supportLevel];
		if(count _supportLevel <= 0) then {
			_minRespect = (AIS_AirSupport_SupportLevels select 0) select 1;		
			["errorToaster", "AIS - Air Support", Format ["You do not have enoug respect to call for air support. You need a minimum of %1 respect", _minRespect]] call AISupport_fnc_SendMessage;
		} else {
			_level = _supportLevel select 0; 
			_minTabs = _supportLevel select 2;

			["errorToaster", "AIS - Air Support", Format ["You are at level %1 support. To call level %1 support, you need %2 poptabs.", _level, _minTabs]] call AISupport_fnc_SendMessage;
		};
	};

 call AISupport_Message_AirSupport_Request;

 _availableTeams = (count AISupport_InactiveAirSupportUnits > 0);

 if(!_availableTeams)
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