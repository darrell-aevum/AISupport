#define true 1
#define false 0

class AISDialog
{
	idd=1600;
	movingEnable = false;
	enableSimulation = true;
	fadein=0;
	duration = 1e+011;
	fadeout=0;
	onLoad= "";

	controlsBackground[]=
	{
		dialogBack,
		dialogFrame,
		RscHeaderBack,
		UnitListBack,
		UnitDescriptionBack,
		UnitInfoBack,
		MapControlBack
	};

	controls[]={
		btnCancel,
		btnConfirm,
		btnClose, 

		serverTitleText, 
		btnArtillery,
		btnReinforcements,
		btnCas,
		btnResupply,

		artilleryControlGroup,	
		casControlGroup,	
		reinforcementsControlGroup,
		resupplyControlGroup,
 	 	mapControl,

		BtnClearTarget,
		BtnCloseMap
	};
	objects[]={};

	//Backgrounds
	class dialogBack: IGUIBack
	{
		idc = 0;
		x = 0 * safezoneW + safezoneX;
		y = 0 * safezoneH + safezoneY;
		w = 1 * safezoneW;
		h = 1 * safezoneH;
		colorBackground[] = {0,0,0,0.5};
	};
	class dialogFrame: IGUIBack
	{
		idc = 1;
		x = 0.25 * safezoneW + safezoneX;
		y = 0.25 * safezoneH + safezoneY;
		w = 0.5 * safezoneW;
		h = 0.56 * safezoneH;
		colorBackground[] = {0.0,0.0,0.0,.35};
	};
	class RscHeaderBack: IGUIBack
	{
		idc = 2;
		x = 0.255 * safezoneW + safezoneX;
		y = 0.2575 * safezoneH + safezoneY;
		w = 0.49 * safezoneW;
		h = 0.05 * safezoneH;
		colorBackground[] = {0.333,0.333,0.333,0.0};
	};
	class UnitListBack: IGUIBack
	{
		idc = 1603;
		x = 0.255 * safezoneW + safezoneX;
		y = 0.355 * safezoneH + safezoneY;
		w = 0.2425 * safezoneW;
		h = 0.2275 * safezoneH;
		colorBackground[] = {0.333,0.333,0.333,0.75};
	};
	class UnitDescriptionBack: IGUIBack
	{
		idc = 1604;
		x = 0.255 * safezoneW + safezoneX;
		y = 0.590 * safezoneH + safezoneY;
		w = 0.2425 * safezoneW;
		h = 0.165 * safezoneH;
		colorBackground[] = {0.333,0.333,0.333,0.75};
	};	
	class UnitInfoBack: IGUIBack
	{
		idc = 1605;
		x = 0.5025 * safezoneW + safezoneX;
		y = 0.355 * safezoneH + safezoneY;
		w = 0.2425 * safezoneW;
		h = 0.4 * safezoneH;
		colorBackground[] = {0.333,0.333,0.333,0.75};
	};
	class MapControlBack: IGUIBack
	{
		idc = 1606;
		x = 0.255 * safezoneW + safezoneX;
		y = 0.355 * safezoneH + safezoneY;
		w = 0.4900 * safezoneW;
		h = (0.3970 * safezoneH);
		colorBackground[] = {0.333,0.333,0.333,0.75};
	};
	
