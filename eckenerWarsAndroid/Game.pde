class Game
{
  int round;
  Button menueBt;
  ImageButton deckIBt, dumpingGroundIBt;
  
  ArrayList <Card> deck = new ArrayList <Card>();
  ArrayList <Card> table = new ArrayList <Card>();

  Game()
  {
    this.round = 0;
    player1.setEnergy(0);
    player2.setEnergy(0);
    
    menueBt = new Button(width/2-width/60, 0, width/30, height/20, #1025FF, "<-", 0);
    
    deckIBt = new ImageButton(width/33*25, height/60, width/4, height/4, cardBackImg);
    dumpingGroundIBt = new ImageButton(width/33, height/60, width/4, height/4, dumpingGroundImg);
    
    this.deck.add(new Card( 0, height/3-height/14, height/7, 5, 6, 10, "Tiara"));
    this.deck.add(new Card( 0, height/3-height/14, height/7, 6, 6, 10, "David"));
  }

  void draw()
  {
    image(screenNeutralImg,0,0,width,height);
    image(frameMusicImg,0,0,width,height);
    
    stroke(50);
    strokeWeight(height/200);
    
    menueBt.draw();
    deckIBt.draw();
    dumpingGroundIBt.draw();
    
    this.drawEnergyBar();
    
    player1.drawHand();
  
    for(Card c : this.table)
    { c.draw(); }
  }

  void mousePressed()
  {
    if(menueBt.mouseOver())
    { changeMode = 0;}
    else if(deckIBt.mouseOver() && this.deck.size() > 0)
    {
      this.giveRandomCard(player1);
      //cardSnd.play();
    }
    else
    { player1.playCard(); }
  }
  
  void giveRandomCard(Player p)
  {
    int rand = int(random(0,this.deck.size()-1));
    p.giveCard(this.deck.get(rand));
    this.deck.remove(rand);
  }
  
  void playCard(Card c, Player p)
  {
    if(p == player1)
    { c.setPosition(width/2, height/2); }
    else
    { c.setPosition(width/2, height/3); }
    c.changeSize(height/7);
    this.table.add(c);
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
