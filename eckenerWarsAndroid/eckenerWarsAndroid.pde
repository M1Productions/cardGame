import processing.sound.*;

//SoundFile mainThemeSnd, clickSnd, cardSnd;

data data;
FileManager fM;

int mode=0, fade=0, changeMode=0;
String errorText = "";
PImage musicImg, cakeImg, accountDefaultImg, frameMusicImg, screenCakeImg, screenCakeCleanImg, screenMusicCleanImg, playButtonImg, cardFrontImg, settingsButtonImg, accountImg, cardBackImg, dumpingGroundImg, mutedImg, silentImg, normalImg, loudImg, maxImg, homeScreenImg, screenNeutralImg, screenMusicImg;

LoadingScreen loadingScreen;
MainMenue mainMenue;
Game game;
Settings settings;
AccountMenue accountMenue;
Estetics estetics;

Player player1, player2;

void setup()
{
  frameRate(30);
  fullScreen();
  orientation(LANDSCAPE);
  
  screenNeutralImg = loadImage("screenNeutral.png");
  
  loadingScreen = new LoadingScreen();
  loadingScreen.draw();
  
  accountDefaultImg = loadImage("accountDefault.png");
  
  data = new data();
  fM = new FileManager();

  /*cardSnd = new SoundFile(this, sketchPath("button.mp3"));
  clickSnd = new SoundFile(this, sketchPath("click.mp3"));
  mainThemeSnd = new SoundFile(this, sketchPath("titleSong.mp3")); //playing the theme song (Thanks to Tiara!!)
  mainThemeSnd.loop();*/
  
  data.load();

  frameMusicImg = loadImage("frameMusic.png");
  cardFrontImg = loadImage("pCardNormalFront.png");
  cardBackImg = loadImage("cardBack.png");
  dumpingGroundImg = loadImage("dumpingGround.png");
  homeScreenImg = loadImage("homeScreen.png");
  screenMusicImg = loadImage("screenMusic.png");
  screenCakeImg = loadImage("screenCake.png");
  screenMusicCleanImg = loadImage("screenMusicClean.png");
  screenCakeCleanImg = loadImage("screenCakeClean.png");
  playButtonImg = loadImage("playButton.png");
  settingsButtonImg = loadImage("settingsButton.png");
  musicImg = loadImage("musicLogo.png");
  cakeImg = loadImage("cakeLogo.png");
  
  //music volume
  mutedImg = loadImage("muted.png");
  silentImg = loadImage("silent.png");
  normalImg = loadImage("normal.png");
  loudImg = loadImage("loud.png");
  maxImg = loadImage("max.png");

  mainMenue = new MainMenue();
  settings = new Settings();
  accountMenue = new AccountMenue();
  estetics = new Estetics();
}

void draw()
{
  if(changeMode != mode) //before drawing because then the loading screen is drawn
  { changeMode(); }

  switch(mode)
  {
    case 0: mainMenue.draw();       break;
    case 1: game.draw();            break;
    case 2: settings.draw();        break;
    case 3: accountMenue.draw();    break;
  }

  if(fade > 0)
  { printError(); }
}

void mousePressed()
{
  //clickSnd.play();
  switch(mode)
  {
    case 0: mainMenue.mousePressed();       break;
    case 1: game.mousePressed();            break;
    case 2: settings.mousePressed();        break;
    case 3: accountMenue.mousePressed();    break;
  }
}

void mouseDragged()
{
  switch(mode)
  {
    case 2: settings.mouseDragged();    break;
  }
}

void mouseReleased()
{
  switch(mode)
  {
    case 2: settings.mouseReleased();    break;
  }
}

void changeMode()
{
  if(changeMode == 0)
  {
    mode = 0;
    data.loadAcc();
    mainMenue.accountIBt.image = accountImg;
  }
  else if(changeMode == 1)
  {
    mode=1;
    player1 = new Player(1,1); //you
    player2 = new Player(2,1); //your opponent
    game = new Game();
    createError("No game found"); //todo game mecanics
  }
  else if(changeMode == 2)
  {
    mode = 2;
    settings.refresh();
  }
  else if(changeMode == 3)
  {
    mode = 3;
    accountMenue.refresh();
  }
}

void createError(String text)
{
  if(fade > 0)
  { errorText += "\n"+text; }
  else
  { errorText = text; }
  fade = 300;
}
void printError()
{
  fill(#FF0000 , fade);
  textSize(height/20);
  textAlign(CENTER, BOTTOM);
  text(errorText, width/2, height/2);
  fade-=2;
}
