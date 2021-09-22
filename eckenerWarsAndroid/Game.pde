class Game
{
  int round;
  Button menueBt, roundBt;
  ImageButton deckIBt, dumpingGroundIBt;
  
  ArrayList <Card> deck = new ArrayList <Card>();
  ArrayList <Card> table = new ArrayList <Card>();

  Game()
  {
    this.round = 0;
    player.setEnergy(this.round);
    
    menueBt = new Button(width/2-width/30, 0, width/15, height/20, data.getBasicPrimaryColor(), "Menü", 0);
    roundBt = new Button(width/2-width/30, height/18, width/15, height/20, data.getBasicPrimaryColor(), "Runde", 0);
    
    deckIBt = new ImageButton(width/33*25, height/60, width/4, height/4, cardBackImg);
    dumpingGroundIBt = new ImageButton(width/33, height/60, width/4, height/4, dumpingGroundImg);
    
    this.deck.add(new Card( 0, height/3-height/14, height/7, 5, 6, 10, "Char1"));
    this.deck.add(new Card( 0, height/3-height/14, height/7, 6, 6, 10, "Char2"));
  }

  void draw()
  {
    image(screenNeutralImg,0,0,width,height);
    image(frameMusicImg,0,0,width,height);
    
    stroke(50);
    strokeWeight(height/200);
    
    menueBt.draw();
    roundBt.draw();
    deckIBt.draw();
    dumpingGroundIBt.draw();
    
    this.drawEnergyBar();
    
    player.drawHand();
  
    for(Card c : this.table)
    { c.draw(); }
  }

  void mousePressed()
  {
    if(menueBt.mouseOver())
    { changeMode = 4;}
    else if(roundBt.mouseOver()) //todo
    {  }
    else if(deckIBt.mouseOver() && this.deck.size() > 0)
    {
      this.giveRandomCard(player);
      //cardSnd.play();
    }
    else if(player.playCard())
    {}
    else
    { this.killCard(); }
  }
  
  void giveRandomCard(Player p)
  {
    int rand = int(random(0,this.deck.size()-1));
    p.giveCard(this.deck.get(rand));
    this.deck.remove(rand);
  }
  
  void playCard(Card c, Player p)
  {
    c.changeSize(height/4);
    this.table.add(c);
    this.spaceOutCards();
  }
  
  void killCard()
  {
    if(this.table.size() > 0)
    {
      for(int i=0; i<this.table.size(); i++)
      {
        if(this.table.get(i).mouseOver())
        {
          this.table.remove(i);
          this.spaceOutCards();
          break;
        }
      }
    }
  }
  
  void drawEnergyBar()
  {
    strokeWeight(height/20);
    stroke(data.getBasicPrimaryColor());
    
    if(player.energy == 0)
    { rect(width/6*4, height/5*4, width/6, height/7); }
    else
    {
      for(int i=0; i<this.round; i++)
      { rect(width/7*5+((width/6)/this.round)*i, height/5*4, (width/6)/this.round, height/7); }
    }
  }
  
  void spaceOutCards()
  {
    Card c;
    for(int i=1; i<=this.table.size(); i++)
    {
      c = this.table.get(i-1);
      c.setPosition(width/(this.table.size()+1)*i, height/7);
    }
  }
}
