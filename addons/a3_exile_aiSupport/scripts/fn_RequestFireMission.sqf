 
try
{  
 _canSupport = ["fireMission"] call AIS_CanSupportPlayer;
 if(!_canSupport)
 	exitWith{  
		_supportLevel = [AIS_FireMission_SupportLevels] call AIS_GetPlayerSupportLevel;
		hint format["%1",_supportLevel];
		if(count _supportLevel <= 0) then {
			_minRespect = (AIS_FireMission_SupportLevels select 0) select 1;		
			["errorToaster", "AIS - Fire Mission", Format ["You do not have enoug respect to call for a fire mission. You need a minimum of %1 respect", _minRespect]] call AIS_fnc_SendMessage;
		} else {
			_level = _supportLevel select 0; 
			_minTabs = _supportLevel select 2;

			["errorToaster", "AIS - Fire Mission", Format ["You are at level %1 support. To call level %1 support, you need %2 poptabs.", _level, _minTabs]] call AIS_fnc_SendMessage;
		};
	};

	call AIS_Message_FireSupport_Request;

	_availableSupport = (count AIS_InactiveFireTeams > 0);
 
	if(!_availableSupport)
	exitWith{   
		call AIS_Message_FireSupport_NoAvailableTeams;
	}; 
		 
	call AIS_Message_FireSupport_GetCoordinates;
	 
    openMap true;
	 
	onMapSingleClick {
		[_pos] spawn {
			params ["_pos"];
			openMap false; 
			sleep 1;
  			[_pos] call AIS_Message_FireSupport_SendCoordinates;
	
			 _fireTeam =  [_pos] call GetClosestAvailableFireTeam;	
			 //Remove from Inactive Fire Teams
			 AIS_InactiveFireTeams = AIS_InactiveFireTeams - [_fireTeam];		
		
		 	 publicVariable "AIS_InactiveFireTeams";
		

			_units = _fireTeam select 1;
			_group = _fireTeam select 2;
			_magazine = _fireTeam select 3;  
			_name = _fireTeam select 4;   
	 
 			_tgtPosX = _pos select 0;
			_tgtPosY = _pos select 1;
			_tgtPosZ = _pos select 2; 
	   
			_isInRange = _pos inRangeOfArtillery [[_group], _magazine];

			_isFiringOnSupportBase = false;
			{		
				_g = _x select 2;		
 				_unit = (units _g) select 0;
				_groupPosX = (position _unit) select 0;
				_groupPosY = (position _unit) select 1;
				_groupPosZ = (position _unit) select 2; 

				if((abs (_tgtPosX - _groupPosX) <= 250) && (abs (_tgtPosY - _groupPosY) <= 250)) then {
					_isFiringOnSupportBase = true;
				};
			} foreach (AIS_InactiveFireTeams + AIS_ActiveFireTeams);

			if(_isFiringOnSupportBase)
			exitWith{		
				call AIS_Message_FireSupport_FiringOnSupportBase;
 
				//Add to Inctive Fire Teams	
				AIS_InactiveFireTeams pushBack _fireTeam;
			};

			if(!_isInRange)
				exitWith { 
					sleep 3;			
					call AIS_Message_FireSupport_OutOfRange;

 					//Add to Inactive Fire Teams	
					AIS_InactiveFireTeams pushBack _fireTeam;
				};

			[_pos, _fireTeam] spawn AIS_fnc_SendFireMission; 

			//Add to Active Fire Teams	
			AIS_ActiveFireTeams pushBack _fireTeam;

			publicVariable "AIS_ActiveFireTeams";

			onMapSingleClick{};
		};
	};	
// Need to cancel the event listner if it takes to long for them to click on the map...
//	_counter = 0;
//	while {(alive player) && !(_fireTeam in AIS_ActiveFireTeams) && (_fireTeam in AIS_InactiveFireTeams) && (_counter < 3)} do {
//		sleep 15;
//		if!(_fireTeam in AIS_ActiveFireTeams) then {
//			format ["[Firebase Alpha] %1, send us the target's position, over.", (name player)] remoteExecCall ["systemChat"]; 
//		};
//		_counter = _counter + 1;
//	};
//	if(!(_fireTeam in AIS_ActiveFireTeams) && !(_fireTeam in AIS_InactiveFireTeams)) then {
//		AIS_InactiveFireTeams pushBack _fireTeam;
//		onMapSingleClick{};
//		format ["[Firebase Alpha] %1, we've aborted the fire Mission, out.", (name player)] remoteExecCall ["systemChat"]; 
//	};
}
catch
{
	diag_log format ["AI SUPPORT  ERROR :: Calling AIS_fn_RequestFireMission with invalid parameter: %1",_exception];
};