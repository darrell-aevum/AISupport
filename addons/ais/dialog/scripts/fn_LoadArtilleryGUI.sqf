	//List Box
	_cbo = ((findDisplay AIS_Dialog) displayCtrl (AIS_Dialog_Artillery_UnitList));
	lbCLear _cbo;
  
	AIS_SelectedSupportType = "artillery";

	ctrlShow [AIS_Dialog_Cas, false];
	ctrlShow [AIS_Dialog_Reinforcements, false];	
	ctrlShow [AIS_Dialog_Map, false];
	ctrlShow [AIS_Dialog_MapControlBack, false]; 
	ctrlShow [AIS_Dialog_BtnClearTarget, false]; 
	ctrlShow [AIS_Dialog_BtnCloseMap, false]; 

	ctrlShow [AIS_Dialog_UnitListBack, true];
	ctrlShow [AIS_Dialog_UnitDescriptionBack, true];
	ctrlShow [AIS_Dialog_UnitInfoBack, true]; 
	ctrlShow [AIS_Dialog_Artillery, true];



    lbClear AIS_Dialog_Artillery_RoundNumberToFire;
    lbAdd [AIS_Dialog_Artillery_RoundNumberToFire, "1"];
    lbAdd [AIS_Dialog_Artillery_RoundNumberToFire, "2"];
    lbAdd [AIS_Dialog_Artillery_RoundNumberToFire, "3"];
    lbAdd [AIS_Dialog_Artillery_RoundNumberToFire, "4"];
    lbSetValue [AIS_Dialog_Artillery_RoundNumberToFire, 0, 1];
    lbSetValue [AIS_Dialog_Artillery_RoundNumberToFire, 1, 2];
    lbSetValue [AIS_Dialog_Artillery_RoundNumberToFire, 2, 3];
    lbSetValue [AIS_Dialog_Artillery_RoundNumberToFire, 3, 4];

	
	_units = AIS_Artillery_Units;
  
	{  
		if (typename _x != "STRING") then {
			_index = _cbo lbAdd(_x select 0);
			_cbo lbSetData[_forEachIndex,  _x select 0];	
			_cbo lbSetPicture[_forEachIndex, _x select 1];
		} else {
			_veh = (configFile >> "cfgVehicles" >> _x);
			
			if (isClass _veh) then
			{	
				if (getnumber (_veh >> "scope") == 2) then
				{	
					_class = configName _veh;
 
					_index = _cbo lbAdd(getText(configFile >> "cfgVehicles" >> _class>> "displayName"));
					_cbo lbSetData[(lbSize _cbo)-1,  _class];
					_picture = (getText(configFile >> "cfgVehicles" >> _class >> "picture"));
					_cbo lbSetPicture[(lbSize _cbo)-1,_picture]; 
				};
			};			 
		};
	} forEach _units; 