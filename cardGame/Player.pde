class Player
{
  int nr, energy;
  ArrayList <Card> hand = new ArrayList <Card>();

  Player(int nr, int energy)
  {
    this.nr = nr;
    this.energy = energy;
  }
  
  void setEnergy(int energy)
  { this.energy = energy; }
  int getEnergy()
  { return this.energy; }
  
  void giveCard(Card c)
  { this.hand.add(c); }
}
