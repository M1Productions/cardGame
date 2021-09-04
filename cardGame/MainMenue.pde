class MainMenue
{
  Button quitBt;
  ImageButton accountIBt, playIBt, settingsIBt;

  MainMenue()
  {
    quitBt = new Button(width-width/15-height/15/12, 0+height/15/12, width/15, height/15, #FF1A2A, "X", 0);
    
    accountIBt = new ImageButton(width/2-width/16, 0, width/8, width/8, accountImg);
    playIBt = new ImageButton(width/2-181, 220, 357, 363, playButtonImg);
    settingsIBt = new ImageButton(width/2-125, 588, 239, 210, settingsButtonImg);

    createError("Account logged out");
  }

  void draw()
  {
    background(homeScreenImg);
    
    this.accountIBt.draw();
    this.settingsIBt.draw();
    this.playIBt.draw();
    this.quitBt.draw();
    
    if(this.accountIBt.mouseOver())
    {
      this.accountIBt.highlight();
      cursorChange=12;
    }
    else if(this.settingsIBt.mouseOver())
    {
      this.settingsIBt.highlight();
      cursorChange=12;
    }
    else if(this.playIBt.mouseOver())
    {
      this.playIBt.highlight();
      cursorChange=12;
    }
    else if(this.quitBt.mouseOver())
    {
      this.quitBt.highlight();
      cursorChange=12;
    }
  }

  void mousePressed()
  {
    if(this.playIBt.mouseOver())
    {
      loadingScreen.draw();
      play = true;
    }
    else if(this.settingsIBt.mouseOver())
    {
      loadingScreen.draw();
      openSettings();
    }
    else if(this.accountIBt.mouseOver())
    {
      loadingScreen.draw();
      openAccountMenue();
    }
    else if(this.quitBt.mouseOver())
    { exit(); }
  }
}
