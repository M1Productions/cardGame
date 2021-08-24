int mode=0, cursorChange, fade=0;
String errorText = "";
boolean play=false;
PImage accountImg, cardBackImg;

LoadingScreen loadingScreen;
MainMenue mainMenue;
Game game;

void setup()
{
  size(1200,1200);

  accountImg = loadImage("noAccount.png");
  cardBackImg = loadImage("cardBack.png");

  loadingScreen = new LoadingScreen();
  mainMenue = new MainMenue();
  game = new Game();
}

void draw()
{
  cursorChange=0;
  background(200);

  switch(mode)
  {
    case 0: mainMenue.draw();    break;
    case 1: game.draw();         break;
  }

  if(fade > 0)
  { printError(); }

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

void play()
{
  mode=1;
  play = false;
  /*while(mode==1) //to explain: i just wanted the program to hold at this point to test out the loadingScreen (recreating a loading game that takes up longer then one regular frame)
  {}*/
}

void createError(String text)
{
  if(fade > 0)
  { errorText += text; }
  else
  { errorText = text; }
  fade = 255;
}
void printError()
{
  fill(#FF0000);
  textSize(height/20);
  TextAlign(CENTER);
  text(errorText, width/2, height/2)
  fade -= 2;
}
