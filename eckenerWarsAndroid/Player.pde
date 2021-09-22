class Player
{
  int energy=0;
  ArrayList <Card> hand = new ArrayList <Card>();

  Player()
  {}
  
  void drawHand()
  {
    if(this.hand.size() > 0)
    {
      for(Card c : this.hand)
      { c.draw();}
    }
  }
  
  void setEnergy(int energy)
  { this.energy = energy; }
  int getEnergy()
  { return this.energy; }
  
  void giveCard(Card c)
  {
    c.changeSize(height/5);
    this.hand.add(c);
    this.spaceOutCards();
  }
  boolean playCard()
  {
    for(int i=this.hand.size()-1; i>=0; i--) //going backwoards because then the cards displayed on top of all other cards are chosen first
    {
      if(this.hand.get(i).mouseOver())
      {
        game.playCard(this.hand.get(i), this);
        this.hand.remove(i);
        //cardSnd.play();
        return true;
      }
    }
    return false;
  }
  
  void spaceOutCards()
  {
    Card cd;
    for(int i=1; i<=this.hand.size();i++)
    {
      cd = this.hand.get(i-1);
      cd.setPosition((width/3*2)/(this.hand.size()+i+1), height/5*4);
    }
  }
}
