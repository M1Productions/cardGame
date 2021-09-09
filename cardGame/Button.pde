class Button
{
  int x, y, w, h;
  int strokeWidth, centerX, centerY;
  color col, txtCol;
  String txt;

  Button(int x, int y, int w, int h, color col, String txt, color txtCol)
  {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.col = col;
    this.txt = txt;
    this.txtCol = txtCol;

    this.strokeWidth = this.h/6;
    this.centerX = this.x+this.w/2;
    this.centerY = this.y+this.h/2;
  }

  void draw()
  {
    strokeWeight(this.strokeWidth);
    stroke(this.col);
    fill(this.col,100);
    rect(this.x, this.y, this.w, this.h);

    fill(txtCol);
    textSize(this.h/2);
    textAlign(CENTER, CENTER);
    text(this.txt, this.centerX, this.centerY);
  }

  void highlight()
  {
    noStroke();
    fill(100,100);
    rect(this.x, this.y, this.w, this.h);
  }

  Boolean mouseOver()
  { return this.x<=mouseX && mouseX<=this.x+this.w && this.y<=mouseY && mouseY<=this.y+this.h; }
}

class ImageButton extends Button
{
  PImage image, hover;

  ImageButton(int x, int y, int w, int h, PImage image)
  {
    super(x,y,w,h,0,"",0);
    this.image = image;
  }
  ImageButton(int x, int y, int w, int h, PImage image, PImage hover)
  {
    super(x,y,w,h,0,"",0);
    this.image = image;
    this.hover = hover;
  }

  void draw()
  { image(this.image, this.x, this.y, this.w, this.h); }
  
  void highlight()
  {
    if(this.hover == null)
    { super.highlight(); }
    else
    { image(this.hover, this.x, this.y, this.w, this.h); }
  }
  
  void changeImage(PImage img)
  { this.image = img; }
}
