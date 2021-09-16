class data //this class contains all information that is saved in a file
{
  //a -> account
  //s -> setting
  String team=""; //team: music/cake
  float musicVolume=100, sfxVolume=100;
  boolean logedIn;
  
  void load()
  {
    fM.load("settings.eck");
    fM.readSettings();
    
    this.loadAcc();
  }
  void loadAcc()
  {
    fM.load("account.eck");
    fM.readAccount();
  }
  
  PImage getBg()
  {
    if(this.team.equals("music"))
    { return screenMusicCleanImg; }
    else if(this.team.equals("cake"))
    { return screenCakeCleanImg; }
    
    return screenNeutralImg;
  }
  PImage getTeamImage()
  {
    if(this.team.equals("music"))
    { return musicImg; }
    else if(this.team.equals("cake"))
    { return cakeImg; }
    
    return accountDefaultImg;
  }
}
