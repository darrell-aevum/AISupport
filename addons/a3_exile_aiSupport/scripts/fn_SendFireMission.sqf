if !(params
[ 
	"_tgtPos",
	"_fireTeam",
	"_roundCount"
])
exitWith
{
	diag_log format ["AI SUPPORT ERROR :: Calling AISupport_fn_RequestFireMission with invalid parameters: %1",_this];
	false;
};
 
try
{  		     
	format ["[%1] Firebase Alpah, the target's coordinates are [%2]", (group player),  _tgtPos] remoteExecCall ["systemChat"];
	 
	_units = _fireTeam select 1;
	_group = _fireTeam select 2;
	_name = _fireTeam select 4;  
 

	_isInRange = _tgtPos inRangeOfArtillery [[_group], "8Rnd_82mm_Mo_shells"];
	if((count AISupport_InactiveFireTeams > 1) && !_isInRange) then {
		_count = 0;
		while{!_isInRange || _count < 3} do {
 
			_fireTeam =  AISupport_InactiveFireTeams select floor random count AISupport_InactiveFireTeams;
			while{_fireTeam select 4 == _name} do {
				_fireTeam =  AISupport_InactiveFireTeams select floor random count AISupport_InactiveFireTeams;
			};

			_units = _fireTeam select 1;
			_group = _fireTeam select 2;
			_name = _fireTeam select 4;  
 
			_isInRange = _tgtPos inRangeOfArtillery [[_group], "8Rnd_82mm_Mo_shells"];
			_count = _count + 1;
		};
	};

	if(!_isInRange)
		exitWith { 
			sleep 3;
			Format["[Firebase Alpha] %1...", group player] remoteExecCall ["systemChat"];
			sleep 1;
			format ["[Firebase Alpha] Your target is out of range of all available firebases. Out."] remoteExecCall ["systemChat"];
			["ErrorTitleAndText", ["AI Support - Fire Mission", "You target is out of range of all firebases."]] call ExileClient_gui_toaster_addTemplateToast;
		};

	_tgtPosX = _tgtPos select 0;
	_tgtPosY = _tgtPos select 1;
	_tgtPosZ = _tgtPos select 2; 

	_unit = (units _group) select 0;
	_groupPosX = (position _unit) select 0;
	_groupPosY = (position _unit) select 1;
	_groupPosZ = (position _unit) select 2; 

	if((abs (_tgtPosX - _groupPosX) <= 250) && (abs (_tgtPosY - _groupPosY) <= 250))
	exitWith{
		format ["[%1] Firebase Alpha, this is %1. Thats a big Negative. Over.", _name] remoteExecCall ["systemChat"];
		sleep 2;
		Format["[Firebase Alpha] %1... Comeback?", _name] remoteExecCall ["systemChat"];
		sleep 2;
		format ["[%1] Firebase Alpha, thats a negative on the fire mission. %2 is trying to get us to fire on our location. Over.", _name, (group player)] remoteExecCall ["systemChat"];
		sleep 2;
		Format["[Firebase Alpha] Roger %1. We will keep an eye on %2. Out.", _name, (group player)] remoteExecCall ["systemChat"];		
	};

 
	format ["[%1] Roger Firebase Alpha, this is %1... firing on %2's target. Out.", _name, (group player)] remoteExecCall ["systemChat"];
	sleep 2;
	Format["[Firebase Alpha] %1... Rounds are inbound on your target. Out.", group player] remoteExecCall ["systemChat"];
 	AISupport_ActiveFireTeams pushBack _fireTeam;
	while{_roundCount > 0} do {
		{
			_object = _x;
		 
			_randTgtPos = [(_tgtPosX + (floor random [45, 0, 45]) * 1), (_tgtPosY +  + (floor random [45, 0, 45]) * 1), _tgtPosZ];

			_object addMagazineTurret ["8Rnd_82mm_Mo_shells",[0]];
			_object doArtilleryFire [_randTgtPos, "8Rnd_82mm_Mo_shells", 1];  
			sleep floor random [1, 2, 4];			
		}
		forEach units _group; 
	 	_roundCount = _roundCount - 1;
	};
	sleep 55;
	//Send it back to inactive...
	AISupport_ActiveFireTeams = AISupport_ActiveFireTeams - [_fireTeam];
	AISupport_InactiveFireTeams pushback _fireTeam; 
}
catch
{
	diag_log format ["AI SUPPORT  ERROR :: Calling AISupport_fn_RequestFireMission with invalid parameter: %1",_exception];
};