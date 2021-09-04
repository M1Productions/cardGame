class Estetics
{
  /*void dashline(int x0, int y0, int x1, int y1, int line, int space )
  {
    float [] spacing = {line, space};
    float distance = dist(x0, y0, x1, y1);
    float [ ] xSpacing = new float[spacing.length];
    float [ ] ySpacing = new float[spacing.length];
    float drawn = 0.0;  // amount of distance drawn
  
    if (distance > 0)
    {
      int i;
      boolean drawLine = true; // alternate between dashes and gaps
  
      for (i = 0; i < spacing.length; i++)
      {
        xSpacing[i] = lerp(0, (x1 - x0), spacing[i] / distance);
        ySpacing[i] = lerp(0, (y1 - y0), spacing[i] / distance);
      }
  
      i = 0;
      while (drawn < distance)
      {
        if (drawLine)
        {
          line(x0, y0, x0 + xSpacing[i], y0 + ySpacing[i]);
        }
        x0 += xSpacing[i];
        y0 += ySpacing[i];
        drawn = drawn + mag(xSpacing[i], ySpacing[i]);
        i = (i + 1) % spacing.length;  // cycle through array
        drawLine = !drawLine;  // switch between dash and gap
      }
    }
  }*/
  
  color getBasicPrimaryColor()
  {
    if(team.equals("cake"))
    { return #DAC6BF; }
    else if(team.equals("music"))
    { return #57897E; }
    else
    { return #845B55; }
  }
  color getBasicSecondaryColor()
  {
    if(team.equals("cake"))
    { return #E59890; }
    if(team.equals("music"))
    { return #769D88; }
    else
    { return #F8EEE5; }
  }
}
