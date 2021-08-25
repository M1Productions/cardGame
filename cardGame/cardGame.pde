int mode=0, cursorChange, fade=0;
String errorText = "";
boolean play=false;
PImage accountImg, cardBackImg, dumpingGroundImg, shieldImg, bombImg;

LoadingScreen loadingScreen;
MainMenue mainMenue;
Game game;
Settings settings;
AccountMenue accountMenue;

void setup()
{
  size(1600,1000);

  bombImg = loadImage("bomb.png");
  shieldImg = loadImage("shield.png");
  accountImg = loadImage("noAccount.png");
  cardBackImg = loadImage("cardBack.png");
  dumpingGroundImg = loadImage("dumpingGround.png");

  loadingScreen = new LoadingScreen();
  mainMenue = new MainMenue();
  game = new Game();
  settings = new Settings();
  accountMenue = new AccountMenue();
}

void draw()
{
  if(play)
  {play();}

  cursorChange=0;
  background(200);

  switch(mode)
  {
    case 0: mainMenue.draw();       break;
    case 1: game.draw();            break;
    case 2: settings.draw();        break;
    case 3: accountMenue.draw();    break;
  }

  if(fade > 0)
  { printError(); }

  cursor(cursorChange);
}

void mousePressed()
{
  switch(mode)
  {
    case 0: mainMenue.mousePressed();       break;
    case 1: game.mousePressed();            break;
    case 2: settings.mousePressed();        break;
    case 3: accountMenue.mousePressed();    break;
  }
}

void play()
{
  mode=1;
  play = false;
  createError("No game found"); //todo game mecanics
}
void openSettings()
{
  //todo save and load settings
  mode = 2;
}
void openAccountMenue()
{
  //todo load account settings
  mode = 3;
}

void createError(String text)
{
  if(fade > 0)
  { errorText += "\n"+text; }
  else
  { errorText = text; }
  fade = 255;
}
void printError()
{
  fill(#FF0000 , fade+55);
  textSize(height/20);
  textAlign(CENTER);
  text(errorText, width/2, height/2);
  fade --;
}
