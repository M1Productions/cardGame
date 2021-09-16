class LoadingScreen
{
  void draw()
  {
    image(screenNeutralImg,0,0,width,height);

    fill(255);
    textSize(height/20);
    textAlign(CENTER,CENTER);
    text("loading...", width/2, height/2);
  }
}
