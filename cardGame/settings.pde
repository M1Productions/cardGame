class Settings
{
  Button menueBt, credsBt;
  ImageButton soundIBt;
  
  String creds = "Spiel und Design: \n Karo \n\n Musik: \n Tiara \n\n Programm: \n Mika, Vale \n\n Eine Produktion von M1Productions";
  
  boolean drawCreds=false;
  
  Settings()
  {
    credsBt = new Button(width/2-width/18, height-height/5, width/9, height/10,#1025FF, "Credits", 0);
    menueBt = new Button(0, 0, width/30, height/20, #1025FF, "<-", 0);
    soundIBt = new ImageButton(width/2-height/20, height/2-height/10, height/10, height/10, loudImg);
  }
  
  void draw()
  {
    background(screenMusicImg);
    
    menueBt.draw();
    soundIBt.draw();
    credsBt.draw();
    
    if(this.drawCreds)
    { this.drawCreds(); }
    else if(menueBt.mouseOver())
    {
      menueBt.highlight();
      cursorChange = 12;
    }
    else if(soundIBt.mouseOver())
    {
      soundIBt.highlight();
      cursorChange = 12;
    }
    else if(credsBt.mouseOver())
    {
      credsBt.highlight();
      cursorChange = 12;
    }
  }
  
  void mousePressed()
  {
    if(this.drawCreds)
    { this.drawCreds = false; }
    else if(menueBt.mouseOver())
    {
      mode = 0;
      fM.txt.clear();
      //fM.txt.add("volume="+str(volume));
      fM.txt.add(str(volume));
      fM.save();
    }
    else if (soundIBt.mouseOver())
    {
      volume = (volume+25)%100;
      this.changeImages();
       
      mainTheme.amp(volume/100); 
    }
    else if(credsBt.mouseOver())
    {
      this.drawCreds = true;
    }
  }
  
  void changeImages()
  {
    if (volume == 0)
    { soundIBt.changeImage(mutedImg ); }
    else if (volume == 25)
    { soundIBt.changeImage(silentImg); }
    else if (volume == 50)
    { soundIBt.changeImage(normalImg); }
    else if (volume == 75)
    { soundIBt.changeImage(loudImg); }
    else if (volume == 100)
    { soundIBt.changeImage(maxImg); }
  }
  
  void drawCreds()
  {
    strokeWeight(0);
    fill(0, 200);
    rect(0,0,width,height);
    
    fill(255);
    textSize(height/16);
    textAlign(CENTER, TOP);
    text(this.creds, width/2, 0);
  }
}
