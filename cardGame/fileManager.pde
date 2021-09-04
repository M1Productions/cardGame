class FileManager
{
  ArrayList<String> txt = new ArrayList<String>();
  ArrayList <String> content = new ArrayList <String>();
  
  FileManager()
  {
    txt.add("volume=75.0");
  }
  
  void save()
  {
    PrintWriter file = createWriter("settings.txt");
    
    for (String l : txt)
    { file.println(l); }
    
    file.flush();
    file.close();
  }
  
  void load()
  {
    String directory = "settings.txt";
    BufferedReader reader = createReader(directory); // Open the file from the createWriter()
   
    String line = null;
    try
    {
      while ((line = reader.readLine()) != null)
      { this.content.add(line); }
    }
    catch (IOException e)
    { e.printStackTrace(); }
    
    this.readSettings();
  }
  
  void readSettings()
  {
    musicVolume = float(this.content.get(0));
    mainThemeSnd.amp(musicVolume/100);
  }
}
