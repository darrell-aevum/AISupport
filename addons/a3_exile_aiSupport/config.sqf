	AIS_HQCallSign									= "Zues 7";
	AIS_Side										= INDEPENDENT;
	AIS_MaxActiveTimeForVehicles					= 900;
	/////////////////////////////
	//  Fire Mission Settings  //
	/////////////////////////////
	//Support Levesl: ["Level", "MinRespect", "Cost", "Seconds of Support", "Number of Rounds Fired", "Impact Radius (m)"]	
	AIS_FireMission_SupportLevels = [
									[1, 500, 5000, 200, 4, 60], 
									[2, 1000, 8000, 300, 45], 
									[3, 20000, 12000, 400, 25], 
									[4, 30000, 15000, 500, 10] 
								];
	AIS_FireMission_TeamMinResetTime				= 20;
	AIS_FireMission_TeamMaxResetTime				= 120;
	AIS_FireMission_TeamRandResetTime				= true;
	AIS_FireMission_TeamResetTime					= 45;		//Only if AIS_FireMission_TeamRandResetTime = false

	//////////////////////////// 
 	//  Air Support Settings  //
	////////////////////////////	
	//Support Levesl: ["Level", "MinRespect", "Cost", "Seconds of Support", "Unit's Skill Level (0-1)"]	
	AIS_AirSupport_SupportLevels = [
									[1, 500, 5000, 200, .2], 
									[2, 1000, 8000, 300, .4], 
									[3, 20000, 12000, 400, .6], 
									[4, 30000, 15000, 500, .8] 
								];

	//////////////////////////////
 	//  Reinforcement Settings  //
	//////////////////////////////
	//Support Levesl: ["Level", "MinRespect", "Cost", "Number of Support Troops", "Support Troop Skill Level (0-1)"]	
	AIS_Reinforcements_SupportLevels = [
									[1, 500, 5000, 2, .2], 
									[2, 1000, 8000, 4, .4], 
									[3, 20000, 12000, 5, .6], 
									[4, 30000, 15000, 6, .8]
								];