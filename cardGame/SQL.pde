/*public class Connections
{
  private Connection conn       = null;
  private Properties properties = null;

  private void initProperties()
  {
    File propertiesFile = new File("data/Properties.txt");
    properties = new Properties();

    try
    {
      BufferedInputStream bis =
        new BufferedInputStream(
          new FileInputStream(propertiesFile)) ;
      properties.load(bis);
      bis.close();
    } catch (Exception ex) {
      System.err.println("Fehler: Propertiedatei nicht gefunden");
      System.err.println("Das bedeutet, dass die Datei <Properties.txt> v");
      System.err.println("im Arbeitsordner vorhanden sein muss.");
      System.exit(8);
    }
  }

  public void initConnections()
  {
    initProperties();
    String url    = properties.getProperty("URL")      ;
    String driver = properties.getProperty("DRIVER")   ;
    String user   = properties.getProperty("USER")     ;
    String pwd    = properties.getProperty("PASSWORD") ;

    try
    {
      Class.forName(driver);
    }
    catch(ClassNotFoundException exc)
    {
      System.err.println("Fehler: Treiber nicht gefunden");
      System.err.println("Das bedeutet, dass die Datei <hsqldb.jar> ");
      System.err.println("nicht im Klassenpfad gefunden wird.");
      System.err.println("Entweder muss der Aufruf angepasst werden oder ");
      System.err.println("die Datei <hsqldb.jar> muss 'erreichbar' in  den  ");
      System.err.println("Systempfad gelegt werden.  ");
      System.exit(1);
    }

    try
    {
      conn = DriverManager.getConnection(url,user,pwd);
    }
    catch(SQLException exc)
    {
      System.err.println("Fehler: Datenbankverbindung konnte nicht aufgebaut werden.");
      System.err.println("Bei Standalone: Es muessen alle anderen Anwendungen gesch lossen werden.");
      System.err.println("Bei Client/Server: Es muss ein Server gestartet werden.");
      System.err.println("Testen Sie den Dateizugriff mit dem Programm 'DatabeseManagerSwing'");
      System.err.println("und uebernehmen Sie ggf. die dort eingetragenen Werte.");
      System.exit(2);
    }
  }

  public Connection getConnection()
  {
    Connection erg =  conn;
    conn = null;
    return erg;
  }
  
  public void putConnection(Connection conn)
  { Connections.conn = conn; }
}



class SQL
{
  boolean submit(String username, String password)
  {
    String sqlSelect = "SELECT * FROM user WHERE username=?;";
    Connection conn          = Connections.getConnection();

    try
    {
      PreparedStatement  pstmt = conn.prepareStatement(sqlSelect);
      pstmt.setString(1,username);
      ResultSet  rs    = pstmt.executeQuery();
      if (rs.next())
      {
        if(rs.getString("username").equals(username) && rs.getString("password").equals(password))
        {
          CurrentData.setUser(username);
          CurrentData.setKeys(rs.getString("keys").toCharArray());
          rs.close();
          pstmt.close();
          Connections.putConnection(conn);
          return true;
        }
      }
      rs.close();
      pstmt.close();
    }
    catch(SQLException exc)
    {
      System.err.println("Fehler: in SQL-Aufruf beim Anmelden des Users");
      System.err.println("["+sqlSelect+"]");
      exc.printStackTrace();
      System.exit(6);
    }
    Connections.putConnection(conn);

    return false;
  }


  boolean createAccount(String username, String password)
  {
    //username shouldn't be twice or more -> edit
    String sqlSelect = "SELECT * FROM user WHERE username=?;";
    String sqlInsert = "INSERT INTO user (username , password , keys) VALUES (?,?,?)";
    Connection conn          = Connections.getConnection();

    try
    {
      PreparedStatement  pstmtcon = conn.prepareStatement(sqlSelect);
      pstmtcon.setString(1,username);
      ResultSet  rs    = pstmtcon.executeQuery();
      if(!rs.next())
      {
        PreparedStatement  pstmt = conn.prepareStatement(sqlInsert);
        pstmt.setString(1,username);
        pstmt.setString(2,password);
        pstmt.setString(3,"<>^");
        pstmt.execute();
        pstmt.close();
        rs = pstmtcon.executeQuery();
        rs.next();
        CurrentData.setUser(username);
        rs.close();
        pstmtcon.close();
        Connections.putConnection(conn);
        return true;
      }
      rs.close();
      pstmtcon.close();
    }
    catch(SQLException exc)
    {
      System.err.println("Fehler: in SQL-Aufruf beim Erstellen eines Users");
      System.err.println("["+sqlInsert+"]");
      exc.printStackTrace();
      System.exit(6);
    }
    Connections.putConnection(conn);
    return false;
  }


  boolean createSession(String username)
  {
    java.sql.Date sqlDate = new java.sql.Date(new Date().getTime());
    int key = -1;

    String sqlInsert = "INSERT INTO Session (sessionID , sessionDate , username) VALUES (?,?,?);";
    String sqlCount  = "SELECT count(*) from Session;";

    Connection conn  = Connections.getConnection();
    try
    {
      Statement stmt = conn.createStatement();
      ResultSet  rs   = stmt.executeQuery(sqlCount);
      rs.next();
      key  =  rs.getInt(1);
      rs.close();
      stmt.close();

      CurrentData.setSession(key);

      PreparedStatement  pstmt = conn.prepareStatement(sqlInsert);
      pstmt.setInt(1,key);
      pstmt.setDate(2,sqlDate);
      pstmt.setString(3,username);
      pstmt.execute();
      pstmt.close();
      Connections.putConnection(conn);
      return true;
    }
    catch(SQLException exc)
    {
      System.err.println("Fehler: in SQL-Aufruf beim Erstellen einer Session");
      System.err.println("["+sqlInsert+"]");
      exc.printStackTrace();
      System.exit(6);
    }
    Connections.putConnection(conn);
    return false;
  }


  boolean createRun(int score)
  {
    java.sql.Date sqlDate = new java.sql.Date(new Date().getTime());

    String sqlInsert = "INSERT INTO Run (runDate ,score, sessionID) VALUES (?,?,?)";
    Connection conn  = Connections.getConnection();
    try
    {
      PreparedStatement  pstmt = conn.prepareStatement(sqlInsert);
      pstmt.setDate(1,sqlDate);
      pstmt.setInt(2,score);
      pstmt.setInt(3,CurrentData.sessionID);
      pstmt.execute();
      pstmt.close();
      Connections.putConnection(conn);
      return true;
    }
    catch(SQLException exc)
    {
      System.err.println("Fehler: in SQL-Aufruf beim Erstellen einer Session");
      System.err.println("["+sqlInsert+"]");
      exc.printStackTrace();
      System.exit(6);
    }
    Connections.putConnection(conn);
    return false;
  }


  String [][] getGlobalTable()
  {
    String [][] erg = new String [10][2];

    String sqlSelect = "SELECT run.score , session.username FROM run NATURAL JOIN session ORDER BY score DESC OFFSET 0 LIMIT 10 ;";
    Connection conn  = Connections.getConnection();

    try
    {
      Statement  stmt = conn.createStatement();
      ResultSet  rs    = stmt.executeQuery(sqlSelect);
      int i = 0;
      while (rs.next())
      {
        erg[i][0] = rs.getString(2);
        erg[i][1] = Integer.toString(rs.getInt(1));
        i++;
      }
      rs.close();
      stmt.close();
      Connections.putConnection(conn);
    }
    catch(SQLException exc)
    {
      System.err.println("Fehler: in SQL-Aufruf beim Finden der Highscores");
      System.err.println("["+sqlSelect+"]");
      exc.printStackTrace();
      System.exit(6);
    }
    Connections.putConnection(conn);

    return erg;
  }


  String [][] getPersonalTable(String username)
  {
    String [][] erg = new String [10][2];

    String sqlSelect = "SELECT run.score , session.username FROM run NATURAL JOIN session WHERE username = ? order by score desc Offset 0 limit 10 ;";
    Connection conn  = Connections.getConnection();

    try
    {
      PreparedStatement  pstmt = conn.prepareStatement(sqlSelect);
      pstmt.setString(1,username);
      ResultSet  rs    = pstmt.executeQuery();
      int i = 0;
      while (rs.next())
      {
        erg[i][0] = username;
        erg[i][1] = Integer.toString(rs.getInt(1));
        i++;
      }
      rs.close();
      pstmt.close();
      Connections.putConnection(conn);
    }
    catch(SQLException exc)
    {
      System.err.println("Fehler: in SQL-Aufruf beim Finden der Highscores");
      System.err.println("["+sqlSelect+"]");
      exc.printStackTrace();
      System.exit(6);
    }
    Connections.putConnection(conn);

    return erg;
  }


  boolean setPassword(String password, String newPw)
  {
    String sqlSelect = "SELECT password FROM user WHERE username = ?;";
    String sqlSet = "UPDATE user SET password = ? WHERE username = ?;";
    Connection conn  = Connections.getConnection();

    try
    {
      PreparedStatement  pstmt = conn.prepareStatement(sqlSelect);
      pstmt.setString(1,CurrentData.getUsername());
      pstmt.execute();
      ResultSet  rs    = pstmt.executeQuery();
      if(rs.next())
      {
        if(rs.getString("password").equals(password))
        {
          rs.close();
          pstmt.close();

          PreparedStatement  pstmt2 = conn.prepareStatement(sqlSet);
          pstmt2.setString(1,newPw);
          pstmt2.setString(2,CurrentData.getUsername());
          pstmt2.execute();
          pstmt2.close();
          Connections.putConnection(conn);
          return true;
        }
      }
      rs.close();
      pstmt.close();
    }
    catch(SQLException exc)
    {
      System.err.println("Fehler: in SQL-Aufruf beim Aendern des Passwortes");
      System.err.println("["+sqlSet+"]");
      exc.printStackTrace();
      System.exit(6);
    }
    Connections.putConnection(conn);
    return false;
  }


  boolean deleteAccount(String password)
  {
    String sqlSelect = "SELECT password FROM user WHERE username = ?;";
    String sqlDel = "DELETE FROM user WHERE username = ?;";
    Connection conn  = Connections.getConnection();

    try
    {
      PreparedStatement  pstmt = conn.prepareStatement(sqlSelect);
      pstmt.setString(1,CurrentData.getUsername());
      pstmt.execute();
      ResultSet  rs    = pstmt.executeQuery();
      if(rs.next()) //if there is an user with that username
      {
        if(rs.getString("password").equals(password)) //if the password is valid
        {
          rs.close();
          pstmt.close();

          PreparedStatement  pstmt2 = conn.prepareStatement(sqlDel);
          pstmt2.setString(1,CurrentData.getUsername());
          pstmt2.execute();
          pstmt2.close();
          Connections.putConnection(conn);
          return true;
        }
      }
      rs.close();
      pstmt.close();
    }
    catch(SQLException exc)
    {
      System.err.println("Fehler: in SQL-Aufruf beim Aendern des Passwortes");
      System.err.println("["+sqlDel+"]");
      exc.printStackTrace();
      System.exit(6);
    }
    Connections.putConnection(conn);
    return false;
  }


  void setKeys()
  {
    String sqlSet = "UPDATE user SET keys = ? WHERE username = ?;";
    Connection conn  = Connections.getConnection();

    try
    {
      PreparedStatement  pstmt = conn.prepareStatement(sqlSet);
      pstmt.setString(1,new String(CurrentData.getKeys()));
      pstmt.setString(2,CurrentData.getUsername());
      pstmt.execute();
      pstmt.close();
      Connections.putConnection(conn);
    }
    catch(SQLException exc)
    {
      System.err.println("Fehler: in SQL-Aufruf beim Aendern des Passwortes");
      System.err.println("["+sqlSet+"]");
      exc.printStackTrace();
      System.exit(6);
    }
    Connections.putConnection(conn);
  }
}*/
