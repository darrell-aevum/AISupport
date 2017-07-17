AIS_Apps_Reinforcements_ConfirmMission = { 
    disableSerialization;    
    systemchat('confirmed');
  _engineer = (group player) createUnit ["B_engineer_F", getPos player, [], 0, "NONE"];     
};