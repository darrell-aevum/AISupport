	private ["_marker", "_airVic"];
	params [
		["_unitName", "Unknown"],
		["_spawnProperties", []],
		["_duration", 120]
		
	];
	_callSign = "Falcon 3-1";
	 
	_airVic = _spawnProperties call AIS_Client_fnc_CreateAirVehicle;
 
	_vic = _airVic select 0;
  
 
	["successTitleAndText",    
		[
			"AI Support - CAS",  
			format["%1 CAS is in route.", _unitName]
		]
	] call ExileClient_gui_toaster_addTemplateToast; 
	
	//Add Marker
	if(true) then {
		_markerName = format["AIS_Cas_Vic_%1_%2", _unitName, random(99999)]; 
		[_vic, _markerName] spawn {
			params ["_vic","_markerName"];	 
			_marker = createMarker[_markerName, getPos _vic]; 
			While{not isnull _vic} do {	 
				deleteMarker _marker; 
				_marker = createMarker[_markerName, getPos _vic]; 
				_marker setMarkerType 'b_plane';
				_marker setMarkerSize[0.4, 0.4];
				_marker setMarkerColor 'ColorGreen';
				if(!alive _vic) then {
					_marker setMarkerColor 'ColorRed';
				};					
				_marker setMarkerText  " AIS CAS";
				sleep .2;
			};		
			deleteMarker _marker;
		};
	}; 
  
	{ [_x] join (group player); } forEach (crew _vic);

	_spawnProperties = _airVic select 1; 

[_vic, _spawnProperties] spawn {
	params["_vic", "_spawnProperties"];
	while{!isNull _vic && alive _vic && getDammage _vic < .8 && !(_vic getVariable ["missionComplete", false]) && alive player} do {				
 
	};

	if(!alive _vic || isNull _vic) exitwith {		
		["ErrorTitleAndText", ["AI Support - CAS", "A CAS unit has been destroyed."]] call ExileClient_gui_toaster_addTemplateToast;		
	};
	if(getDammage _vic >= .8) exitwith {
		_vic setDamage  1;
	};

	["infoTitleAndText",    
		[
			"AI Support - CAS",  
			format["Low fuel, returning to base."]
		]
	] call ExileClient_gui_toaster_addTemplateToast; 

	_group = createGroup AIS_Side;
	[_vic] join _group; 	 
	_vic setCombatMode "BLUE";
 
	sleep 3;
	_special = if (count _spawnProperties > 4) then [{_spawnProperties select 4 }, {"NONE"}];
	_finalDestination = if (count _spawnProperties > 1) then [{_spawnProperties select 1 }, {"NONE"}];
	[_vic, _finalDestination, _special] spawn AIS_Client_fnc_AirVicRTB;	 
};
 

_vic setFuel 1; 

//Sleep until CAS time is over
sleep _duration;	
_vic setVariable["MissionComplete", true, true];


