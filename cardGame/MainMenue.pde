class MainMenue
{
  Button playBt, accountBt;

  MainMenue()
  {
    playBt = new Button(width/2-width/10, height/2-height/10, width/5, height/10, #1025FF, "PLAY", 0);
    accountBt = new Button(width/2-width/10, height/2-height/20, width/5, height/10, #1025FF, "My account", 0);

    createError("Account logged out");
  }

  void draw()
  {
    this.accountBt.draw();
    if(this.accountBt.mouseOver())
    {
      this.accountBt.highlight();
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
      play();
    }
    else if(this.accountBt.mouseOver())
    {
      loadingScreen.draw();
      //todo account settings
    }
  }
}
