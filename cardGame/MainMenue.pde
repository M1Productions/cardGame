class MainMenue
{
  Button playBt, settingsBt;
  ImageButton accountIBt;

  MainMenue()
  {
    accountIBt = new ImageButton(width/2-width/10, 0, width/5, width/5, accountImg);
    
    playBt = new Button(width/2-width/10, height/2, width/5, height/10, #1025FF, "PLAY", 0);
    settingsBt = new Button(width/2-width/10, height/2+height/5, width/5, height/10, #1025FF, "Settings", 0);

    createError("Account logged out");
  }

  void draw()
  {
    this.accountIBt.draw();
    if(this.accountIBt.mouseOver())
    {
      this.accountIBt.highlight();
      cursorChange=12;
    }

    this.settingsBt.draw();
    if(this.settingsBt.mouseOver())
    {
      this.settingsBt.highlight();
      cursorChange=12;
    }

    this.playBt.draw();
    if(this.playBt.mouseOver())
    {
      this.playBt.highlight();
      cursorChange=12;
    }
  }

  void mousePressed()
  {
    if(this.playBt.mouseOver())
    {
      loadingScreen.draw();
      play = true;
    }
    else if(this.settingsBt.mouseOver())
    {
      loadingScreen.draw();
      openSettings();
    }
    else if(this.accountIBt.mouseOver())
    {
      loadingScreen.draw();
      openAccountMenue();
    }
  }
}
