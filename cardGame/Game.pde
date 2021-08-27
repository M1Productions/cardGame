class Game
{
  int round;
  Button menueBt;
  ImageButton deckIBt, dumpingGroundIBt;

  Game()
  {
    this.round = 0;
    player1.setEnergy(0);
    player2.setEnergy(0);
    
    menueBt = new Button(0, 0, width/30, height/20, #1025FF, "<-", 0);
    deckIBt = new ImageButton(0, height/3-height/12, width/20, height/6, cardBackImg);
    dumpingGroundIBt = new ImageButton(width-width/10, height/3-height/30, width/10, height/15, dumpingGroundImg);
  }

  void draw()
  {
    stroke(50);
    strokeWeight(height/60);
    estetics.dashline(0, height/3, width, height/3, 7, 7);
    
    menueBt.draw();
    if(menueBt.mouseOver())
    {
      menueBt.highlight();
      cursorChange = 12;
    }

    deckIBt.draw();
    if(deckIBt.mouseOver())
    {
      deckIBt.highlight();
      cursorChange = 12;
    }

    dumpingGroundIBt.draw();
    if(dumpingGroundIBt.mouseOver())
    { cursorChange = 1; }
    
    this.drawEnergyBar();
  }

  void mousePressed()
  {
    if(menueBt.mouseOver())
    { mode = 0; }
  }
  
  void drawEnergyBar() //todo
  {/*
    stroke(255);
    strokeWeight(height/30);
    for(int i=0; i<10; i++)
    {
      if(i < player1.getEnergy())
      { fill(#80FFD1); }
      else
      { fill(100); }
    }*/
  }
}
