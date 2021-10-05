class Game
{
  int round, energy, lifes;
  boolean drawReady=true;
  
  Card zoomedCd;
  
  Button menueBt, roundBt, editBt, moveBt, backBt;
  ImageButton deckIBt, dumpingGroundIBt;
  
  ArrayList <Card> deck = new ArrayList <Card>();
  ArrayList <Card> table = new ArrayList <Card>();
  ArrayList <Card> deadCards = new ArrayList <Card>();
  ArrayList <Card> hand = new ArrayList <Card>();

  Game()
  {
    this.round = 1;
    this.energy = 1;
    this.lifes = 15;
    
    moveBt = new Button(width/4-width/10, height/4+height/15, width/10, height/15, data.getBasicPrimaryColor(), "Spielen", 0);
    backBt = new Button(width/30, height/4+height/15, width/20, height/15, data.getBasicPrimaryColor(), "X", 0);
    menueBt = new Button(width/3-width/20, height/18, width/10, height/15, data.getBasicPrimaryColor(), "Menu", 0);
    roundBt = new Button(width/3*2-width/20, height/18, width/10, height/15, data.getBasicPrimaryColor(), "Runde", 0);
    editBt = new Button(width/5*4, height/2, width/10, height/15, data.getBasicPrimaryColor(), "Andern", 0);
    
    deckIBt = new ImageButton(width/4*3, 0, width/4, height/4, cardBackImg);
    dumpingGroundIBt = new ImageButton(0, 0, width/4, height/4, dumpingGroundImg);
    
    this.deck = getAllCards();
  }

  void draw()
  {
    image(screenNeutralImg,0,0,width,height);
    image(data.getFrame(),0,0,width,height);
    
    if(this.zoomedCd == null)
    { image(cardBackImg, 0, height/4, width/4, width/4*1.4); }
    else
    {
      moveBt.draw();
      backBt.draw();
      this.zoomedCd.draw();
    }
    
    menueBt.draw();
    roundBt.draw();
    editBt.draw();
    if(this.deck.size() > 0)
    { deckIBt.draw(); }
    if(this.deadCards.size() > 0)
    { dumpingGroundIBt.draw(); }
    
    this.drawGameInfo();
    
    for(Card c : this.table)
    { c.draw(); }
    
    this.drawHand();
  }

  void mousePressed()
  {
    if(this.menueBt.mouseOver())
    { changeMode = 4;}
    else if(this.roundBt.mouseOver())
    { this.nextRound(); }
    else if(this.backBt.mouseOver())
    { this.zoomedCd = null; }
    else if(this.moveBt.mouseOver()) //todo
    {}
    else if(this.editBt.mouseOver())
    { changeMode = 6; }
    else if(this.deckIBt.mouseOver() && this.deck.size() > 0)
    { this.drawCard(); }
    else if(this.dumpingGroundIBt.mouseOver())
    {
      if(this.deadCards.size() > 0)
      {
        this.playCard(this.deadCards.get(this.deadCards.size()-1));
        this.deadCards.remove(this.deadCards.size()-1);
      }
    }
    else if(this.playCard())
    { /*Things are allready done*/ }
    else
    { this.killCard(); }
  }
  
  void nextRound()
  {
    this.round++;
    this.energy = this.round;
    this.drawReady = true;
    if(this.energy > 10)
    { this.energy = 10; }
  }
  
  void drawCard()
  {
    if(this.drawReady)
    {
      this.drawReady = false;
      this.drawRandomCard();
      cardSnd.play();
    }
    else
    { createError("Du hast diese Runde bereits eine Karte gezogen"); }
  }
  
  void drawRandomCard()
  {
    int rand = int(random(0,this.deck.size()-1));
    this.setZoomedCard(this.deck.get(rand));
    this.giveCard(this.deck.get(rand));
    this.deck.remove(rand);
  }
  
  void playCard(Card c)
  {
    c.changeSize(height/4);
    this.table.add(c);
    spreadOutCards(this.table, width/4, width/4*3, height/7);
  }
  
  void killCard()
  {
    if(this.table.size() > 0)
    {
      for(int i=0; i<this.table.size(); i++)
      {
        if(this.table.get(i).mouseOver())
        {
          this.deadCards.add(this.table.get(i));
          this.table.remove(i);
          spreadOutCards(this.table, width/4, width/4*3, height/7);
          break;
        }
      }
    }
  }
  
  void drawGameInfo()
  {
    fill(data.getBasicSecondaryColor());
    textAlign(LEFT,CENTER);
    textSize(height/15);
    text("Runde: "+this.round, width/4*3, height/10*7);
    text("Energie: "+this.energy, width/4*3, height/5*4);
    text("Leben: "+this.lifes, width/4*3, height/10*9);
    /*strokeWeight(height/30);
    stroke(data.getBasicPrimaryColor());
    
    if(player.energy == 0)
    { rect(width/6*4, height/5*4, width/6, height/7); }
    else
    {
      for(int i=0; i<this.round; i++)
      { rect(width/7*5+((width/6)/this.round)*i, height/5*4, (width/6)/this.round, height/7); }
    }*/
  }
  
  void drawHand()
  {
    if(this.hand.size() > 0)
    {
      for(Card c : this.hand)
      { c.draw();}
    }
  }
  
  void giveCard(Card c)
  {
    c.changeSize(height/5);
    this.hand.add(c);
    spreadOutCards(this.hand, width/4, width/4*3, height/5*4);
  }
  
  boolean playCard()
  {
    for(int i=this.hand.size()-1; i>=0; i--) //going backwoards because then the cards displayed on top of all other cards are chosen first
    {
      if(this.hand.get(i).mouseOver())
      {
        if(this.hand.get(i).cost <= this.energy)
        {
          this.energy -= this.hand.get(i).cost;
          game.playCard(this.hand.get(i));
          this.hand.remove(i);
          cardSnd.play();
          spreadOutCards(this.hand, width/4, width/4*3, height/5*4);
          return true;
        }
        else
        { createError("Nicht genug Energie"); }
      }
    }
    return false;
  }
  
  void setZoomedCard(Card c)
  {
    this.zoomedCd = c;
    this.zoomedCd.setPosition(0, height/4);
    this.zoomedCd.changeSize(height/4*3);
  }
}
