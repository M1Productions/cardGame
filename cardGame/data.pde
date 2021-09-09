class data //this class contains all information that is saved in a file
{
  //a -> account
  //s -> setting
  String aName="", team=""; //team: music/cake
  float musicVolume=100, sfxVolume=100;
  boolean logedIn;
  
  void load()
  {
    fM.load("settings/settings.eck");
    fM.readSettings();
    
    this.loadAcc();
  }
  void loadAcc()
  {
    fM.load("settings/account.eck");
    fM.readAccount();
  }
}
