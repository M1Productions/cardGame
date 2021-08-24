class Game
{
  ImageButton deckBt;

  Game()
  {
    deckBt = new ImageButton(width/50, height/6, width/20, height/6*2, cardBackImg);
  }

  void draw()
  {
    deckBt.draw();
  }

  void mousePressed()
  {
  }
}
