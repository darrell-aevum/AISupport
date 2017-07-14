AIS_Apps_Artillery_CloseMap = {
    disableSerialization;    
    _display = uiNameSpace getVariable ['RscExileXM8', displayNull];
     
    ctrlDelete (_display displayCtrl AIS_Dialog_Artillery_MapControl);
    ctrlDelete (_display displayCtrl 785556);  
    
 
    mapclick = false;
    onMapSingleClick "mapclick = false; false";
};