	class serverTitleText: RscStructuredText
	{
		idc = 10;
		colorText[] = {1,1,1,1};
		colorBackground[] = {0,0,0,0};
		shadow = 0.75;
		x = 0.255 * safezoneW + safezoneX;
		y = 0.270 * safezoneH + safezoneY;
		w = 0.490 * safezoneW;
		h = 0.04 * safezoneH;
		onMouseButtonDown = "";
		onMouseButtonUp = "";
		onMouseZChanged = "";
		text = "";
	}; 
	//Buttons
	class btnCancel: RscShortcutButton
	{
		idc =1902;
		text = "Cancel";
		colorBackground[] = {0.4,0.4,0.4,0.75}; 
		colorBackground2[] = {0.4,0.4,0.4,1}; 
		colorBackgroundFocused[] = {0.4,0.4,0.4,1};
		onButtonClick  = "call AIS_Dialog_fnc_CancelDialog";
		x = 0.5025 * safezoneW + safezoneX;
		y = 0.7625 * safezoneH + safezoneY;
		w = 0.12 * safezoneW;
		h = 0.0335 * safezoneH;
	}; 
	class btnConfirm: RscShortcutButton
	{
		idc = 7;
		text = "Confirm";
		colorBackground[] = {0.4,0.4,0.4,0.75}; 
		colorBackground2[] = {0.4,0.4,0.4,1}; 
		colorBackgroundFocused[] = {0.4,0.4,0.4,1};
		onButtonClick  = "[] call AIS_Dialog_fnc_ConfirmDialog;";
		x = 0.625 * safezoneW + safezoneX;
		y = 0.7625 * safezoneH + safezoneY;
		w = 0.12 * safezoneW;
		h = 0.0335 * safezoneH;
	}; 	
	class btnClose: RscShortcutButton
	{
		idc = 1903;
		text = "Close";
		colorBackground[] = {0.4,0.4,0.4,0.75}; 
		colorBackground2[] = {0.4,0.4,0.4,1}; 
		colorBackgroundFocused[] = {0.4,0.4,0.4,1};
		onButtonClick  = "[] call AIS_Dialog_fnc_CancelDialog;";
		x = 0.625 * safezoneW + safezoneX;
		y = 0.7625 * safezoneH + safezoneY;
		w = 0.12 * safezoneW;
		h = 0.0335 * safezoneH;
	}; 		
	class btnArtillery: RscShortcutButton
	{  
		idc = 12;
		text = "Artillery";
		colorBackground[] = {0.4,0.4,0.4,0.75}; 
		colorBackground2[] = {0.4,0.4,0.4,1}; 
		colorBackgroundFocused[] = {0.4,0.4,0.4,1};
		onButtonClick  = "[""artillery""] call AIS_Dialog_Artillery_fnc_LoadGUI;";		
		x = 0.255 * safezoneW + safezoneX;
		y = 0.3125 * safezoneH + safezoneY;				
		w = 0.0775 * safezoneW;
		h = 0.0375 * safezoneH;
	};
	class btnCas: RscShortcutButton
	{
		idc = 13;
		text = "CAS/AT";
		colorBackground[] = {0.4,0.4,0.4,0.75}; 
		colorBackground2[] = {0.4,0.4,0.4,1}; 
		colorBackgroundFocused[] = {0.4,0.4,0.4,1};
		onButtonClick  = "[""cas""] call AIS_Dialog_Cas_fnc_LoadGUI;";		
		x = 0.3375 * safezoneW + safezoneX;		
		y = 0.3125 * safezoneH + safezoneY;
		w = 0.0775* safezoneW;
		h = 0.0375 * safezoneH;
	};  
	class btnReinforcements: RscShortcutButton
	{
		idc = 14;
		text = "Reinforcements";
		colorBackground[] = {0.4,0.4,0.4,0.75}; 
		colorBackground2[] = {0.4,0.4,0.4,1}; 
		colorBackgroundFocused[] = {0.4,0.4,0.4,1};
		onButtonClick  = "[""reinforcements""] call AIS_Dialog_Reinforcements_fnc_LoadGUI;";		
		x = 0.4200 * safezoneW + safezoneX;		
		y = 0.3125 * safezoneH + safezoneY;
		w = 0.0775 * safezoneW;
		h = 0.0375 * safezoneH;
	}; 	
	class btnResupply: RscShortcutButton
	{
		idc = 18;
		text = "Supply Drop";
		colorBackground[] = {0.4,0.4,0.4,0.75}; 
		colorBackground2[] = {0.4,0.4,0.4,1}; 
		colorBackgroundFocused[] = {0.4,0.4,0.4,1};
		onButtonClick  = "[player, ""B_Heli_Attack_01_F""] spawn AIS_Dialog_Resupply_fnc_LoadGUI;";		
		x = 0.5025 * safezoneW + safezoneX;		
		y = 0.3125 * safezoneH + safezoneY;
		w = 0.0775 * safezoneW;
		h = 0.0375 * safezoneH;
	}; 		
	class BtnCloseMap: RscShortcutButton
	{  
		idc = 1607;
		text = "Close Map";
		colorBackground[] = {0.4,0.4,0.4,0.75}; 
		colorBackground2[] = {0.4,0.4,0.4,1}; 
		colorBackgroundFocused[] = {0.4,0.4,0.4,1};
		onButtonClick  = "call AIS_Dialog_Artillery_fnc_CloseMap";		
		x = 0.585 * safezoneW + safezoneX;
		y = 0.3125 * safezoneH + safezoneY;
		w = 0.0775* safezoneW;
		h = 0.0375 * safezoneH;
	};

