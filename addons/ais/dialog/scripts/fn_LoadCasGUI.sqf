	//List Box
	_cbo = ((findDisplay AIS_Dialog) displayCtrl (AIS_Dialog_Cas_UnitList));
	lbCLear _cbo;
  	
	AIS_SelectedSupportType = "cas";

	ctrlShow [AIS_Dialog_Reinforcements, false];	
	ctrlShow [AIS_Dialog_Artillery, false];
	ctrlShow [AIS_Dialog_Map, false ];	
	ctrlShow [AIS_Dialog_MapControlBack, false]; 
	ctrlShow [AIS_Dialog_BtnClearTarget, false]; 
	ctrlShow [AIS_Dialog_BtnCloseMap, false]; 

	ctrlShow [AIS_Dialog_UnitListBack, true];
	ctrlShow [AIS_Dialog_UnitDescriptionBack, true];
	ctrlShow [AIS_Dialog_UnitInfoBack, true]; 
	ctrlShow [AIS_Dialog_Cas, true];
 
    lbClear AIS_Dialog_Cas_Duration;
    lbAdd [AIS_Dialog_Cas_Duration, "3 Minutes"];
    lbAdd [AIS_Dialog_Cas_Duration, "5 Minutes"];
    lbAdd [AIS_Dialog_Cas_Duration, "8 Minutes"];
    lbAdd [AIS_Dialog_Cas_Duration, "10 Minutes"];
    lbSetValue [AIS_Dialog_Cas_Duration, 0, 3];
    lbSetValue [AIS_Dialog_Cas_Duration, 1, 5];
    lbSetValue [AIS_Dialog_Cas_Duration, 2, 8];
    lbSetValue [AIS_Dialog_Cas_Duration, 3, 10];

	_units = AIS_Cas_Units; 
	
	{  
		if (typename _x != "STRING") then {
			_index = _cbo lbAdd(_x select 0);
			_cbo lbSetData[_forEachIndex,  _x select 0];	
			_cbo lbSetPicture[_forEachIndex, _x select 1];
		} else {
			_veh = (configFile >> "cfgVehicles" >> _x);		
				
			if (isClass _veh) then
			{						
				if (getnumber (_veh >> "scope") == 1) then
				{					
					_class = configName _veh; 					
				
					_index = _cbo lbAdd(getText(configFile >> "cfgVehicles" >> _class>> "displayName"));
					 
					_cbo lbSetData[(lbSize _cbo)-1,  _class];
					_picture = (getText(configFile >> "cfgVehicles" >> _class >> "picture"));
					_cbo lbSetPicture[(lbSize _cbo)-1, _picture];  
				};
			};			 
		};
	} forEach _units; 