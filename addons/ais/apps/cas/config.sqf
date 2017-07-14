
call compileFinal (preprocessFileLineNumbers ("addons\ais\apps\cas\scripts\fn_closeMap.sqf"));
call compileFinal (preprocessFileLineNumbers ("addons\ais\apps\cas\scripts\fn_confirmMission.sqf"));
call compileFinal (preprocessFileLineNumbers ("addons\ais\apps\cas\scripts\fn_getSpawnPosition.sqf"));
call compileFinal (preprocessFileLineNumbers ("addons\ais\apps\cas\scripts\fn_openMap.sqf"));
call compileFinal (preprocessFileLineNumbers ("addons\ais\apps\cas\scripts\fn_unitSelectionChanged.sqf"));
call compileFinal (preprocessFileLineNumbers ("addons\ais\apps\cas\scripts\fn_updateTotalCost.sqf"));

AIS_CAS_GROUP = createGroup AIS_Side;

//Dialog Controls
AIS_Dialog_CAS_Slide = 80000;
AIS_Dialog_CAS_HeaderText = 80001;
AIS_Dialog_CAS_UnitListBox = 80002;
AIS_Dialog_CAS_UnitDescriptionText = 80003;
AIS_Dialog_CAS_UnitInfoText = 80004;
AIS_Dialog_CAS_DurationComboBox = 80005;
AIS_Dialog_CAS_SpawnPositionsComboBox  = 80006;
AIS_Dialog_CAS_MapButton = 80007;
AIS_Dialog_CAS_ConfirmButton = 80008;
AIS_Dialog_CAS_OverallDescriptionText = 80009;
AIS_Dialog_CAS_MapControl = 80010;
AIS_Dialog_CAS_SpawnListBox = 80011;
AIS_Dialog_CAS_MapCloseButton = 80012;

AIS_Dialog_CAS_SelectedUnit = 0;
AIS_Dialog_CAS_SelectedDuration = 0;
AIS_Dialog_CAS_SelectedSpawnPoint = 0;
//////////////////////////////////////////////////////////////////////////////////////////
//    CAS Settings                                                                      //
//////////////////////////////////////////////////////////////////////////////////////////
AIS_Cas_TrackAircraftOnMap = true;  //Adds a marker to them for the crate's location
AIS_Cas_IncludePrimaryMapSpawnPoints = false;  //Gets spawn points for map's primary airport...
AIS_Cas_IncludeSecondaryMapSpawnPoints = false; //Planes will not use secondary airports properly, so the planes do not use this...
AIS_Cas_PatrolUnit_Cost = 6500;
AIS_Cas_PatrolUnit_Respect = 17500;



//Loaded from mapConfig
AIS_Cas_Plane_SpawnPoints = [];

//Loaded from mapConfig
//Available Spawn Points [Make sure that the aircract can actually take off and land from these positions!!]
//[(0) Name, (1) Position, (2) Dir and Up, (3) Cost, (4) Respect, (4) Required Items
AIS_Cas_Heli_SpawnPoints  = [];

//Loaded from mapConfig
// Available aircraft for CAS
//[(0) Class Name, (1) Description, (2) Cost, (3) Respect, (4) Required Items, (5) RespectEarned/Lost, (6) Spawn Positions [see format from AIS_Cas_Heli_SpawnPoints], (7) Duration [minutes, cost]]	
AIS_Cas_Units = [];
 
call compile preprocessFileLineNumbers (format ["addons\ais\apps\cas\mapConfigs\%1.sqf", toLower worldName]);
 







