 	
	ctrlShow [AIS_Dialog_Artillery, false];
	ctrlShow [AIS_Dialog_Cas, false];
	ctrlShow [AIS_Dialog_Reinforcements, false];
	ctrlShow [AIS_Dialog_UnitListBack, false];
	ctrlShow [AIS_Dialog_UnitDescriptionBack, false];
	ctrlShow [AIS_Dialog_UnitInfoBack, false]; 

	ctrlShow [AIS_Dialog_MapControlBack, true]; 
	ctrlShow [AIS_Dialog_BtnClearTarget, true]; 
	ctrlShow [AIS_Dialog_BtnCloseMap, true];	
	ctrlShow [AIS_Dialog_Map, true];	
	

_enemySides = [side player] call BIS_fnc_enemySides;
_radius = 6000;
_nearEnemies = allUnits select {_x distance player < _radius AND side _x in _enemySides};

_markers = []; 

while {dialog && alive player} do
{
	mapclick = false;
	onMapSingleClick " 
		deleteMarker 'AIS_TARGET';
		_marker = createMarker['AIS_TARGET', _pos];
		_marker setMarkerType 'mil_destroy';
		_marker setMarkerSize[0.8, 0.8];
		_marker setMarkerColor 'ColorRed';
		_marker setMarkerText ' Target';

		targetPos = _pos;
		mapclick = true;
		onMapSingleClick '';
		true;
	";


	_groups = [];

	{
		deleteMarker _x;
	} forEach _markers;

	_playerMarker = createMarker['AIS_Player', getPos player];
	_playerMarker setMarkerType 'n_uav';
	_playerMarker setMarkerSize[0.8, 0.8];
	_playerMarker setMarkerColor 'ColorBlue';
	_playerMarker setMarkerText (name player);

	_markers = _markers + [_playerMarker];
 
	{
		_group =	group _x; 
		if(!(_group in _groups)) then {
			_groups	 = _groups + [group _x];
		};			 
	} forEach _nearEnemies;


	{
		_markerName = format["AIS_Enemy_%1", _forEachIndex];
		_marker = createMarker[_markerName, getPos player];
		_marker setMarkerType 'b_inf';
		_marker setMarkerSize[0.8, 0.8];
		_marker setMarkerColor 'ColorRed';
  
		_markers = _markers + [_marker]; 		 
	} forEach _groups;

 

	if (!dialog || !alive player) exitWith {
		{
			deleteMarker _x;
		} forEach _markers;
  
		onMapSingleClick "mapclick = false; false";  
	};
	sleep 0.123;
};

waitUntil {!dialog};

if (!dialog || !alive player) exitWith {
	{
		deleteMarker _x;
	} forEach _markers;
  
	onMapSingleClick "mapclick = false; false";  
}; 