class MainMenue
{
  Button playBt, settingsBt;
  ImageButton accountIBt;

  MainMenue()
  {
    playBt = new Button(width/2-width/10, height/3, width/5, height/10, #1025FF, "PLAY", 0);
    settingsBt = new Button(width/2-width/10, height/3*2, width/5, height/10, #1025FF, "Settings", 0);
    accountIBt = new ImageButton(width/2-width/10, 0, width/5, width/5, accountImg);

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
