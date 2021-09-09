class Estetics
{
  color getBasicPrimaryColor()
  {
    if(data.team.equals("cake"))
    { return #DAC6BF; }
    else if(data.team.equals("music"))
    { return #57897E; }
    else
    { return #845B55; }
  }
  color getBasicSecondaryColor()
  {
    if(data.team.equals("cake"))
    { return #E59890; }
    if(data.team.equals("music"))
    { return #769D88; }
    else
    { return #F8EEE5; }
  }
}
