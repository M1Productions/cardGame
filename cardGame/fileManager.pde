class FileManager
{
  ArrayList<String> txt;
  
  FileManager()
  {
    txt = new ArrayList<String>();
  }
  
  void addLine(String line)
  {
    txt.add(line);
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
}
