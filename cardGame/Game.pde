class Game
{
  Button menueBt;
  ImageButton deckIBt, dumpingGroundIBt;

  Game()
  {
    menueBt = new Button(width/2-width/60, 0, width/30, height/20, #1025FF, "<-", 0);
    deckIBt = new ImageButton(0, 0, width/20, height/6, cardBackImg);
    dumpingGroundIBt = new ImageButton(width-width/10, 0, width/10, height/15, dumpingGroundImg);
  }

  void draw()
  {
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
    { cursorChange = 2; }
  }

  void mousePressed()
  {
    if(menueBt.mouseOver())
    { mode = 0; }
  }
}
