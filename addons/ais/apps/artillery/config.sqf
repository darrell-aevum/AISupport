call compileFinal (preprocessFileLineNumbers ("addons\ais\apps\artillery\scripts\fn_closeMap.sqf"));
call compileFinal (preprocessFileLineNumbers ("addons\ais\apps\artillery\scripts\fn_confirmMission.sqf"));
call compileFinal (preprocessFileLineNumbers ("addons\ais\apps\artillery\scripts\fn_getTargetPosition.sqf"));
call compileFinal (preprocessFileLineNumbers ("addons\ais\apps\artillery\scripts\fn_openMap.sqf"));
call compileFinal (preprocessFileLineNumbers ("addons\ais\apps\artillery\scripts\fn_unitSelectionChanged.sqf"));
call compileFinal (preprocessFileLineNumbers ("addons\ais\apps\artillery\scripts\fn_updateTotalCost.sqf"));

AIS_Dialog_Artillery_Slide = 70002;
AIS_Dialog_Artillery_HeaderText = 70003;
AIS_Dialog_Artillery_UnitListBox = 70004;
AIS_Dialog_Artillery_UnitDescriptionText = 70005;
AIS_Dialog_Artillery_UnitInfo = 70006;
AIS_Dialog_Artillery_ShellTypeToFire = 70007;
AIS_Dialog_Artillery_ShellCountToFire = 70008;
AIS_Dialog_Artillery_MapButton = 70009;
AIS_Dialog_Artillery_ConfirmButton = 70010;
AIS_Dialog_Artillery_OverallDescriptionText = 700011;
AIS_Dialog_Artillery_MapControl = 70012;
AIS_Dialog_Artillery_MapCloseButton = 70013; 

AIS_Dialog_Artillery_SelectedUnit = 0;
AIS_Dialog_Artillery_SelectedShellType = 0;
AIS_Dialog_Artillery_SelectedShellCount = 0;
AIS_Dialog_Artillery_SelectedTargetPosition = nil;



AIS_Artillery_Units = [
	[
		[
			"B_Mortar_01_F", 
			"Mortars Level I"
		], 
		"Less accurate mortar fire.", 
		1000, 500, ["ItemRadio"], 1, 2, 200, 3
	],		
	[
		[
			"B_Mortar_01_F", 
			"Mortars Level II"
		], 
		"Fairly accurate mortar fire.", 
		2500, 1500, ["ItemRadio"], 1, 3, 100, 5
	],		
	[
		[
			"B_Mortar_01_F", 
			"Mortars Level III"
		], 
		"Very accurate mortar fire.", 
		3500, 3500, ["ItemRadio"], 1, 4, 25, 10
	],		
	["B_MBT_01_mlrs_F", "", 2500, 1500, ["ItemRadio"], 1, 3, 75, 15],
	["B_MBT_01_arty_F", "", 3500, 3500, ["ItemRadio"], 1, 2, 75, 15] 
];			