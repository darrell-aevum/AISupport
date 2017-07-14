AIS_Apps_Artillery_OpenMap = {
    params["_guiPosition"];
    disableSerialization;
    
    private["_display", "_bttonW", "_bttonH", "_map", "_closeMapButton"]; 
    _display = uiNameSpace getVariable ["RscExileXM8", displayNull];
 
    _bttonW = 0.15;
    _bttonH = 0.04;

    _map = _display ctrlCreate ['RscMapControl', AIS_Dialog_Artillery_MapControl];
    _map ctrlSetPosition _guiPosition;
    _map ctrlSetBackgroundColor [
        0,
        0,
        0,
        0.45
    ];
    _map ctrlEnable true;    
    _map ctrlMapAnimAdd [0, 0.5, player];
    ctrlMapAnimCommit _map;         
    _map ctrlCommit 0;   

    //Back Button 
    _closeMapButton = _display ctrlCreate ["RscExileXM8ButtonMenu",785556];
    _closeMapButton ctrlSetPosition [
        0.75,
        0.76, 
        _bttonW, 
        _bttonH
    ];
    _closeMapButton ctrlSetText "Close Map";
    _closeMapButton ctrlSetEventHandler ["ButtonClick", "
        [] spawn {            
            disableSerialization;
            _display = uiNameSpace getVariable ['RscExileXM8', displayNull];

            [] spawn AIS_Apps_Artillery_CloseMap;

            _slide = _display displayCtrl (AIS_Dialog_Artillery_Slide);
            _slide ctrlShow true;
            _slide ctrlSetFade 0;
		    _slide ctrlCommit 0.3;	
        }
    "];
    _closeMapButton ctrlSetTooltip "ToolTip";
    _closeMapButton ctrlCommit 0;   
};