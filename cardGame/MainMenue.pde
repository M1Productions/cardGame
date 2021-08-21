class MainMenue
{
  Button playBt;
  
  MainMenue()
  {
    playBt = new Button(width/2-width/10, height/2-height/20, width/5, height/10, #1025FF, "PLAY", 0);
  }
  
  void draw()
  {
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
      play=true;
    }
  }
}