	class BtnClearTarget: RscShortcutButton
	{  
		idc = 1608;
		text = "Clear Target(s)";
		colorBackground[] = {0.4,0.4,0.4,0.751}; 
		colorBackground2[] = {0.4,0.4,0.4,1}; 
		colorBackgroundFocused[] = {0.4,0.4,0.4,1};
		onButtonClick  = "deleteMarker 'AIS_TARGET';targetPos = nil;";		
		x = 0.6675 * safezoneW + safezoneX;
		y = 0.3125 * safezoneH + safezoneY;
		w = 0.0775 * safezoneW;
		h = 0.0375 * safezoneH;
	};


	//Control Groups
	class artilleryControlGroup:RscControlsGroup
	{
		idc = 2200;
		x = 0.260 * safezoneW + safezoneX;
		y = 0.365 * safezoneH + safezoneY;
		w = 0.4800 * safezoneW;
		h = (0.3850 * safezoneH);

		class Controls
		{ 			
			class UnitList: RscListBox
			{
				idc = 2201;
				onLBSelChanged  = "[_this] spawn AIS_Dialog_Artillery_fnc_LoadUnit;";
				colorText[] = {1,1,1,1};
				colorDisabled[] = {1,1,1,0.25};
				colorScrollbar[] = {1,0,0,0};
				colorSelect[] = {1,1,1,1};
				colorSelect2[] = {1,1,1,1};
				colorSelectBackground[] = {0,0,0,0.5};
				colorSelectBackground2[] = {0.667,0.714,0.635,1};
				colorBackground[] = {0.667,0.714,0.635,0.75};
				shadow = 0.75;
				x = 0;
				y = 0;
				w = 0.2325 * safezoneW;
				h = 0.2085 * safezoneH;
			};	
			class UnitDescription: RscStructuredText
			{
				idc = 2202;
				colorText[] = {1,1,1,1};
				colorBackground[] = {0.667,0.714,0.635,0.75};
				shadow = 0.75;
				size = 0.037;
				x = 0;
				y = 0.430;
				w = 0.2325 * safezoneW;
				h = 0.1450 * safezoneH;
				onMouseButtonDown = "";
				onMouseButtonUp = "";
				onMouseZChanged = "";
				text = "";
			}; 		 
 			class UnitInfo: IGUIBack
			{
				idc = 2203; 
				colorBackground[] = {0.667,0.714,0.635,.75}; 
				x = 0.5400;
				y = 0;
				w = 0.2320 * safezoneW;
				h = 0.3810 * safezoneH; 
			};
			
