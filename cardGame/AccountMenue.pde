class AccountMenue
{
  Button menueBt;
  ImageButton cakeIBt, musicIBt;
  PImage img;
  
  AccountMenue()
  {
    menueBt = new Button(0, 0, width/30, height/20, #1025FF, "<-", 0);
    cakeIBt = new ImageButton(width/7*2, height/2, width/7, height/5, cakeImg);
    musicIBt = new ImageButton(width/7*5, height/2, width/7, height/5, musicImg);
  }
  
  void refresh()
  {
    this.img = data.getBg();
  }
  
  void draw()
  {
    background(this.img);
    
    menueBt.draw();
    cakeIBt.draw();
    musicIBt.draw();
    
    if(menueBt.mouseOver()) //if the mouse is over one of the buttons
    {
      menueBt.highlight();
      cursorChange = 12;
    }
  }
  
  void mousePressed()
  {
    if(menueBt.mouseOver())
    {
      changeMode = 0;
    }
    else if(true)
    {
      
    }
  }
}
