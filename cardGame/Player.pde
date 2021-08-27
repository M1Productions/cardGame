class Player
{
  int nr, energy;
  ArrayList <Card> hand = new ArrayList <Card>();

  Player(int nr, int energy)
  {
    this.nr = nr;
    this.energy = energy;
  }
  
  void drawHand()
  {
    if(this.hand.size() > 0)
    {
      int i=0;
      for(Card c : this.hand)
      { c.draw(); i++;}
      //println(i);
    }
  }
  
  void setEnergy(int energy)
  { this.energy = energy; }
  int getEnergy()
  { return this.energy; }
  
  void giveCard(Card c)
  {
    this.hand.add(c);
    Card cd;
    for(int i=0; i<this.hand.size();i++)
    {
      cd = this.hand.get(i);
      cd.setPosition((width/3*2)/( this.hand.size()+i ), height/5*4); //does not work?
    }
  }
}
