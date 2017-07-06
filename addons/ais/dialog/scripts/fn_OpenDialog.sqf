   	private ["_flag"];
	disableSerialization;
	player action ["WeaponOnBack", player];
	createDialog "AISDialog";

 	_playerLocker = player getVariable ["ExileLocker", 99999];
	_playerMoney = player getVariable ["ExileMoney", 99999];
	_playerTabs = _playerMoney + _playerLocker;
	_playerRespect = ExileClientPlayerScore;

	["artillery"] call AIS_Dialog_Artillery_fnc_LoadGUI; 	
	_serverTitleCbo = ((findDisplay AIS_Dialog) displayCtrl (10));
	_plr = profileName;
	_title = "AI Support Units";
	_serverTitleCbo ctrlSetStructuredText parseText format ["<t align='left'>%3 - [%1] %2</t><t align='right'><img  size='0.85' image='addons\ais\icons\respect.paa'/> %5   <img  size='0.75' image='addons\ais\icons\poptab_ca.paa'/> %4</t>",group player, _plr,_title, _playerTabs, _playerRespect];
	_plrClass = typeOf player;
	_side = getNumber(configFile >> "cfgVehicles" >> _plrClass>> "side");
	 