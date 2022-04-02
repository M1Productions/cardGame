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
  
  void saveAcc()
  {
    String[] accData = new String[1];
    accData[0] = this.team;
    fM.fileSave(accData, "account.eck");
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
  PImage getFrame()
  {
    if(this.team.equals("music"))
    { return frameMusicImg; }
    else if(this.team.equals("cake"))
    { return frameCakeImg; }
    
    return accountDefaultImg;
  }
  
  color getBasicPrimaryColor()
  {
    if(this.team.equals("cake"))
    { return #E0735F; }
    else if(this.team.equals("music"))
    { return #699480; }
    else
    { return #845B55; }
  }
  color getBasicSecondaryColor()
  {
    if(this.team.equals("cake"))
    { return #E59890; }
    else if(this.team.equals("music"))
    { return #84A48C; }
    else
    { return #F8EEE5; }
  }
}
