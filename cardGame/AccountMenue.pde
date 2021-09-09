class AccountMenue
{
  Button menueBt, loginBt, logOutBt;
  
  AccountMenue()
  {
    menueBt = new Button(0, 0, width/30, height/20, #1025FF, "<-", 0);
    loginBt = new Button(width/2-width/10, height/2, width/5, height/10, #1025FF, "Login", 0);
    logOutBt = new Button(width/2-width/10, height/2+height/5, width/5, height/10, #1025FF, "Logout", 0);
  }
  
  void draw()
  {
    background(screenNeutralImg);
    
    menueBt.draw();
    if(data.logedIn)
    { logOutBt.draw(); }
    else
    { loginBt.draw(); }
    
    if(menueBt.mouseOver()) //if the mouse is over one of the buttons
    {
      menueBt.highlight();
      cursorChange = 12;
    }
    else if(loginBt.mouseOver() && data.logedIn == false)
    {
      loginBt.highlight();
      cursorChange = 12;
    }
    else if(logOutBt.mouseOver() && data.logedIn)
    {
      logOutBt.highlight();
      cursorChange = 12;
    }
  }
  
  void mousePressed()
  {
    if(menueBt.mouseOver())
    {
      changeMode = 0;
    }
    else if(loginBt.mouseOver() && data.logedIn == false)
    {
      fM.account.add("Test");
      fM.account.add("music");
      fM.save(fM.account, "settings/account.eck");
      changeMode = 0;
    }
    else if(logOutBt.mouseOver() && data.logedIn)
    {
      fM.account.clear();
      fM.save(fM.account, "settings/account.eck");
      changeMode = 0;
    }
  }
}
