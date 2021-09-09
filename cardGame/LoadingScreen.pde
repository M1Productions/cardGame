class LoadingScreen
{
  void draw()
  {
    background(screenNeutralImg);

    fill(255);
    textSize(height/20);
    textAlign(CENTER,CENTER);
    text("loading...", width/2, height/2);

    cursorChange = 3;
  }
}
