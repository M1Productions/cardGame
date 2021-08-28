class Settings
{
  Button menueBt;
  ImageButton soundIBt;
  
  Settings()
  {
    menueBt = new Button(0, 0, width/30, height/20, #1025FF, "<-", 0);
    soundIBt = new ImageButton(width/2-height/10, height/2-height/10, height/10, height/10, loudImg);
  }
  
  void draw()
  {
    menueBt.draw();
    if(menueBt.mouseOver())
    {
      menueBt.highlight();
      cursorChange = 12;
    }
    
    soundIBt.draw();
  }
  
  void mousePressed()
  {
    if(menueBt.mouseOver())
    {
      mode = 0;
      fM.addLine("volume="+str(volume));
      fM.save();
    }
    else if (soundIBt.mouseOver())
    {
       if (volume == 0)
       {
         volume = 25;
         soundIBt.changeImage(silentImg);
       } else if (volume == 25)
       {
         volume = 50;
         soundIBt.changeImage(normalImg);
       } else if (volume == 50)
       {
         volume = 75;
         soundIBt.changeImage(loudImg);
       } else if (volume == 75)
       {
         volume = 100;
         soundIBt.changeImage(maxImg);
       } else if (volume == 100)
       {
         volume = 0;
         soundIBt.changeImage(mutedImg);
       }
       
       mainTheme.amp(volume/100); 
    }
  }
}
