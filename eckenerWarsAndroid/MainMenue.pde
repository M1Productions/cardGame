class MainMenue
{
  Button quitBt;
  ImageButton accountIBt, playIBt, settingsIBt;

  MainMenue()
  {
    quitBt = new Button(width-width/15-height/15/12, 0+height/15/12, width/15, height/15, #FF1A2A, "X", 0);
    
    accountIBt = new ImageButton(width/2-width/16, 0, height/6, height/6, data.getTeamImage());
    playIBt = new ImageButton(int(width/2.7), int(height/4.4), int(width/3.5), int(height/2.8), playButtonImg);
    settingsIBt = new ImageButton(int(width/2.5), int(height/1.7), int(width/5.3), height/6, settingsButtonImg);
  }
  
  void refresh()
  {
    this.accountIBt.image = data.getTeamImage();
  }

  void draw()
  {
    image(homeScreenImg,0,0,width,height);
    
    this.accountIBt.draw();
    this.settingsIBt.draw();
    this.playIBt.draw();
    this.quitBt.draw();
  }

  void mousePressed()
  {
    if(this.playIBt.mouseOver())
    {
      loadingScreen.draw();
      changeMode = 1;
    }
    else if(this.settingsIBt.mouseOver())
    {
      loadingScreen.draw();
      changeMode = 2;
    }
    else if(this.accountIBt.mouseOver())
    {
      loadingScreen.draw();
      changeMode = 3;
    }
    else if(this.quitBt.mouseOver())
    { exit(); }
  }
}
