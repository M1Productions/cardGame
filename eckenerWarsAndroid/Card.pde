class Card
{
  int x, y, w, h;
  int atk, dfp, cost;
  color col;
  boolean fwd = true;
  String name = "";
  //String[] properties; //todo give every card properties like  Bündnis mit Tiaratanist

  Card(int x, int y, int h, int atk, int dfp, int cost, String name)
  {
    this.x = x;
    this.y = y;
    this.h = h;
    this.atk = atk;
    this.dfp = dfp;
    this.cost = cost;
    this.name = name;
    
    this.w = int(this.h/1.4);

    if(this.cost == 10)
    { this.col = #FFC230; }
    else
    { this.col = #975F62; }
  }

  void draw()
  {
    if(this.fwd)
    {
      image(cardFrontImg, this.x, this.y, this.w, this.h);
      
      fill(0);
      textAlign(CENTER);
      textSize(this.h/12);
      text(str(this.atk), this.x+this.w/8*2, this.y+this.h/9*8);
      text(str(this.dfp), this.x+this.w/8*6, this.y+this.h/9*8);
      text(str(this.cost), this.x+this.w/2, this.y+this.h/9);
    }
    else
    { image(cardBackImg, this.x, this.y, this.w, this.h); }
  }
  
  void setPosition(int x, int y)
  {
    this.x = x;
    this.y = y;
  }
  
  void changeSize(int h)
  {
    this.h = h;
    this.w = int(this.h/1.5);
  }
  
  Boolean mouseOver()
  { return this.x<=mouseX && mouseX<=this.x+this.w && this.y<=mouseY && mouseY<=this.y+this.h; }
}
