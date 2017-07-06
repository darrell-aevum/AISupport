 params ["_vic", "_classNameToDrop", "_dropType", "_items"];

if (isNil  {(_this select 0)}) exitWith {};
if (isNull (_this select 0)) exitWith {};


private ["_side","_paraSize","_paraName","_paraPos","_vic","_dropPos","_dropHeight","_pos","_classNameToDrop","_cargoPos","_cargoRelPos","_crate","_para"];
_paraSize = 0; //0...small 1...medium (default) 2...big     //TODO: 0 - set other _cargoRelPos (parachute hits crate and disappears)
 
_cargoPos = getPos _vic;
sleep .1;

_crate = createvehicle [_classNameToDrop, _cargoPos,[],0,"NONE"];		
_crate setDir (direction _vic); 
_crate setVelocity [(((velocity _vic) select 0) * .9 ),(((velocity _vic) select 1) * .9 ),((velocity _vic) select 2)];

clearMagazineCargoGlobal _crate; 
clearWeaponCargoGlobal _crate; 
clearItemCargoGlobal _crate; 
ClearBackpackCargoGlobal _crate;

{ 
	[_crate, _x] call AddItemToCrate;
} forEach _items;

switch (_dropType) do {
	case "Land": {

	};
	case "Air": { 
		switch (_paraSize) do 
		{   	
			case 0: {_paraName = "NonSteerable_Parachute_F";};  	
			case 1: {_paraName = "B_Parachute_02_F";};  	  		
			default {hint format ["DROP_ ERROR: Wrong _paraSize"];};
		};

		_cratePos = position _crate;

		_para = createvehicle [_paraName, _cratePos ,[],0,"NONE"]; //not "FLY" (that spawns 150 m above ground)
		_para setDir (direction _vic);
		_para setVelocity [((velocity _crate) select 0),((velocity _crate) select 1) ,((velocity _crate) select 2)];

		_crate attachTo [_para,[0,0,0],"paraEnd"];  
	}
};

_markerName = format["AIS_Resupply_Crate_%1", random 99999]; 
if(AIS_Resupply_MarkCrateOnMap) then {
	[_crate, _markerName] spawn {
		params ["_crate","_markerName"];	 
		_marker = createMarker[_markerName, getPos _crate]; 
		While{not isnull _crate} do {	 
			deleteMarker _marker;
			_marker = createMarker[_markerName, getPos _crate]; 
			_marker setMarkerType 'hd_pickup';
			_marker setMarkerSize[0.4, 0.4];
			_marker setMarkerColor 'ColorOrange';
			_marker setMarkerText ' Supply Crate'; 
			sleep 1;
		};		
		deleteMarker _marker;
	};
};

sleep AIS_Resupply_CrateLifespan;
deleteVehicle _crate; 
