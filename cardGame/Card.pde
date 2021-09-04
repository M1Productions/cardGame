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
    if(this.fwd) //todo draw the text on the card
    {
      image(cardFrontImg, this.x, this.y, this.w, this.h);
      
      noFill();
      stroke(0);
      strokeWeight(this.w/60);
      circle(this.x+this.w/2, this.y+this.h/8, this.h/8);
      
      fill(0);
      textAlign(CENTER);
      textSize(this.h/12);
      text(str(this.atk), this.x+this.w/10, this.y+this.h/5*3);
      text(str(this.dfp), this.x+this.w/15*14, this.y+this.h/5*3);
      text(str(this.cost), this.x+this.w/2, this.y+this.h/7);
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
