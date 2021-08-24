class AccountMenue
{
  Button menueBt;
  
  AccountMenue()
  {
    menueBt = new Button(width/2-width/60, 0, width/30, height/20, #1025FF, "<-", 0);
  }
  
  void draw()
  {
    menueBt.draw();
    if(menueBt.mouseOver())
    {
      menueBt.highlight();
      cursorChange = 12;
    }
  }
  
  void mousePressed()
  {
    if(menueBt.mouseOver())
    { mode = 0; }
  }
}
