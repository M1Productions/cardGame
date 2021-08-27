class Card
{
  int x, y, w, h;
  int atk, dfp, cost;
  color col;
  boolean fwd = true;
  String name = "";
  //String[] properties; //todo give every card properties like  Bündnis mit Tiaratanist

  Card(int x, int y, int w, int h, int atk, int dfp, int cost, String name)
  {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.atk = atk;
    this.dfp = dfp;
    this.cost = cost;
    this.name = name;

    if(this.cost == 10)
    { this.col = #FFC230; }
    else
    { this.col = #975F62; }
  }

  void draw()
  {
    if(this.fwd) //todo draw the text on the card
    {
      strokeWeight(this.w/10);
      stroke(255);
      fill(this.col);
      rect(this.x, this.y, this.w, this.h);
      
      image(bombImg, this.x, this.y+this.h/2, this.w/5, this.w/5);
      image(shieldImg, this.x+this.w/5*4, this.y+this.h/2, this.w/5, this.w/5);
    }
    else
    { image(cardBackImg, this.x, this.y, this.w, this.h); }
  }
  
  void setPosition(int x, int y)
  {
    this.x = x;
    this.y = y;
  }
}
