class AccountMenue
{
  Button menueBt, loginBt, logOutBt;
  
  AccountMenue()
  {
    menueBt = new Button(width/2-width/60, 0, width/30, height/20, #1025FF, "<-", 0);
    loginBt = new Button(width/2-width/10, height/2, width/5, height/10, #1025FF, "Login", 0);
    logOutBt = new Button(width/2-width/10, height/2+height/5, width/5, height/10, #1025FF, "Logout", 0);
  }
  
  void draw()
  {
    menueBt.draw();    
    loginBt.draw();
    logOutBt.draw();
    
    if(menueBt.mouseOver()) //if the mouse is over one of the buttons
    {
      menueBt.highlight();
      cursorChange = 12;
    }
    else if(loginBt.mouseOver())
    {
      loginBt.highlight();
      cursorChange = 12;
    }
    else if(logOutBt.mouseOver())
    {
      logOutBt.highlight();
      cursorChange = 12;
    }
  }
  
  void mousePressed()
  {
    if(menueBt.mouseOver())
    { mode = 0; }
    else if(loginBt.mouseOver())
    { createError("Currently not available!"); }
    else if(logOutBt.mouseOver())
    { createError("Log in first!"); }
  }
}
