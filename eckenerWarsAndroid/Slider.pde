class Slider
{
  int x, y, w, h, value, maxValue;
  color prim, sec;
  boolean grabbed=false;
  
  Slider(int x, int y, int w, int h, int value, int maxValue, color prim, color sec)
  {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.value = value;
    this.maxValue = maxValue;
    this.prim = prim;
    this.sec = sec;
  }
  
  void draw()
  {
    stroke(this.prim);
    strokeWeight(this.h/2);
    line(this.x, this.y, this.x+this.w, this.y);
    
    stroke(this.sec);
    strokeWeight(this.h);
    point(this.x+(this.w/this.maxValue)*this.value, this.y);
  }
  
  void mousePressed()
  {
    this.value = (mouseX-this.x)/(this.w/this.maxValue);
    if(this.value < 0)
    { this.value = 0; }
    else if(this.value > this.maxValue)
    { this.value = maxValue; }
  }
  void mouseDragged()
  { this.mousePressed();}
  
  void setSlider(int value)
  { this.value = value; }
  
  boolean mouseOver()
  { return this.x-this.h/4<mouseX && mouseX<this.x+this.w+this.h/4 && this.y-this.h/4<mouseY && mouseY<this.y+this.h/4; }
}
