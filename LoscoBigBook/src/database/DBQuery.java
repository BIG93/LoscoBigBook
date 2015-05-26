package database;

<<<<<<< HEAD
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import database.Utente;

public class DBQuery {
	public static Utente DB_Login(String user, String pass)
	{
		Utente ut = null;
		
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://" + "127.0.0.1" + "/" + "loscobigbook" + "?" +
                    "user=" + "root" + "&password=" + "");
			
			
			PreparedStatement pstmt = con.prepareStatement(" SELECT * " + 
														   " FROM utente " + 
															" WHERE email LIKE ? "
															+ " AND password LIKE ? ");
			pstmt.setString(1, user);
			pstmt.setString(2, pass);
			
			ResultSet rs = pstmt.executeQuery();
				
			while (rs.next()){
				String nome =  rs.getString("Nome");	
				String cognome =  rs.getString("Cognome");	
				String email = rs.getString("Email");	
				String sesso= rs.getString("Sesso");
				String datanascita= rs.getString("Datanascita");
				String ruolo= rs.getString("Ruolo");
				
				ut= new Utente(email, nome, cognome, sesso, datanascita, ruolo);				
			}
			
			con.close();
			
		}
		catch (Exception e) {
			System.out.println("Errore con DB o Query errata");
			e.printStackTrace();
		}

		return ut;
	} // End DB_Login.
	
	public static Utente DB_Login_ByCookie(String user)
	{
		Utente ut = null;
		
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://" + "127.0.0.1" + "/" + "loscobigbook" + "?" +
                    "user=" + "root" + "&password=" + "");
			
			
			PreparedStatement pstmt = con.prepareStatement(" SELECT * " + 
														   " FROM utente " + 
															" WHERE email LIKE ? ");
			pstmt.setString(1, user);
			ResultSet rs = pstmt.executeQuery();
				
			while (rs.next()){
				String nome =  rs.getString("Nome");	
				String cognome =  rs.getString("Cognome");	
				String email = rs.getString("Email");	
				String sesso= rs.getString("Sesso");
				String datanascita= rs.getString("Datanascita");
				String ruolo= rs.getString("Ruolo");
				
				ut= new Utente(email, nome, cognome, sesso, datanascita, ruolo);
			}
=======
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
			
		
>>>>>>> 719964cab61c81e5f851d31bd7112ad989687b06
			
			con.close();
			
		}
<<<<<<< HEAD
		catch (Exception e) {
			System.out.println("Errore con DB o Query errata");
			e.printStackTrace();
		}
=======
		catch (Exception e) 
		{
			System.out.println("Errore con DB o Query errata");
			e.printStackTrace();
		}
		return i;
	}
>>>>>>> 719964cab61c81e5f851d31bd7112ad989687b06

		return ut;
	} // End DB_Login.
}
