call compileFinal (preprocessFileLineNumbers ("addons\ais\apps\reinforcements\scripts\fn_confirmMission.sqf"));
call compileFinal (preprocessFileLineNumbers ("addons\ais\apps\reinforcements\scripts\fn_addUnitToCargo.sqf"));
call compileFinal (preprocessFileLineNumbers ("addons\ais\apps\reinforcements\scripts\fn_insertionTypeChanged.sqf"));
call compileFinal (preprocessFileLineNumbers ("addons\ais\apps\reinforcements\scripts\fn_removeUnitFromCargo.sqf"));
call compileFinal (preprocessFileLineNumbers ("addons\ais\apps\reinforcements\scripts\fn_unitSelectionChanged.sqf"));
call compileFinal (preprocessFileLineNumbers ("addons\ais\apps\reinforcements\scripts\fn_unitTypeChanged.sqf"));
call compileFinal (preprocessFileLineNumbers ("addons\ais\apps\reinforcements\scripts\fn_updateTotalCost.sqf"));

AIS_Reinforcements_GROUP = createGroup AIS_Side;

//Dialog Controls
AIS_Dialog_Reinforcements_Slide = 90000;
AIS_Dialog_Reinforcements_HeaderText = 90001;
AIS_Dialog_Reinforcements_UnitListBox = 90002;
AIS_Dialog_Reinforcements_UnitDescriptionText = 90003;
AIS_Dialog_Reinforcements_UnitInfoText = 90004;
AIS_Dialog_Reinforcements_UnitTypeComboBox = 90005;
AIS_Dialog_Reinforcements_InsertionTypeComboBox  = 90006;
AIS_Dialog_Reinforcements_InsertionVehicleComboBox = 90007;
AIS_Dialog_Reinforcements_ConfirmButton = 90008;
AIS_Dialog_Reinforcements_OverallDescriptionText = 90009;
AIS_Dialog_Reinforcements_MapControl = 90010;
AIS_Dialog_Reinforcements_SpawnListBox = 90011;
AIS_Dialog_Reinforcements_MapCloseButton = 90012;
AIS_Dialog_Reinforcements_SelectedUnitsListBox = 90013;


AIS_Dialog_Reinforcements_SelectedUnitType = 0;
AIS_Dialog_Reinforcements_SelectedUnit = 0;
AIS_Dialog_Reinforcements_SelectedUnits = [];
AIS_Dialog_Reinforcements_SelectedDuration = 0;
AIS_Dialog_Reinforcements_SelectedSpawnPoint = 0;
AIS_Dialog_Reinforcements_SelectedInsertionType = 0;
AIS_Dialog_Reinforcements_SelectedInsertionVehicle = 0;

//////////////////////////////////////////////////////////////////////////////////////////
//    Reinforcements Settings                                                                      //
//////////////////////////////////////////////////////////////////////////////////////////
AIS_Reinforcements_TrackAircraftOnMap = true;  //Adds a marker to them for the crate's location
AIS_Reinforcements_IncludePrimaryMapSpawnPoints = false;  //Gets spawn points for map's primary airport...
AIS_Reinforcements_IncludeSecondaryMapSpawnPoints = false; //Planes will not use secondary airports properly, so the planes do not use this...
AIS_Reinforcements_PatrolUnit_Cost = 6500;
AIS_Reinforcements_PatrolUnit_Respect = 17500;



//Loaded from mapConfig
AIS_Reinforcements_Plane_SpawnPoints = [];

//Loaded from mapConfig
//Available Spawn Points [Make sure that the aircract can actually take off and land from these positions!!]
//[(0) Name, (1) Position, (2) Dir and Up, (3) Cost, (4) Respect, (4) Required Items
AIS_Reinforcements_Heli_SpawnPoints  = [];

//Loaded from mapConfig
// Available aircraft for Reinforcements
//[(0) Class Name, (1) Description, (2) Cost, (3) Respect, (4) Required Items, (5) RespectEarned/Lost, (6) Spawn Positions [see format from AIS_Reinforcements_Heli_SpawnPoints], (7) Duration [minutes, cost]]	
AIS_Reinforcements_Units = [];
 
call compile preprocessFileLineNumbers (format ["addons\ais\apps\Reinforcements\mapConfigs\%1.sqf", toLower worldName]);
 







