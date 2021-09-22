class InGameMenue
{
  Button menueBt, backBt;
  
  InGameMenue()
  {
    menueBt = new Button(width/3, height/6, width/3, height/6, data.getBasicPrimaryColor(), "Hauptmenü", 0);
    backBt = new Button(width/3, height/2, width/3, height/6, data.getBasicPrimaryColor(), "weiter Spielen", 0);
  }
  
  void refresh()
  {
    this.menueBt.col = data.getBasicPrimaryColor();
    this.backBt.col = data.getBasicPrimaryColor();
  }
  
  void draw()
  {
    image(data.getBg(), 0, 0, width, height);
    
    menueBt.draw();
    backBt.draw();
  }
  
  void mousePressed()
  {
    if(menueBt.mouseOver())
    { changeMode = 0; }
    else if(backBt.mouseOver())
    { changeMode = 1; }
  }
}
