if !(params
[ 
	"_tgtPos",
	"_fireTeam" 	
])
exitWith
{
	diag_log format ["AI SUPPORT ERROR :: Calling AIS_fn_RequestFireMission with invalid parameters: %1",_this];
	false;
};
 
try
{  		      
	_units = _fireTeam select 1;
	_group = _fireTeam select 2;
	_magazine = _fireTeam select 3;  
	_name = _fireTeam select 4;   
	_roundCount = _fireTeam select 5; 

 	_tgtPosX = _tgtPos select 0;
	_tgtPosY = _tgtPos select 1;
	_tgtPosZ = _tgtPos select 2; 
	
	_eta = (_units select 0) getArtilleryETA [_tgtPos, currentMagazine (_units select 0)];
	[_name, _eta] call AIS_Message_FireSupport_Firing;
	 _group setCombatMode "RED"; 

 	AIS_ActiveFireTeams pushBack _fireTeam;
	{			
			_vehicle = _x;
		    _vehicle setVehicleAmmo  1;  					 
			_randTgtPos = [(_tgtPosX + (floor random [45, 0, 45]) * 1), (_tgtPosY +  + (floor random [45, 0, 45]) * 1), _tgtPosZ];			
			_vehicle doArtilleryFire [_randTgtPos, _magazine,  _roundCount];  
			
			sleep floor random [0, 2, 4];
	}
	forEach _units;  
	
	sleep floor random[10, 30, 120];
	_group setCombatMode "BLUE"; 
 

	//Send it back to inactive...
	AIS_ActiveFireTeams = AIS_ActiveFireTeams - [_fireTeam];
	AIS_InactiveFireTeams pushback _fireTeam; 

	publicVariable "AIS_InactiveFireTeams";
	publicVariable "AIS_ActiveFireTeams";

}
catch
{
	diag_log format ["AI SUPPORT  ERROR :: Calling AIS_fn_RequestFireMission with invalid parameter: %1",_exception];
};