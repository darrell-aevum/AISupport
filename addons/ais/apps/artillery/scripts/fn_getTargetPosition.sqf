AIS_Apps_Artillery_GetTargetPosition = {
    params["_guiPosition"];

    disableSerialization;    

    _display = uiNameSpace getVariable ['RscExileXM8', displayNull];
  
    _mapDisplay = findDisplay 12; 

    AIS_Dialog_Artillery_SelectedUnit = lbCurSel AIS_Dialog_Artillery_UnitListBox;    
	AIS_Dialog_Artillery_SelectedShellType = lbCurSel AIS_Dialog_Artillery_ShellTypeToFire;
    AIS_Dialog_Artillery_SelectedShellCount = lbCurSel AIS_Dialog_Artillery_ShellCountToFire;
 

    openMap true; 

    _mapControl = _mapDisplay displayCtrl AIS_Dialog_Artillery_MapControl;
    _mapControl ctrlShow true; 

	closeDialog 1;
  
    _enemySides = [side player] call BIS_fnc_enemySides;
    _radius = 600;
    _nearEnemies = allUnits select {_x distance player < _radius AND side _x in _enemySides};

    _markers = []; 
 
    waituntil {visibleMap}; 
    while {visibleMap && alive player} do
    {
        mapclick = false; 
        deleteMarker 'AIS_ARTILLERY_TARGET_TEMP'; 
        if(!isNil {AIS_Dialog_Artillery_SelectedTargetPosition}) then {                       
            _marker = createMarker['AIS_ARTILLERY_TARGET_TEMP', AIS_Dialog_Artillery_SelectedTargetPosition]; 
            _marker setMarkerType 'mil_destroy';
            _marker setMarkerSize[0.8, 0.8];
            _marker setMarkerColor 'ColorRed';            
        };
        onMapSingleClick "             
            deleteMarker 'AIS_ARTILLERY_TARGET_TEMP';
            _marker = createMarker['AIS_ARTILLERY_TARGET_TEMP', _pos];
            AIS_Dialog_Artillery_SelectedTargetPosition = _pos;
            _marker setMarkerType 'mil_destroy';
            _marker setMarkerSize[0.8, 0.8];
            _marker setMarkerColor 'ColorRed';
 
            mapclick = true;
            onMapSingleClick '';
            openMap false;             
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
            _group = group _x; 
            if(!(_group in _groups)) then {
                _groups	 = _groups + [group _x];
            };			 
        } forEach _nearEnemies;


        {
            _markerName = format["AIS_Enemy_%1", _forEachIndex];
            _marker = createMarker[_markerName, getPos (leader _x)];
            _marker setMarkerType 'b_inf';
            _marker setMarkerSize[0.8, 0.8];
            _marker setMarkerColor 'ColorRed';
    
            _markers = _markers + [_marker]; 		 
        } forEach _groups;

    

        if (!visibleMap || !alive player) exitWith {
            {
                deleteMarker _x;
            } forEach _markers;
    
            onMapSingleClick "mapclick = false; false;";  
        };
        sleep 0.123;
    };

    _mapControl ctrlShow false; 
 
    

    {
        deleteMarker _x;
    } forEach _markers;

    mapclick = false;
    deleteMarker 'AIS_ARTILLERY_TARGET_TEMP';

    onMapSingleClick "mapclick = false; false";  

    [] call ExileClient_gui_xm8_show;

    [] call AIS_Apps_Artillery_UpdateTotalCost; 

    if (!alive player) exitWith {
        {
            deleteMarker _x;
        } forEach _markers;
        AIS_Dialog_Artillery_SelectedTargetPosition = nil;
    }; 
    ///wtf

};