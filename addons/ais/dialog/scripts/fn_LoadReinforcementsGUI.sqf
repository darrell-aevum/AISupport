	//List Box
	_cbo = ((findDisplay AIS_Dialog) displayCtrl (AIS_Dialog_Reinforcements));
	lbCLear _cbo;
  		
	ctrlShow [AIS_Dialog_Artillery, false];
	ctrlShow [AIS_Dialog_Cas, false];
	ctrlShow [AIS_Dialog_Map, false ];	
	ctrlShow [AIS_Dialog_MapControlBack, false]; 
	ctrlShow [AIS_Dialog_BtnClearTarget, false]; 
	ctrlShow [AIS_Dialog_BtnCloseMap, false]; 

	ctrlShow [AIS_Dialog_UnitListBack, true];
	ctrlShow [AIS_Dialog_UnitDescriptionBack, true];
	ctrlShow [AIS_Dialog_UnitInfoBack, true]; 
	ctrlShow [AIS_Dialog_Reinforcements, true];	