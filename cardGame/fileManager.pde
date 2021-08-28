class FileManager
{
  ArrayList<String> txt = new ArrayList<String>();
  
  FileManager()
  {}
  
  void addLine(String line)
  {
    txt.add(line);
    println("1");
  }
  
  void save()
  {
    PrintWriter file = createWriter("settings.txt");
    
    for (String l : txt)
    {
      file.println(l);
    }
    
    file.flush();
    file.close();
  }
  
  void load()
  {
    //todo
  }
}
