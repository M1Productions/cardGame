class InGameMenue
{
  Button menueBt, backBt, rulesBt;
  
  InGameMenue()
  {
    menueBt = new Button(width/3, height/4-height/12, width/3, height/6, data.getBasicPrimaryColor(), "Hauptmenu", 0);
    backBt = new Button(width/3, height/2-height/12, width/3, height/6, data.getBasicPrimaryColor(), "weiter", 0);
    rulesBt = new Button(width/3, height/4*3-height/12, width/3, height/6, data.getBasicPrimaryColor(), "Regeln", 0);
  }
  
  void refresh()
  {
    this.menueBt.col = data.getBasicPrimaryColor();
    this.backBt.col = data.getBasicPrimaryColor();
    this.rulesBt.col = data.getBasicPrimaryColor();
  }
  
  void draw()
  {
    image(data.getBg(), 0, 0, width, height);
    
    menueBt.draw();
    backBt.draw();
    rulesBt.draw();
  }
  
  void mousePressed()
  {
    if(menueBt.mouseOver())
    { changeMode = 0; }
    else if(backBt.mouseOver())
    {
      changeMode = 1;
      mode = 1;
    }
    else if(rulesBt.mouseOver())
    { changeMode = 7; }
  }
}

class changeInfoOverlay
{
  Button p1Bt, p2Bt, p3Bt, m1Bt, m2Bt, m3Bt, backBt;
  
  changeInfoOverlay()
  {
    p1Bt = new Button(width/6*4-width/40, height/6*2-height/20, width/20, height/10, data.getBasicPrimaryColor(), "+", 0);
    p2Bt = new Button(width/6*4-width/40, height/6*3-height/20, width/20, height/10, data.getBasicPrimaryColor(), "+", 0);
    p3Bt = new Button(width/6*4-width/40, height/6*4-height/20, width/20, height/10, data.getBasicPrimaryColor(), "+", 0);
    m1Bt = new Button(width/6*2-width/40, height/6*2-height/20, width/20, height/10, data.getBasicPrimaryColor(), "-", 0);
    m2Bt = new Button(width/6*2-width/40, height/6*3-height/20, width/20, height/10, data.getBasicPrimaryColor(), "-", 0);
    m3Bt = new Button(width/6*2-width/40, height/6*4-height/20, width/20, height/10, data.getBasicPrimaryColor(), "-", 0);
    backBt = new Button(width/2-width/20, int(height/6*1.3), width/10, height/20, data.getBasicPrimaryColor(), "Menu", 0);
  }
  
  void refresh()
  {
    this.p1Bt.col = data.getBasicPrimaryColor();
    this.p2Bt.col = data.getBasicPrimaryColor();
    this.p3Bt.col = data.getBasicPrimaryColor();
    this.m1Bt.col = data.getBasicPrimaryColor();
    this.m2Bt.col = data.getBasicPrimaryColor();
    this.m3Bt.col = data.getBasicPrimaryColor();
    this.backBt.col = data.getBasicPrimaryColor();
  }
  
  void draw()
  {
    image(screenShot,0,0,width,height);
    fill(200,100);
    rect(0,0,width,height);
    
    image(screenNeutralImg, width/6, height/6, width/6*4, height/6*4);
    image(data.getFrame(), width/6, height/6, width/6*4, height/6*4);
    
    textSize(height/15);
    textAlign(LEFT,CENTER);
    fill(data.getBasicSecondaryColor());
    text("Runde: "+game.round, width/6*2.5, height/6*2);
    text("Energie: "+game.energy, width/6*2.5, height/6*3);
    text("Leben: "+game.lifes, width/6*2.5, height/6*4);
    
    this.backBt.draw();
    
    this.p1Bt.draw();
    this.p2Bt.draw();
    this.p3Bt.draw();
    if(game.round>1)
    {this.m1Bt.draw();}
    if(game.energy>0)
    {this.m2Bt.draw();}
    this.m3Bt.draw();
  }
  
  void mousePressed()
  {
    if(this.backBt.mouseOver())
    {
      changeMode = 1;
      mode = 1;
    }
    else if(this.p1Bt.mouseOver())
    { game.round ++; }
    else if(this.p2Bt.mouseOver())
    { game.energy ++; }
    else if(this.p3Bt.mouseOver())
    { game.lifes ++; }
    else if(this.m1Bt.mouseOver() && game.round>1)
    { game.round --; }
    else if(this.m2Bt.mouseOver() && game.energy>0)
    { game.energy --; }
    else if(this.m3Bt.mouseOver())
    { game.lifes --; }
  }
}
