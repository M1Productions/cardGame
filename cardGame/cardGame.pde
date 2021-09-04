import processing.sound.*;
import java.sql.*;
import java.io.*;
import java.util.*;

SoundFile mainTheme;
float volume = 75;

FileManager fM = new FileManager();

int mode=0, cursorChange, fade=0, musicCount=0;
String errorText = "";
boolean play=false, logedIn=false;
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

  mainTheme = new SoundFile(this, sketchPath("data/titleSong.mp3")); //playing the theme song (Thanks to Tiara!!)
  mainTheme.amp(volume/100);
  mainTheme.play();
  
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
  if(play)
  {play();}

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
  
  musicCount++;
  if(musicCount%1600 == 0)
  { mainTheme.play(); }

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
  play = false;
  mode=1;
  player1 = new Player(1,1); //you
  player2 = new Player(2,1); //your opponent
  game = new Game();
  createError("No game found"); //todo game mecanics
}
void openSettings()
{
  mode = 2;
  settings.changeImages();
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
