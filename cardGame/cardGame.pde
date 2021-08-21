int mode = 0, cursorChange;

boolean play=false;

LoadingScreen loadingScreen;
MainMenue mainMenue;
Game game;

void setup()
{
  size(1200,1200);
  
  loadingScreen = new LoadingScreen();
  mainMenue = new MainMenue();
  game = new Game();
}

void draw()
{
  if(play)
  {
    mode=1;
    while(mode==1) //to explain: i just wanted the program to hold at this point to test out the loadingScreen (recreating a loading game that takes up longer then one regular frame)
    {}
    play = false;
  }
  
  cursorChange=0;
  background(200);
  
  switch(mode)
  {
    case 0: mainMenue.draw();    break;
    case 1: game.draw();         break;
  }
  
  cursor(cursorChange);
}

void mousePressed()
{
  switch(mode)
  {
    case 0: mainMenue.mousePressed();   break;
    case 1: game.mousePressed();        break;
  }
}