			class LblRoundTypeToFire: RscStructuredText
			{
				idc = 2298;
				colorText[] = {1,1,1,1};
				colorBackground[] = {0,0,0,0};
				shadow = 0.75;
				x = 0.5550;
				y = 0.0;
				w = 0.2100 * safezoneW;
				h = 0.030 * safezoneH;
				onMouseButtonDown = "";
				onMouseButtonUp = "";
				onMouseZChanged = "";
				text = "Round Type:";
			};			  
			class RoundTypeToFire: RscCombo
			{
				idc = 2204;
			//	onLBSelChanged  = "[] spawn TUT_gui_VehInfo;";
			//	colorText[] = {1,1,1,1};
			//	colorDisabled[] = {1,1,1,0.25};
			//	colorScrollbar[] = {1,0,0,0};
			//	colorSelect[] = {1,1,1,1};
			//	colorSelect2[] = {1,1,1,1};
			//	colorSelectBackground[] = {0,0,0,0.5};
			//	colorSelectBackground2[] = {0.667,0.714,0.635,1};
			//	colorBackground[] = {0.667,0.714,0.635,1};
			//	shadow = 0.75;
				x = 0.5650;
				y = 0.05;
				w = 0.2100 * safezoneW;
				h = 0.030 * safezoneH;
			};
			class LblRoundNumberToFire: RscStructuredText
			{
				idc = 2299;
				colorText[] = {1,1,1,1};
				colorBackground[] = {0,0,0,0};
				shadow = 0.75;
				x = 0.5550;
				y = 0.12;
				w = 0.2100 * safezoneW;
				h = 0.030 * safezoneH;
				onMouseButtonDown = "";
				onMouseButtonUp = "";
				onMouseZChanged = "";
				text = "Number of Rounds to Fire:";
			};						
			class RoundNumberToFire: RscCombo
			{
				idc = 2205;
			//	onLBSelChanged  = "[] spawn TUT_gui_VehInfo;";
			//	colorText[] = {1,1,1,1};
			//	colorDisabled[] = {1,1,1,0.25};
			//	colorScrollbar[] = {1,0,0,0};
			//	colorSelect[] = {1,1,1,1};
			//	colorSelect2[] = {1,1,1,1};
			//	colorSelectBackground[] = {0,0,0,0.5};
			//	colorSelectBackground2[] = {0.667,0.714,0.635,1};
			//	colorBackground[] = {0.667,0.714,0.635,1};
			//	shadow = 0.75;
				x = 0.5650;
				y = 0.17;
				w = 0.2100 * safezoneW;
				h = 0.030 * safezoneH;
			};							
			class btnMarkTarget: RscShortcutButton
			{  
				idc = 2206;
				text = "Mark Target";
				colorBackground[] = {0.4,0.4,0.4,0.75}; 
				colorBackground2[] = {0.4,0.4,0.4,1}; 
				colorBackgroundFocused[] = {0.4,0.4,0.4,1};
				onButtonClick  = "[] spawn AIS_Dialog_Artillery_fnc_OpenMap;";		
				x = 0.6400;
				y = 0.63;			
				w = 0.1475 * safezoneW;
				h = 0.0305 * safezoneH;
			};	 						
		}; 
	}; 
	class casControlGroup:RscControlsGroup
	{
		idc = 2300;
		x = 0.260 * safezoneW + safezoneX;
		y = 0.365 * safezoneH + safezoneY;
		w = 0.4800 * safezoneW;
		h = (0.3850 * safezoneH);

		class Controls
		{ 			
			class UnitList: RscListBox
			{
				idc = 2301;
			 	onLBSelChanged  = "[] spawn AIS_Dialog_Cas_fnc_LoadUnit;";
				colorText[] = {1,1,1,1};
				colorDisabled[] = {1,1,1,0.25};
				colorScrollbar[] = {1,0,0,0};
				colorSelect[] = {1,1,1,1};
				colorSelect2[] = {1,1,1,1};
				colorSelectBackground[] = {0,0,0,0.5};
				colorSelectBackground2[] = {0.667,0.714,0.635,1};
				colorBackground[] = {0.667,0.714,0.635,0.75};
				shadow = 0.75;
				x = 0;
				y = 0;
				w = 0.2325 * safezoneW;
				h = 0.2085 * safezoneH;
			};	
			class UnitDescription: RscStructuredText
			{
				idc = 2302;
				colorText[] = {1,1,1,1};
				colorBackground[] = {0.667,0.714,0.635,1};
				shadow = 0.75;
				size = 0.037;
				x = 0;
				y = 0.430;
				w = 0.2325 * safezoneW;
				h = 0.1450 * safezoneH;
				onMouseButtonDown = "";
				onMouseButtonUp = "";
				onMouseZChanged = "";
				text = "";
			}; 		 
 			class UnitInfo: IGUIBack
			{
				idc = 2303; 
				colorBackground[] = {0.667,0.714,0.635,.75}; 
				x = 0.5400;
				y = 0;
				w = 0.2320 * safezoneW;
				h = 0.3810 * safezoneH; 
			};
			class LblRoundTypeToFire: RscStructuredText
			{
				idc = 2398;
				colorText[] = {1,1,1,1};
				colorBackground[] = {0,0,0,0};
				shadow = 0.75;
				x = 0.5550;
				y = 0.0;
				w = 0.2100 * safezoneW;
				h = 0.030 * safezoneH;
				onMouseButtonDown = "";
				onMouseButtonUp = "";
				onMouseZChanged = "";
				text = "Duration:";
			};			  
			class Duration: RscCombo
			{
				idc = 2304;
			//	onLBSelChanged  = "[] spawn TUT_gui_VehInfo;";
			//	colorText[] = {1,1,1,1};
			//	colorDisabled[] = {1,1,1,0.25};
			//	colorScrollbar[] = {1,0,0,0};
			//	colorSelect[] = {1,1,1,1};
			//	colorSelect2[] = {1,1,1,1};
			//	colorSelectBackground[] = {0,0,0,0.5};
			//	colorSelectBackground2[] = {0.667,0.714,0.635,1};
			//	colorBackground[] = {0.667,0.714,0.635,1};
			//	shadow = 0.75;
				x = 0.5650;
				y = 0.05;
				w = 0.2100 * safezoneW;
				h = 0.030 * safezoneH;
			}; 					
		}; 
	}; 
	class reinforcementsControlGroup:RscControlsGroup
	{ 
		idc = 2400;
		x = 0.260 * safezoneW + safezoneX;
		y = 0.365 * safezoneH + safezoneY;
		w = 0.4800 * safezoneW;
		h = (0.3850 * safezoneH);

