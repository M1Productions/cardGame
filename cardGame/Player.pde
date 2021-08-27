class Player
{
  int nr, energy;

  Player(int nr, int energy)
  {
    this.nr = nr;
    this.energy = energy;
  }
  
  void setEnergy(int energy)
  { this.energy = energy; }
  int getEnergy()
  { return this.energy; }
}
