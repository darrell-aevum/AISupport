 _canSupport = ["airSupport"] call AIS_CanSupportPlayer;
 if(!_canSupport)
 	exitWith{  
		_supportLevel = [AIS_AirSupport_SupportLevels] call AIS_GetPlayerSupportLevel;
		hint format["%1",_supportLevel];
		if(count _supportLevel <= 0) then {
			_minRespect = (AIS_AirSupport_SupportLevels select 0) select 1;		
			["errorToaster", "AIS - Air Support", Format ["You do not have enoug respect to call for air support. You need a minimum of %1 respect", _minRespect]] call AIS_fnc_SendMessage;
		} else {
			_level = _supportLevel select 0; 
			_minTabs = _supportLevel select 2;

			["errorToaster", "AIS - Air Support", Format ["You are at level %1 support. To call level %1 support, you need %2 poptabs.", _level, _minTabs]] call AIS_fnc_SendMessage;
		};
	};

 call AIS_Message_AirSupport_Request;

 _availableTeams = (count AIS_InactiveAirSupportUnits > 0);

 if(!_availableTeams)
	exitWith{  
		call AIS_Message_AirSupport_NoAvailableTeams;
	};

_inactiveTeam =  AIS_InactiveAirSupportUnits select floor random count AIS_InactiveAirSupportUnits;
 AIS_InactiveAirSupportUnits = AIS_InactiveAirSupportUnits - [_inactiveTeam]; 

 AIS_ActiveAirSupportUnits pushBack _inactiveTeam;

 publicVariable "AIS_InactiveAirSupportUnits";
 publicVariable "AIS_ActiveAirSupportUnits";

 
  
_callSign = _inactiveTeam getVariable ["callSign", _inactiveTeam];

sleep 8;
 
_callSign call AIS_Message_AirSupport_InRoute;

[_inactiveTeam, getPosASL player] spawn AIS_fnc_SendAirSupport;  
