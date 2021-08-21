class LoadingScreen
{
  void draw()
  {
    fill(200);
    strokeWeight(0);
    rect(0,0,width,height);
    
    fill(0);
    textAlign(CENTER,CENTER);
    text("loading...", width/2, height/2);
  }
}
