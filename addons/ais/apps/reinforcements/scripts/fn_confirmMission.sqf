AIS_Apps_Reinforcements_ConfirmMission = { 
  disableSerialization;    
  private [
    "_vehicleClass",
    "_spawnPosition",
    "_dirAndUp",
    "_altitude",
    "_special",
    "_allowDamange"
  ];
  
  _playerLocker = player getVariable ["ExileLocker", 0];
  _playerMoney = player getVariable ["ExileMoney", 0];      
  _playerTabs = _playerLocker + _playerMoney;		    
  _playerRespect = ExileClientPlayerScore; 
    
  _totalCost = 0;
  _requiredRespect = 0; 
  _respectEarned = 0;
  _altitude = 0;
  _special = "NONE";
  _allowDamange = true;
  _spawnPosition =  nil; 
  _dirAndUp = nil; 
  _spawnPositionCost = 0;
  _spawnPositionRespect = 0;

  _display = uiNameSpace getVariable ["RscExileXM8", displayNull];   
 
  _insertionType = AIS_Reinforcements_InsertionTypes select AIS_Dialog_Reinforcements_SelectedInsertionType;
  _insertionVic = (_insertionType select 3) select AIS_Dialog_Reinforcements_SelectedInsertionVehicle;
  //AIS_Dialog_Reinforcements_SelectedInsertionVehicle
 
  _vehicleClass = if (count _insertionVic > 0) then [{ _insertionVic select 0 }, {"B_T_VTOL_01_infantry_F"}];
  


 
  _spawnPositions = if (!isNil { _insertionVic select 6 }) then [{ _insertionVic select 6}, {[]}];   
  _spawnPositionObj = _spawnPositions select 3;

  //[(0) Name, (1) Position, (2) Dir and Up, (3) Cost, (4) Respect, (4) Required Items    
  _spawnPosition = if (count _spawnPositionObj > 1) then [{ _spawnPositionObj select 1 }, {[]}];   
  _dirAndUp = if (count _spawnPositionObj > 2) then [{ _spawnPositionObj select 2 }, {[]}];   
  _spawnPositionCost = if (count _spawnPositionObj > 3) then [{ _spawnPositionObj select 3 }, {0}];
  _spawnPositionRespect = if (count _spawnPositionObj > 4) then [{ _spawnPositionObj select 4 }, {0}];

  _altitude = 0;
  _special = "NONE";
  _allowDamange = true; 

  _selectedUnitsListBox = _display displayCtrl AIS_Dialog_Reinforcements_SelectedUnitsListBox;  
  _spawnProperties = [_vehicleClass,_spawnPosition,nil,_altitude,_special,_allowDamange];
  
 
 
  _unitTypes = [];
 
  for "_i" from 0 to (lbSize _selectedUnitsListBox -1) do {
    _data = _selectedUnitsListBox lbData _i;
    switch(_data) do {
      default {                     
        _unitTypes pushBack _data;
      };
      case "Team":{
        _team = AIS_Reinforcements_Teams select 0;
        _teamMembers = _team select 6;

        {
          _unitTypes pushBack _x;
        } forEach _teamMembers; 
      };
      case "Squad": {
        _squad = AIS_Reinforcements_Squads select 0;
        _squadMembers = _squad select 6;

        {
          _unitTypes pushBack _x;
        } forEach _squadMembers;   
      };      
    };             
  };        
 
  _crewSeats = [_vehicleClass, false] call BIS_fnc_crewCount; 
  _totalSeats = [_vehicleClass, true] call BIS_fnc_crewCount; // Number of total seats: crew + non-FFV cargo/passengers + FFV cargo/passengers
  _availableCargoSeats = _totalSeats - _crewSeats;

  _insertionVicsNeeded = ceil (count _unitTypes / _availableCargoSeats);
 
	for "_i" from 0 to _insertionVicsNeeded - 1   do { 
    _vicCargo = [];
    for "_n" from 0 to _availableCargoSeats - 1  do {
      if(count _unitTypes > 0) then {
        _vicCargo pushBack (_unitTypes select 0);
        _unitTypes deleteAt 0; 
      }
    };
    sleep 2;
      [_spawnProperties, _spawnPosition, _vicCargo, _availableCargoSeats] spawn {
        params["_spawnProperties", "_spawnPosition", "_vicCargo", "_availableCargoSeats"];
        _groundVic = _spawnProperties call AIS_Client_fnc_CreateGroundVehicle;
        _vic = _groundVic select 0;

        waitUntil {_vic getVariable ["spawned", false]};

        //  _airVic = _spawnProperties call AIS_Client_fnc_CreateAirVehicle;

        _reinforcements = [[0,0,0], AIS_Side, _vicCargo] call BIS_fnc_spawnGroup;   
        
        (group _vic) setBehaviour "SAFE";
        (group _vic) setCombatMode "BLUE";

        _cargoSeatIndex = 0; 
        {
          _x moveInCargo [_vic, _cargoSeatIndex];
          _cargoSeatIndex = _cargoSeatIndex + 1;
          sleep .5;
        } forEach units _reinforcements;
 
     
        // Spawn invis helipad to land on.
        //   _helipad = createVehicle ["Land_HeliPadEmpty_F", getPos player, [], 0, "NONE"];  
        //  _vic flyInHeight 50;

        // Waypoint to the location    
        _wp1 = group _vic addWaypoint [getPos player, 0];  
        _wp1 setWaypointSpeed "FULL";  
        _wp1 setWaypointType "UNLOAD";
        _wp1 setWaypointStatements ["true", "(vehicle this) LAND 'GET OUT'; (vehicle this) setVariable ['unloading' ,true]"]; 

        waitUntil { _vic getVariable["unloading", false] };

   


        _reinforcements leaveVehicle _vic;
        //sleep 5;

        // Wait till we're out.
        waitUntil{sleep 1; {_x in _vic} count units _reinforcements == 0};
        {  
          [_x] joinSilent group player;
        } forEach units _reinforcements;
        sleep 5;
        // Release heli from being landed and clean up.
        //_vic flyInHeight 50;
        //deleteVehicle _helipad;

        // Waypoint back to base and delete.
        _wp2 = group _vic addWaypoint [_spawnPosition, 0];  
        _wp2 setWaypointSpeed "FULL";  
        _wp2 setWaypointType "MOVE";
        _wp2 setWaypointStatements ["true", "{deleteVehicle _x} forEach crew (vehicle this) + [vehicle this];"]; 

        }; 
      }
	};
	 

 