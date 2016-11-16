params ["_delay"];
 
while{true} do
{ 
	{
	_base = _x;
	_objects = _x select 0;
	_staticWeapons = _x select 1;
	_vehicles = _x select 2;
	 
		{ 
			if((_x getVariable ["missionComplete", false] && _x getVariable ["isActive", false]  && !(isEngineOn _x)) || (!alive _x) ) then { 
				_origParams = _x getVariable "originalParameters"; 
				_supportType = _x getVariable "supportType";

				if(_supportType == "reinforcement") then { 
				{
						AIS_Reinforcements = AIS_Reinforcements - [_x];
				};
				if(_supportType == "attack") then { 
				{
					AIS_AirSupportUnits = AIS_AirSupportUnits - [_x];
				};
				{
					deleteVehicle _x; 
				} forEach crew _x; 
				deleteVehicle _x; 

				_vehicle = _origParams call AIS_fnc_AddVehicle;
				_vehicles pushBack _vehicle;

				if(_supportType == "reinforcement") then { 
				{
						AIS_Reinforcements pushBack _vehicle; 
				};
				if(_supportType == "attack") then { 
				{
					AIS_AirSupportUnits pushBack _vehicle; 
				}; 
			};												
		} foreach _vehicles;			
	} foreach AIS_Bases; 
	sleep _delay;
};