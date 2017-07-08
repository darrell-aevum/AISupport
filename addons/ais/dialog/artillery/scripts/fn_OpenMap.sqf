 	
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
_groups = [];
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



	{
		deleteMarker _x;
	} forEach _markers;

	_playerMarker = createMarker['AIS_Player', getPos player];
	_playerMarker setMarkerType 'n_uav';
	_playerMarker setMarkerSize[0.8, 0.8];
	_playerMarker setMarkerColor 'ColorBlue';
	_playerMarker setMarkerText (name player);

	_markers = _markers + [_playerMarker];

	setGroupIconsVisible [true,false]; //Show only 2D


	{
		_group =	group _x;
		_group addGroupIcon ["b_inf"]; 
		if(!(_group in _groups)) then {
			_groups	 = _groups + [group _x];
		};			 
	} forEach _nearEnemies;

	if (!dialog || !alive player) exitWith {
		{
			deleteMarker _x;
		} forEach _markers;

		{			
			clearGroupIcons _x;
		} forEach _groups;

		setGroupIconsVisible [false,false];		
		onMapSingleClick "mapclick = false; false";  
	};
	sleep 0.123;
};

waitUntil {!dialog};

if (!dialog || !alive player) exitWith {
	{
		deleteMarker _x;
	} forEach _markers;

	{			
		clearGroupIcons _x;
	} forEach _groups;

	setGroupIconsVisible [false,false];		
	onMapSingleClick "mapclick = false; false";  
}; 