	private ["_class", "_description", "_cost", "_respect", "_requiredGear"];

	disableSerialization;
	_index =  lbCurSel AIS_Dialog_Resupply_TraderItemCategories;    
	_class = lbData [AIS_Dialog_Resupply_TraderItemCategories, _index];
	
	_cbo = ((findDisplay AIS_Dialog) displayCtrl (AIS_Dialog_Resupply_TraderItems));	
	lbCLear _cbo;
	_cbo lbSetCurSel -1;

	
 	_textCbo = ((findDisplay AIS_Dialog) displayCtrl (AIS_Dialog_Resupply_TraderItemDescription)); 
 	_textCbo ctrlSetStructuredText  parseText  "";

 	_items = getArray (missionconfigfile >> "CfgTraderCategories" >> _class >> "items"); 
	{ 
			private["_type"];

			_type = "cfgVehicles";
			_obj = (configFile >> _type >> _x); 			

			if (isNull _obj) then {
				_type = "cfgWeapons";
				_obj = (configFile >> _type >>  _x); 
			};				 					
			if (isNull _obj) then {
				_type = "cfgMagazines";
				_obj = (configFile >> _type >>  _x); 
			};	
			if (isNull _obj) then {
				_type = "cfgAmmo";
				_obj = (configFile >> _type >>  _x); 
			};	
			if !(isNull _obj) then {   
				_index = _cbo lbAdd(getText(configFile >> _type >>  _x >> "displayName"));
				
				_cbo lbSetData[(lbSize _cbo)-1,   _x];
				_picture = (getText(configFile >> _type >>  _x >> "picture"));
				_cbo lbSetPicture[(lbSize _cbo)-1,_picture]; 			
			}
			else 
			{
				 //systemchat(format["Unknown class: %1", _x]);
		    }
	} forEach _items;

 
  
 