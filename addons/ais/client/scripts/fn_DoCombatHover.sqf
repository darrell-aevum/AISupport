params["_vic", "_destinationAsl", ["_height", 25]];
	_heliGroup = group driver _vic;

	_heliGroupOriginalBehaviour = behaviour leader _heliGroup;
	_heliGroupOriginalCombatMode = combatMode leader _heliGroup;
	_heliGroupOriginalFormation = formation _heliGroup;

	if(count _destinationAsl == 0) then {
		_destinationAsl = AGLtoASL [(getPos _vic) select 0, (getPos _vic) select 1, 0];
	};
	_destinationAsl = _destinationAsl vectorAdd [0, 0, _height];
	
	_gameLogicLeader = _heliGroup createUnit ["LOGIC", ASLToAGL _destinationAsl, [], 0, ""];
	_heliGroup selectLeader _gameLogicLeader;

	_heliGroup setBehaviour "Careless";
	_heliGroup setCombatMode "Blue";
	_heliGroup setFormation "File";
	
	// Wait for heli to slow down
	[_vic, _destinationAsl,_gameLogicLeader] spawn {
		params ["_vic","_destinationAsl","_gameLogicLeader"];
		
		while { alive driver _vic} do {
 			hint format["distance:%1, y velocity: %2",_vic distance2d _gameLogicLeader, velocity _vic select 2];		
			sleep 0.05;
		};
	};
	waitUntil {_vic distance2d _gameLogicLeader < 600  };
	
	// Force heli to specific position
	[_vic, _destinationAsl] spawn {
		params ["_vic","_destinationAsl"];
		_previousVelocity = velocity _vic;
		while { !(_vic getVariable ["AIS_Combat_Hovering",false]) && alive driver _vic} do {
			_distanceToPosition = ((getPosASL _vic) distance _destinationAsl);
			if( _distanceToPosition <= 250 ) then {
				if( _distanceToPosition <= 150 ) then {
					_velocityMagatude = 5;
					_velocityMagatude = (_distanceToPosition / 10) * _velocityMagatude;
					
					_currentVelocity = velocity _vic;
					_currentVelocity = _currentVelocity vectorAdd (( (getPosASL _vic) vectorFromTo _destinationAsl ) vectorMultiply _velocityMagatude);
					_currentVelocity = (vectorNormalized _currentVelocity) vectorMultiply ( (vectorMagnitude _currentVelocity) min _velocityMagatude );
					_vic setVelocity _currentVelocity;						
				}
		 
			} else {			 
				_vic setVelocity [_previousVelocity select 0,_previousVelocity select 1, -4];
			};
			if( (vectorMagnitude velocity _vic) <= 0.5) then {
				sleep 2;
				_vic setVariable ["AIS_Combat_Hovering", true];
			};
			sleep 0.05;
		};
	};
 
	waitUntil {_vic getVariable ["AIS_Combat_Hovering",false]};
	deleteVehicle _gameLogicLeader;
	
	_heliGroup setBehaviour _heliGroupOriginalBehaviour;
	_heliGroup setCombatMode _heliGroupOriginalCombatMode;
	_heliGroup setFormation _heliGroupOriginalFormation;


