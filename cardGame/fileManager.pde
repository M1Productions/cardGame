class FileManager
{
  ArrayList<String> account = new ArrayList<String>(); //the account content
  ArrayList<String> txt = new ArrayList<String>(); //the settings content
  ArrayList <String> content = new ArrayList <String>(); //for reading a file
  
  FileManager()
  {}
  
  void save(ArrayList <String> saveContent, String dir)
  {
    PrintWriter file = createWriter(dir);
    
    for (String l : saveContent)
    { file.println(l); }
    
    file.flush();
    file.close();
  }
  
  void load(String dir)
  {
    this.content.clear();
    BufferedReader reader = createReader(dir); // Open the file from the createWriter()
   
    String line = null;
    try
    {
      while ((line = reader.readLine()) != null)
      { this.content.add(line); }
    }
    catch (IOException e)
    { e.printStackTrace(); }
  }
  
  void readSettings()
  {
    data.musicVolume = float(this.content.get(0));
    mainThemeSnd.amp(data.musicVolume/100);
    data.sfxVolume = float(this.content.get(1));
    cardSnd.amp(data.sfxVolume/100);
    clickSnd.amp(data.sfxVolume/100);
  }
  void readAccount()
  {
    if(this.content == null || this.content.size() == 0)
    {
      data.team = "";
      createError("No Team found");
      accountImg = loadImage("noAccount.png");
    }
    else
    {
      data.team = this.content.get(0);
      accountImg = loadImage("accountDefault.png");
    }
  }
}
