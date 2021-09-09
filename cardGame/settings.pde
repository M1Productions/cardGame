class Settings
{
  Button menueBt, credsBt;
  ImageButton soundIBt;
  Slider volumeSl;
  
  String creds = "Spiel und Design: \n Karo \n\n Musik: \n Tiara \n\n Programm: \n Mika, Vale \n\n Eine Produktion von M1Productions";
  
  boolean drawCreds=false;
  
  Settings()
  {
    credsBt = new Button(width/2-width/18, height-height/5, width/9, height/10,#1025FF, "Credits", 0);
    menueBt = new Button(0, 0, width/30, height/20, #1025FF, "<-", 0);
    soundIBt = new ImageButton(width/6-height/20, height/2+height/20, height/10, height/10, loudImg);
  }
  
  void refresh()
  {
    volumeSl = new Slider(width/6*2, height/2+height/10, width/6*3, 50, 25, 100, estetics.getBasicPrimaryColor(), estetics.getBasicSecondaryColor());
    this.changeImages();
  }
  
  void draw()
  {
    background(screenMusicImg);
    
    menueBt.draw();
    soundIBt.draw();
    credsBt.draw();
    volumeSl.draw();
    
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
      changeMode = 0;
      fM.txt.clear();
      fM.txt.add(str(data.musicVolume));
      fM.txt.add(str(data.sfxVolume));
      fM.save(fM.txt, "settings/settings.eck");
    }
    else if (soundIBt.mouseOver())
    {
      data.musicVolume = (data.musicVolume+25-(data.musicVolume%25))%100;       
      this.changeVolume();
    }
    else if(credsBt.mouseOver())
    {
      this.drawCreds = true;
    }
    else if(this.volumeSl.mouseOver())
    {
      this.volumeSl.mousePressed();
      data.musicVolume = volumeSl.value;
      this.changeVolume();
    }
  }
  
  void mouseDragged()
  {
    if(this.volumeSl.mouseOver())
    {
      this.volumeSl.mouseDragged();
      data.musicVolume = volumeSl.value+1;
      this.changeVolume();
    }
  }
  
  void changeImages()
  {
    if (data.musicVolume >= 100)
    { soundIBt.changeImage(maxImg); }
    else if (data.musicVolume >= 75)
    { soundIBt.changeImage(loudImg); }
    else if (data.musicVolume >= 50)
    { soundIBt.changeImage(normalImg); }
    else if (data.musicVolume > 0)
    { soundIBt.changeImage(silentImg); }
    else if (data.musicVolume <= 0)
    { soundIBt.changeImage(mutedImg); }
    
    this.volumeSl.setSlider(int(data.musicVolume));
  }
  
  void changeVolume()
  {
    this.changeImages();
    mainThemeSnd.amp(data.musicVolume/100);
  }
  
  void drawCreds()
  {
    noStroke();
    fill(0, 200);
    rect(0,0,width,height);
    
    fill(255);
    textSize(height/16);
    textAlign(CENTER, TOP);
    text(this.creds, width/2, 0);
  }
}
