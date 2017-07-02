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

		serverTitleText,
		RscPlayerFlagLeft,
		btnArtillery,
		btnReinforcements,
		btnCas,


		artilleryControlGroup,	
		casControlGroup,	
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
		colorBackground[] = {0.529,0.565,0.49,1};
	};
	class RscHeaderBack: IGUIBack
	{
		idc = 2;
		x = 0.255 * safezoneW + safezoneX;
		y = 0.2575 * safezoneH + safezoneY;
		w = 0.49 * safezoneW;
		h = 0.05 * safezoneH;
		colorBackground[] = {0.333,0.333,0.333,0.75};
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
		h = (0.3970 * safezoneH)
		colorBackground[] = {0.333,0.333,0.333,0.75};
	};
	
	class serverTitleText: RscStructuredText
	{
		idc = 10;
		colorText[] = {1,1,1,1};
		colorBackground[] = {0,0,0,0};
		shadow = 0.75;
		x = 0.305 * safezoneW + safezoneX;
		y = 0.265 * safezoneH + safezoneY;
		w = 0.435 * safezoneW;
		h = 0.04 * safezoneH;
		onMouseButtonDown = "";
		onMouseButtonUp = "";
		onMouseZChanged = "";
		text = "";
	};
	class RscPlayerFlagLeft: RscPicture
	{
		idc = 11;
		colorBackground[] = {0,0,0,1};
		sizeEx = 0.1;
		text = "";
		x = 0.2575 * safezoneW + safezoneX;
		y = 0.26 * safezoneH + safezoneY;
		w = 0.05 * safezoneW;
		h = 0.045* safezoneH;	
	};

	//Buttons
	class btnCancel: RscShortcutButton
	{
		idc =6;
		text = "Cancel";
		colorBackground[] = {0.4,0.4,0.4,1}; 
		colorBackground2[] = {0.4,0.4,0.4,1}; 
		colorBackgroundFocused[] = {0.4,0.4,0.4,1};
		onButtonClick  = "call AIS_Client_fnc_CancelDialog";
		x = 0.5025 * safezoneW + safezoneX;
		y = 0.7625 * safezoneH + safezoneY;
		w = 0.12 * safezoneW;
		h = 0.0335 * safezoneH;
	}; 
	class btnConfirm: RscShortcutButton
	{
		idc = 7;
		text = "Confirm";
		colorBackground[] = {0.4,0.4,0.4,1}; 
		colorBackground2[] = {0.4,0.4,0.4,1}; 
		colorBackgroundFocused[] = {0.4,0.4,0.4,1};
		onButtonClick  = "[] call AIS_Client_fnc_ConfirmDialog;";
		x = 0.625 * safezoneW + safezoneX;
		y = 0.7625 * safezoneH + safezoneY;
		w = 0.12 * safezoneW;
		h = 0.0335 * safezoneH;
	}; 	
	class btnArtillery: RscShortcutButton
	{  
		idc = 12;
		text = "Artillery";
		colorBackground[] = {0.4,0.4,0.4,1}; 
		colorBackground2[] = {0.4,0.4,0.4,1}; 
		colorBackgroundFocused[] = {0.4,0.4,0.4,1};
		onButtonClick  = "[""artillery""] call AIS_Client_fnc_LoadArtilleryGUI;";		
		x = 0.255 * safezoneW + safezoneX;
		y = 0.3125 * safezoneH + safezoneY;				
		w = 0.0775 * safezoneW;
		h = 0.0375 * safezoneH;
	};
	class btnCas: RscShortcutButton
	{
		idc = 13;
		text = "CAS/AT";
		colorBackground[] = {0.4,0.4,0.4,1}; 
		colorBackground2[] = {0.4,0.4,0.4,1}; 
		colorBackgroundFocused[] = {0.4,0.4,0.4,1};
		onButtonClick  = "[""cas""] call AIS_Client_fnc_LoadCasGUI;";		
		x = 0.3375 * safezoneW + safezoneX;		
		y = 0.3125 * safezoneH + safezoneY;
		w = 0.0775* safezoneW;
		h = 0.0375 * safezoneH;
	};  
	class btnReinforcements: RscShortcutButton
	{
		idc = 14;
		text = "Reinforcements";
		colorBackground[] = {0.4,0.4,0.4,1}; 
		colorBackground2[] = {0.4,0.4,0.4,1}; 
		colorBackgroundFocused[] = {0.4,0.4,0.4,1};
		onButtonClick  = "[""reinforcements""] call AIS_Client_fnc_LoadReinforcementsGUI;";		
		x = 0.4200 * safezoneW + safezoneX;		
		y = 0.3125 * safezoneH + safezoneY;
		w = 0.0775 * safezoneW;
		h = 0.0375 * safezoneH;
	}; 	
	class BtnCloseMap: RscShortcutButton
	{  
		idc = 1607;
		text = "Close Map";
		colorBackground[] = {0.4,0.4,0.4,1}; 
		colorBackground2[] = {0.4,0.4,0.4,1}; 
		colorBackgroundFocused[] = {0.4,0.4,0.4,1};
		onButtonClick  = "call AIS_Client_fnc_CloseMap";		
		x = 0.585 * safezoneW + safezoneX;
		y = 0.3125 * safezoneH + safezoneY;
		w = 0.0775* safezoneW;
		h = 0.0375 * safezoneH;
	};

	class BtnClearTarget: RscShortcutButton
	{  
		idc = 1608;
		text = "Clear Target(s)";
		colorBackground[] = {0.4,0.4,0.4,1}; 
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
		h = (0.3850 * safezoneH)

		class Controls
		{ 			
			class UnitList: RscListBox
			{
				idc = 2201;
				onLBSelChanged  = "[] spawn AIS_Client_fnc_LoadArtilleryUnit;";
				colorText[] = {1,1,1,1};
				colorDisabled[] = {1,1,1,0.25};
				colorScrollbar[] = {1,0,0,0};
				colorSelect[] = {1,1,1,1};
				colorSelect2[] = {1,1,1,1};
				colorSelectBackground[] = {0,0,0,0.5};
				colorSelectBackground2[] = {0.667,0.714,0.635,1};
				colorBackground[] = {0.667,0.714,0.635,1};
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
				idc = 2203; 
				colorBackground[] = {0.667,0.714,0.635,1}; 
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
				h = 0.030 * safezoneH
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
				h = 0.030 * safezoneH
			};
			class LblRoundNumberToFire: RscStructuredText
			{
				idc = 2298;
				colorText[] = {1,1,1,1};
				colorBackground[] = {0,0,0,0};
				shadow = 0.75;
				x = 0.5550;
				y = 0.12;
				w = 0.2100 * safezoneW;
				h = 0.030 * safezoneH
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
				h = 0.030 * safezoneH
			};							
			class btnMarkTarget: RscShortcutButton
			{  
				idc = 2206;
				text = "Mark Target";
				colorBackground[] = {0.4,0.4,0.4,1}; 
				colorBackground2[] = {0.4,0.4,0.4,1}; 
				colorBackgroundFocused[] = {0.4,0.4,0.4,1};
				onButtonClick  = "[] spawn AIS_Client_fnc_OpenMap;";		
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
		h = (0.3850 * safezoneH)

		class Controls
		{ 			
			class UnitList: RscListBox
			{
				idc = 2301;
			//	onLBSelChanged  = "[] spawn AIS_Client_fnc_LoadCasUnit;";
				colorText[] = {1,1,1,1};
				colorDisabled[] = {1,1,1,0.25};
				colorScrollbar[] = {1,0,0,0};
				colorSelect[] = {1,1,1,1};
				colorSelect2[] = {1,1,1,1};
				colorSelectBackground[] = {0,0,0,0.5};
				colorSelectBackground2[] = {0.667,0.714,0.635,1};
				colorBackground[] = {0.667,0.714,0.635,1};
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
				colorBackground[] = {0.667,0.714,0.635,1}; 
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
				h = 0.030 * safezoneH
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
				h = 0.030 * safezoneH
			}; 					
		}; 
	}; 
	class reinforcementsControlGroup:RscControlsGroup
	{
		idc = 2401;
		x = 0.508 * safezoneW + safezoneX;
		y = 0.365 * safezoneH + safezoneY;
		w = 0.2325 * safezoneW;
		h = (0.32 * safezoneH)

		class Controls
		{
			class statText: RscStructuredText
			{
				idc = 2402;
				colorText[] = {1,1,1,1};
				colorBackground[] = {0.667,0.714,0.635,1};
				shadow = 0.75;
				size = 0.037;
				x = 0;
				y = 0;
				w = 0.2325 * safezoneW;
				h = (0.32 * safezoneH)-(0.05 * safezoneH);
				onMouseButtonDown = "";
				onMouseButtonUp = "";
				onMouseZChanged = "";
				text = "";
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
 