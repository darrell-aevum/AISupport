   	private ["_flag"];
	disableSerialization;
	player action ["WeaponOnBack", player];
	createDialog "AISDialog";

 

	["artillery"] call AIS_Client_fnc_LoadArtilleryGUI; 	
	_serverTitleCbo = ((findDisplay AIS_Dialog) displayCtrl (10));
	_plr = profileName;
	_title = "AI Support Units";
	_serverTitleCbo ctrlSetStructuredText parseText format ["<t align='left'>%1</t><t align='right'>%2</t>",_plr,_title];
	_plrClass = typeOf player;
	_side = getNumber(configFile >> "cfgVehicles" >> _plrClass>> "side");
	_flagCbo = ((findDisplay 1601) displayCtrl (11));
	switch (_side) do
	{				
		case 0: {_flag = "\A3\Data_F\Flags\Flag_CSAT_CO.paa";}; 
		case 1: {_flag = "\A3\Data_F\Flags\Flag_nato_CO.paa";}; 
		case 2: {_flag = "\A3\Data_F\Flags\Flag_AAF_CO.paa";}; 	
	};
	_flagCbo ctrlSetText _flag;