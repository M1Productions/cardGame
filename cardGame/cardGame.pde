import processing.sound.*;
//import java.sql.*;
//import java.io.*;
//import java.util.*;

SoundFile mainThemeSnd, clickSnd, cardSnd;
float musicVolume=100, sfxVolume=100;

FileManager fM = new FileManager();

int mode=0, cursorChange, fade=0, changeMode=0;
String errorText = "", team=""; //team: music/cake
boolean logedIn=false;
PImage playButtonImg, cardFrontImg, settingsButtonImg, accountImg, cardBackImg, dumpingGroundImg, mutedImg, silentImg, normalImg, loudImg, maxImg, homeScreenImg, screenNeutralImg, screenMusicImg, tableMusicImg;

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
  size(1300,1000);

  cardSnd = new SoundFile(this, sketchPath("data/button.mp3"));
  cardSnd.amp(sfxVolume/100);
  clickSnd = new SoundFile(this, sketchPath("data/click.mp3"));
  clickSnd.amp(sfxVolume/100);
  mainThemeSnd = new SoundFile(this, sketchPath("data/titleSong.mp3")); //playing the theme song (Thanks to Tiara!!)
  mainThemeSnd.amp(musicVolume/100);
  mainThemeSnd.loop();
  
  fM.load();

  cardFrontImg = loadImage("pCardNormalFront.png");
  accountImg = loadImage("noAccount.png");
  cardBackImg = loadImage("cardBack.png");
  dumpingGroundImg = loadImage("dumpingGround.png");
  homeScreenImg = loadImage("homeScreen.png");
  screenNeutralImg = loadImage("screenNeutral.png");
  screenMusicImg = loadImage("screenMusic.png");
  tableMusicImg = loadImage("tableMusic.png");
  playButtonImg = loadImage("playButton.png");
  settingsButtonImg = loadImage("settingsButton.png");
  
  //music loudness
  mutedImg = loadImage("muted.png");
  silentImg = loadImage("silent.png");
  normalImg = loadImage("normal.png");
  loudImg = loadImage("loud.png");
  maxImg = loadImage("max.png");

  loadingScreen = new LoadingScreen();
  mainMenue = new MainMenue();
  settings = new Settings();
  accountMenue = new AccountMenue();
  estetics = new Estetics();
}

void draw()
{
  if(changeMode != mode) //before drawing because then the loading screen is drawn
  { changeMode(); }

  cursorChange=0;

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
  clickSnd.play();
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

void changeMode()
{
  if(changeMode == 0)
  {
    mode = 0;
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