		class Controls
		{ 		 
 			class UnitListBack: IGUIBack
			{
				idc = 2444; 
				colorBackground[] = {0.667,0.714,0.635,.75}; 
				x = 0;
				y = 0;
				w = 0.2325 * safezoneW;
				h = 0.2085 * safezoneH;
			}; 		
			class UnitInfoBack: IGUIBack
			{
				idc = 2445; 
				colorBackground[] = {0.667,0.714,0.635,.75}; 
				x = 0.5400;
				y = 0;
				w = 0.2320 * safezoneW;
				h = 0.3810 * safezoneH; 
			}; 	
			class DescriptionBack: IGUIBack
			{
				idc = 2446; 
				colorBackground[] = {0.667,0.714,0.635,.75}; 
				x = 0;
				y = 0.430;
				w = 0.2325 * safezoneW;
				h = 0.1450 * safezoneH;
			}; 		 
			class SquadOrSoldierCombo: RscCombo
			{
				idc = 2401;
			 	onLBSelChanged  = "[_this] spawn AIS_Dialog_Reinforcements_fnc_SquadOrSoldierComboChanged;";
			//	colorText[] = {1,1,1,1};
			//	colorDisabled[] = {1,1,1,0.25};
			//	colorScrollbar[] = {1,0,0,0};
			//	colorSelect[] = {1,1,1,1};
			//	colorSelect2[] = {1,1,1,1};
			//	colorSelectBackground[] = {0,0,0,0.5};
			//	colorSelectBackground2[] = {0.667,0.714,0.635,1};
				colorBackground[] = {0.0,0.0,0.0,.75};
			//	shadow = 0.75;
				x = 0.01;
				y = 0.01;
				w = 0.2245 * safezoneW;
				h = 0.030 * safezoneH;
			};	 				
			class UnitListBox: RscListBox
			{
				idc = 2403;
				onLBSelChanged  = "[] spawn AIS_Dialog_Reinforcements_fnc_UnitChanged;";
				onLBDblClick   = "[_this select 1] spawn AIS_Dialog_Reinforcements_fnc_AddUnitToCargo;";
				colorText[] = {1,1,1,1};
				colorDisabled[] = {1,1,1,0.25};
				colorScrollbar[] = {1,0,0,0};
				colorSelect[] = {1,1,1,1};
				colorSelect2[] = {1,1,1,1};
				colorSelectBackground[] = {0,0,0,0.5};
				colorSelectBackground2[] = {0.667,0.714,0.635,1}; 
				shadow = 0.75;
				x = 0.01;
				y = 0.145;
				w = 0.2245 * safezoneW;
				h = 0.1250 * safezoneH;
			};	 		
			class UnitDescription: RscStructuredText
			{
				idc = 2404;
				colorText[] = {1,1,1,1};
				colorBackground[] = {0.667,0.714,0.635,0.0};
				shadow = 0.75;
				size = 0.037;
				x = 0;
				y = 0.430;
				w = 0.2325 * safezoneW;
				h = 0.1100 * safezoneH;
				onMouseButtonDown = "";
				onMouseButtonUp = "";
				onMouseZChanged = "";
				text = "";
			}; 	
			class LblCargo: RscStructuredText
			{
				idc = 2498;
				colorText[] = {1,1,1,1};
				colorBackground[] = {0,0,0,.75};
				shadow = 0.75;
				x = 0.5475;
				y = 0.0080;
			    w = 0.2250 * safezoneW;
				h = 0.025 * safezoneH;
				onMouseButtonDown = "";
				onMouseButtonUp = "";
				onMouseZChanged = "";
				text = "Cargo:";
			};				
			class CargoListBox: RscListBox
			{
				idc = 2405;				
				onLBSelChanged   = "[_this] spawn AIS_Dialog_Reinforcements_fnc_CargoUnitChanged;";
				onLBDblClick  = "[_this select 1] call AIS_Dialog_Reinforcements_fnc_RemoveUnitFromCargo;";		
				colorText[] = {1,1,1,1};
				colorDisabled[] = {1,1,1,0.25};
				colorScrollbar[] = {1,0,0,0};
				colorSelect[] = {1,1,1,1};
				colorSelect2[] = {1,1,1,1};
				colorSelectBackground[] = {0,0,0,0.5};
				colorSelectBackground2[] = {0.667,0.714,0.635,1}; 
				shadow = 0.75;
				x = 0.5475;
				y = 0.056;
			    w = 0.2250 * safezoneW;
				h = 0.145 * safezoneH; 
			};		
			class LblInsertionMethod: RscStructuredText
			{
				idc = 2498;
				colorText[] = {1,1,1,1};
				colorBackground[] = {0,0,0,.75};
				shadow = 0.75;
				x = 0.5475;
				w = 0.2250 * safezoneW;
				y = 0.410;			     
				h = 0.025 * safezoneH;
				onMouseButtonDown = "";
				onMouseButtonUp = "";
				onMouseZChanged = "";
				text = "Insertion Method:";
			};					
			class DeliveryVehicle: RscCombo
			{
				idc = 2406;
			 	onLBSelChanged  = "[] call AIS_Dialog_Reinforcements_fnc_CargoChanged;";
			//	colorText[] = {1,1,1,1};
			//	colorDisabled[] = {1,1,1,0.25};
			//	colorScrollbar[] = {1,0,0,0};
			//	colorSelect[] = {1,1,1,1};
			//	colorSelect2[] = {1,1,1,1};
			//	colorSelectBackground[] = {0,0,0,0.5};
			//	colorSelectBackground2[] = {0.667,0.714,0.635,1};
				colorBackground[] = {0.0,0.0,0.0,.75};
			//	shadow = 0.75;
				x = 0.5475;
				w = 0.2250 * safezoneW;
				y = 0.4560;				
				h = 0.030 * safezoneH;
			};		
			class CargoTotalTxt: RscStructuredText
			{
				idc = 2407;
				colorText[] = {1,1,1,1};
			 	colorBackground[] = {0.667,0.714,0.635,0.5};
				shadow = 0.75;
				size = 0.037;
				x = 0.5475;
				w = 0.2250 * safezoneW;
				y = 0.520; 
				h = 0.09 * safezoneH; 
				onMouseButtonDown = "";
				onMouseButtonUp = "";
				onMouseZChanged = "";
				text = "";
			}; 		 		
			class AddUnitToCargoBtn: RscShortcutButton
			{  
				idc = 2409;
				text = "Add To Cargo";
				colorBackground[] = {0.4,0.4,0.4,0.75}; 
				colorBackground2[] = {0.4,0.4,0.4,1}; 
				colorBackgroundFocused[] = {0.4,0.4,0.4,1};
				onButtonClick  = "[lbCurSel AIS_Dialog_Resupply_TraderItems] call AIS_Dialog_Reinforcements_fnc_AddUnitToCargo";		
				x = 0.180;
				y = 0.63;			
				w = 0.1475 * safezoneW;
				h = 0.0305 * safezoneH;
			};	 					
			class btnRemoveFromCrate: RscShortcutButton
			{  
				idc = 2410;
				text = "Remove From Cargo";
				colorBackground[] = {0.4,0.4,0.4,0.75}; 
				colorBackground2[] = {0.4,0.4,0.4,1}; 
				colorBackgroundFocused[] = {0.4,0.4,0.4,1};
				onButtonClick  = "[lbCurSel AIS_Dialog_Resupply_CrateList] call AIS_Dialog_Reinforcements_fnc_RemoveUnitFromCargo;";		
				x = 0.7250;
	        	y = 0.335;			
				w = 0.1435 * safezoneW;
					h = 0.0305 * safezoneH;
			};	   								
		}; 
	}; 
	class resupplyControlGroup:RscControlsGroup
	{
		idc = 2500;
		x = 0.260 * safezoneW + safezoneX;
		y = 0.365 * safezoneH + safezoneY;
		w = 0.4800 * safezoneW;
		h = (0.3850 * safezoneH)

