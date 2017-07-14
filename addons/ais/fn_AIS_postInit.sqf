{
	if(isText(missionConfigFile >> "CfgXM8" >> _x >> "onOpen"))then{
		_code = compileFinal (preprocessFileLineNumbers getText(missionConfigFile >> "CfgXM8" >> _x >> "onOpen"));                    
		missionNamespace setVariable [format["ExileClient_gui_xm8_slide_%1_onOpen",_x], _code];
	};
	
	if(isText(missionConfigFile >> "CfgXM8" >> _x >> "onClose"))then{
		_code = compileFinal (preprocessFileLineNumbers getText(missionConfigFile >> "CfgXM8" >> _x >> "onClose"));                    
		missionNamespace setVariable [format["ExileClient_gui_xm8_slide_%1_onClose",_x], _code];
	};
	
	if(isText(missionConfigFile >> "CfgXM8" >> _x >> "config"))then{
		call compileFinal (preprocessFileLineNumbers getText(missionConfigFile >> "CfgXM8" >> _x >> "config"));
	};
}forEach (getArray(missionConfigFile >> "CfgXM8" >> "extraApps"));