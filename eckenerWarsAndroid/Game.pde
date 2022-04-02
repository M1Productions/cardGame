class Game
{
  int round, energy, lifes, performAction;
  boolean drawReady=true;
  
  PImage frame;
  
  Card zoomedCd = new Card(0, height/4, height/4*3, 0, 0, 0, "");
  Card markedCd;
  
  Button menueBt, roundBt, editBt, moveBt, backBt;
  ImageButton deckIBt, dumpingGroundIBt;
  
  ArrayList <Card> deck = new ArrayList <Card>();
  ArrayList <Card> table = new ArrayList <Card>();
  ArrayList <Card> deadCards = new ArrayList <Card>();
  ArrayList <Card> hand = new ArrayList <Card>();

  Game()
  {
    this.zoomedCd.fwd = false;
    
    this.frame = data.getFrame();
    
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
    
    for(int i=0; i<9; i++)
    { this.drawRandomCard(); }
  }

  void draw()
  {
    image(screenNeutralImg,0,0,width,height);
    image(this.frame,0,0,width,height);
    
    this.zoomedCd.draw();
    if(this.zoomedCd.fwd)
    {
      moveBt.draw();
      backBt.draw();
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
    
    for(Card c : this.hand)
    { c.draw();}
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

  void mousePressed()
  {
    if(this.menueBt.mouseOver())
    { changeMode = 4;}
    else if(this.roundBt.mouseOver())
    { this.nextRound(); }
    else if(this.backBt.mouseOver() && this.zoomedCd.fwd)
    { this.zoomedCd.fwd = false; }
    else if(this.moveBt.mouseOver() && this.zoomedCd.fwd)
    {
      if(this.performAction == 1)
      {
        this.layDownCard(this.markedCd);
        this.performAction = 2;
      }
      else if(this.performAction == 2)
      {
        this.killCard(this.markedCd);
        this.performAction = 3;
      }
      else if(this.performAction == 3)
      {
        this.playCard(this.deadCards.get(this.deadCards.size()-1));
        this.deadCards.remove(this.deadCards.size()-1);
        this.performAction = 2;
      }
      else
      { createError("ERROR : 2 : "+this.performAction); }
    }
    else if(this.editBt.mouseOver())
    { changeMode = 6; }
    else if(this.deckIBt.mouseOver() && this.deck.size() > 0)
    { this.drawCard(); }
    else if(this.dumpingGroundIBt.mouseOver() && this.deadCards.size() > 0)
    { this.setZoomedCard(this.deadCards.get(this.deadCards.size()-1), 2); }
    else if(this.cardListMouseOver(this.hand))
    { this.setZoomedCard(this.cardListCardMouseOver(this.hand), 1); }
    else if(this.cardListMouseOver(this.table))
    { this.setZoomedCard(this.cardListCardMouseOver(this.table), 2); }
  }
  
  void nextRound()
  {
    this.round++;
    if(this.round > 10)
    { this.energy = 10; }
    else
    { this.energy = this.round; }
    this.drawReady = true;
    this.zoomedCd.fwd = false;
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
    this.setZoomedCard(this.deck.get(rand), 1);
    this.giveCard(this.deck.get(rand));
    this.deck.remove(rand);
  }
  
  boolean layDownCard(Card c)
  {
    if(c.cost <= this.energy)
    {
      this.energy -= c.cost;
      this.playCard(c);
      this.hand.remove(c);
      cardSnd.play();
      spreadOutCards(this.hand, width/4, width/4*3, height/5*4);
      return true;
    }
    else
    { createError("Nicht genug Energie"); }
    return false;
  }
  void playCard(Card c)
  {
    c.changeSize(height/4);
    this.table.add(c);
    spreadOutCards(this.table, width/4, width/4*3, height/7);
  }
  
  void killCard(Card c)
  {
    this.deadCards.add(c);
    this.table.remove(c);
    spreadOutCards(this.table, width/4, width/4*3, height/7);
  }
  
  void giveCard(Card c)
  {
    c.changeSize(height/5);
    this.hand.add(c);
    spreadOutCards(this.hand, width/4, width/4*3, height/5*4);
  }
  
  boolean cardListMouseOver(ArrayList <Card> arc)
  {
    for(int i=arc.size()-1; i>=0; i--) //going backwoards because then the cards displayed on top of all other cards are chosen first
    {
      if(arc.get(i).mouseOver())
      { return true; }
    }
    return false;
  }
  Card cardListCardMouseOver(ArrayList <Card> arc) //only do if cardListMouseOver == true
  {
    for(int i=arc.size()-1; i>=0; i--)
    {
      if(arc.get(i).mouseOver())
      { return arc.get(i); }
    }
    return this.markedCd;
  }
  
  void setZoomedCard(Card c, int act)
  {
    this.zoomedCd.fwd = true;
    this.performAction = act;
    this.markedCd = c;
    this.zoomedCd.atk = c.atk;
    this.zoomedCd.dfp = c.dfp;
    this.zoomedCd.cost = c.cost;
    this.zoomedCd.name = c.name;
  }
}
