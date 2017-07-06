params [["_type", "systemChat"], ["_title", ""], ["_body", ""]];
	_message = format["[%1] %2", _title, _body];
	switch (_type) do {
		case "systemChat": {
			systemChat (_message);
		};
		case "errorToaster": {
			["ErrorTitleAndText", [_message]] call ExileClient_gui_toaster_addTemplateToast;
		};
		case "successToaster": {
			["SuccessTitleAndText", [_message]] call ExileClient_gui_toaster_addTemplateToast;
		}; 
		case "infoToaster": {
			["infoTitleAndText", [_message]] call ExileClient_gui_toaster_addTemplateToast; 
		};    
		case "hint": {
			hint (str _message);
		};
		default {  };
	};