		class Controls
		{ 		 
 			class UnitListBack: IGUIBack
			{
				idc = 2555; 
				colorBackground[] = {0.667,0.714,0.635,.75}; 
				x = 0;
				y = 0;
				w = 0.2325 * safezoneW;
				h = 0.2085 * safezoneH;
			}; 		
			class UnitInfoBack: IGUIBack
			{
				idc = 2556; 
				colorBackground[] = {0.667,0.714,0.635,.75}; 
				x = 0.5400;
				y = 0;
				w = 0.2320 * safezoneW;
				h = 0.3810 * safezoneH; 
			}; 	
			class DescriptionBack: IGUIBack
			{
				idc = 2557; 
				colorBackground[] = {0.667,0.714,0.635,.75}; 
				x = 0;
				y = 0.430;
				w = 0.2325 * safezoneW;
				h = 0.1450 * safezoneH;
			}; 		 
			class TraderCategories: RscCombo
			{
				idc = 2501;
			 	onLBSelChanged  = "[] spawn AIS_Dialog_Resupply_fnc_TraderCategoryChanged;";
			//	colorText[] = {1,1,1,1};
			//	colorDisabled[] = {1,1,1,0.25};
			//	colorScrollbar[] = {1,0,0,0};
			//	colorSelect[] = {1,1,1,1};
			//	colorSelect2[] = {1,1,1,1};
			//	colorSelectBackground[] = {0,0,0,0.5};
			//	colorSelectBackground2[] = {0.667,0.714,0.635,1};
				colorBackground[] = {0.0,0.0,0.0,.75};
			//	shadow = 0.75;
				x = 0.01;
				y = 0.01;
				w = 0.2245 * safezoneW;
				h = 0.030 * safezoneH
			};		 		
			class TraderItemCategories: RscCombo
			{
				idc = 2502;
			 	onLBSelChanged  = "[] spawn AIS_Dialog_Resupply_fnc_TraderItemsCategoryChanged;";
			//	colorText[] = {1,1,1,1};
			//	colorDisabled[] = {1,1,1,0.25};
			//	colorScrollbar[] = {1,0,0,0};
			//	colorSelect[] = {1,1,1,1};
			//	colorSelect2[] = {1,1,1,1};
			//	colorSelectBackground[] = {0,0,0,0.5};
			//	colorSelectBackground2[] = {0.667,0.714,0.635,1};
				colorBackground[] = {0.0,0.0,0.0,.75};
			//	shadow = 0.75;
				x = 0.01;
				y = 0.075;
				w = 0.2245 * safezoneW;
				h = 0.030 * safezoneH
			};						
			class TraderItems: RscListBox
			{
				idc = 2503;
				onLBSelChanged  = "[] spawn AIS_Dialog_Resupply_fnc_TraderItemChanged;";
				onLBDblClick   = "[_this select 1] spawn AIS_Dialog_Resupply_fnc_AddItemToCrate;";
				colorText[] = {1,1,1,1};
				colorDisabled[] = {1,1,1,0.25};
				colorScrollbar[] = {1,0,0,0};
				colorSelect[] = {1,1,1,1};
				colorSelect2[] = {1,1,1,1};
				colorSelectBackground[] = {0,0,0,0.5};
				colorSelectBackground2[] = {0.667,0.714,0.635,1}; 
				shadow = 0.75;
				x = 0.01;
				y = 0.145;
				w = 0.2245 * safezoneW;
				h = 0.1250 * safezoneH;
			};	 		
			class TraderItemDescription: RscStructuredText
			{
				idc = 2504;
				colorText[] = {1,1,1,1};
				colorBackground[] = {0.667,0.714,0.635,0.0};
				shadow = 0.75;
				size = 0.037;
				x = 0;
				y = 0.430;
				w = 0.2325 * safezoneW;
				h = 0.1100 * safezoneH;
				onMouseButtonDown = "";
				onMouseButtonUp = "";
				onMouseZChanged = "";
				text = "";
			}; 	
			class LblCrate: RscStructuredText
			{
				idc = 2398;
				colorText[] = {1,1,1,1};
				colorBackground[] = {0,0,0,.75};
				shadow = 0.75;
				x = 0.5475;
				y = 0.0080;
			    w = 0.2250 * safezoneW;
				h = 0.025 * safezoneH
				onMouseButtonDown = "";
				onMouseButtonUp = "";
				onMouseZChanged = "";
				text = "Crate:";
			};				
			class CrateLit: RscListBox
			{
				idc = 2505;				
				onLBSelChanged   = "[_this] spawn AIS_Dialog_Resupply_fnc_TraderItemChanged;";
				onLBDblClick  = "[_this select 1] call AIS_Dialog_Resupply_fnc_RemoveItemFromCrate;";		
				colorText[] = {1,1,1,1};
				colorDisabled[] = {1,1,1,0.25};
				colorScrollbar[] = {1,0,0,0};
				colorSelect[] = {1,1,1,1};
				colorSelect2[] = {1,1,1,1};
				colorSelectBackground[] = {0,0,0,0.5};
				colorSelectBackground2[] = {0.667,0.714,0.635,1}; 
				shadow = 0.75;
				x = 0.5475;
				y = 0.056;
			    w = 0.2250 * safezoneW;
				h = 0.145 * safezoneH; 
			};		
			class LblDeliveryMethod: RscStructuredText
			{
				idc = 2398;
				colorText[] = {1,1,1,1};
				colorBackground[] = {0,0,0,.75};
				shadow = 0.75;
				x = 0.5475;
				w = 0.2250 * safezoneW;
				y = 0.410;			     
				h = 0.025 * safezoneH
				onMouseButtonDown = "";
				onMouseButtonUp = "";
				onMouseZChanged = "";
				text = "Delivery Method:";
			};					
			class DeliveryVehicle: RscCombo
			{
				idc = 2506;
			 	onLBSelChanged  = "[] call AIS_Dialog_Resupply_fnc_DeliveryVehicleChanged;";
			//	colorText[] = {1,1,1,1};
			//	colorDisabled[] = {1,1,1,0.25};
			//	colorScrollbar[] = {1,0,0,0};
			//	colorSelect[] = {1,1,1,1};
			//	colorSelect2[] = {1,1,1,1};
			//	colorSelectBackground[] = {0,0,0,0.5};
			//	colorSelectBackground2[] = {0.667,0.714,0.635,1};
				colorBackground[] = {0.0,0.0,0.0,.75};
			//	shadow = 0.75;
				x = 0.5475;
				w = 0.2250 * safezoneW;
				y = 0.4560;				
				h = 0.030 * safezoneH
			};		
			class CrateTotal: RscStructuredText
			{
				idc = 2507;
				colorText[] = {1,1,1,1};
			 	colorBackground[] = {0.667,0.714,0.635,0.5};
				shadow = 0.75;
				size = 0.037;
				x = 0.5475;
				w = 0.2250 * safezoneW;
				y = 0.520; 
				h = 0.09 * safezoneH; 
				onMouseButtonDown = "";
				onMouseButtonUp = "";
				onMouseZChanged = "";
				text = "";
			}; 		 		
			class btnAddToCrate: RscShortcutButton
			{  
				idc = 2509;
				text = "Add To Crate";
				colorBackground[] = {0.4,0.4,0.4,0.75}; 
				colorBackground2[] = {0.4,0.4,0.4,1}; 
				colorBackgroundFocused[] = {0.4,0.4,0.4,1};
				onButtonClick  = "[lbCurSel AIS_Dialog_Resupply_TraderItems] call AIS_Dialog_Resupply_fnc_AddItemToCrate";		
				x = 0.180;
				y = 0.63;			
				w = 0.1475 * safezoneW;
				h = 0.0305 * safezoneH;
			};	 					
			class btnRemoveFromCrate: RscShortcutButton
			{  
				idc = 2510;
				text = "Remove From Crate";
				colorBackground[] = {0.4,0.4,0.4,0.75}; 
				colorBackground2[] = {0.4,0.4,0.4,1}; 
				colorBackgroundFocused[] = {0.4,0.4,0.4,1};
				onButtonClick  = "[lbCurSel AIS_Dialog_Resupply_CrateList] call AIS_Dialog_Resupply_fnc_RemoveItemFromCrate;";		
				x = 0.7250;
	        	y = 0.335;			
				w = 0.1435 * safezoneW;
					h = 0.0305 * safezoneH;
			};	   								
		}; 
	}; 
	//Map Control
	class mapControl:RscMapControl
	{		
		idc = 4000; 
		x = 0.260 * safezoneW + safezoneX;
		y = 0.365 * safezoneH + safezoneY;
		w = 0.4800 * safezoneW;
		h = (0.3800 * safezoneH)
	};
};
 