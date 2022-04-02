class FileManager
{
  ArrayList<String> txt = new ArrayList<String>(); //the settings content
  ArrayList <String> content = new ArrayList <String>(); //for reading a file
  
  String dirName;
  
  FileManager()
  {}
  
  void fileSave(ArrayList <String> saveContent, String dir)
  {
    PrintWriter file = createWriter(dir);
    
    for (String l : saveContent)
    { file.println(l); }
    
    file.flush();
    file.close();
    println("rtzui");
  }
  void fileSave(String[] saveContent, String dir)
  {
    
    try{
      dirName = "//internalstorage//android";
      File newFile = new File(dirName);
      newFile.mkdirs();
      if(newFile.exists())
      {
        println("1");
        if(newFile.isDirectory())
        { println("2"); } 
        else
        { println("3"); }
      } 
      else
      { println("Directory Doesn't Exist... Creating"); }
    }
    catch(Exception e)
    { e.printStackTrace(); }
    
    //saveStrings(dir, saveContent);
    //println("jkl");
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
      accountImg = accountDefaultImg;
    }
  }
}
