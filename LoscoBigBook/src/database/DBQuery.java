package database;

import java.sql.*;

public class DBQuery {
	
	public static int registrazione(String nome, String cognome, String email, String password, String datanascita, String sesso)
	{
		int i=0;
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://" + "127.0.0.1" + "/" + "loscobigbook" + "?" + "user=" + "root" + "&password=" + "");
			
			
			PreparedStatement pstmt = con.prepareStatement(" INSERT INTO `utente` "
					+ " (`Nome`, `Cognome`, `Email`, `Password`, `Datanascita`, `Ruolo`, `Cancellato`, `Sesso`) "
					+ " VALUES (?, ?, ?, ?, ?, 'user', 0, ?); ");
			
			
			pstmt.setString(1, nome);
			pstmt.setString(2, cognome);
			pstmt.setString(3, email);
			pstmt.setString(4, password);
			pstmt.setString(5, datanascita);
			pstmt.setString(6, sesso);
			
			i = pstmt.executeUpdate();
			
		
			
			con.close();
			
		}
		catch (Exception e) 
		{
			System.out.println("Errore con DB o Query errata");
			e.printStackTrace();
		}
		return i;
	}

}
