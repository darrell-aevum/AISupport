 	
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
 
 
  if (!dialog || !alive player) exitWith {
	  onMapSingleClick "mapclick = false; false";  
	};
  sleep 0.123;
};