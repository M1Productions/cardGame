class Card
{
  int x, y, w, h;
  int atk, dfp, cost;
  color col;
  boolean fwd = true;
  //String[] properties; //todo give every card properties like ...ist nicht effektiv

  Card(int x, int y, int w, int h, int atk, int dfp, int cost)
  {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.atk = atk;
    this.dfp = dfp;
    this.cost = cost;

    if(this.cost == 10)
    { this.col = #D8B06B; }
    else
    { this.col = #975F62; }
  }

  void draw()
  {
    if(this.fwd) //can't we just make e pfoto for every card??
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
}
