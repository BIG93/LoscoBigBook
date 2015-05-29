package database;

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
				int id=rs.getInt("ID");
				String nome =  rs.getString("Nome");	
				String cognome =  rs.getString("Cognome");	
				String email = rs.getString("Email");	
				String sesso= rs.getString("Sesso");
				String datanascita= rs.getString("Datanascita");
				String ruolo= rs.getString("Ruolo");
				String luogonascita= rs.getString("Luogonascita");
				String statosentimentale= rs.getString("Statosentimentale");
				String residenza= rs.getString("Residenza");
				String password=rs.getString("Password");
				
				ut= new Utente(id, email, nome, cognome, sesso, datanascita, ruolo,luogonascita, statosentimentale,residenza, password);			
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
				
				int id=rs.getInt("ID");
				String nome =  rs.getString("Nome");	
				String cognome =  rs.getString("Cognome");	
				String email = rs.getString("Email");	
				String sesso= rs.getString("Sesso");
				String datanascita= rs.getString("Datanascita");
				String ruolo= rs.getString("Ruolo");
				String luogonascita= rs.getString("Luogonascita");
				String statosentimentale= rs.getString("Statosentimentale");
				String residenza= rs.getString("Residenza");
				String password=rs.getString("Password");
				
				ut= new Utente(id, email, nome, cognome, sesso, datanascita, ruolo,luogonascita, statosentimentale,residenza, password);		
				
				con.close();
			}
		}
		catch (Exception e) {
			System.out.println("Errore con DB o Query errata");
			e.printStackTrace();
		}
		return ut;
		 // End DB_Login.
	}
	
	public static int registrazione(String nome, String cognome, String email, String password, String datanascita, String sesso){
		int i=0;
		try{
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
	
	public static int UPDATE_utente(String nome, String cognome, String email, String password, String datanascita, String sesso, String residenza, String luogonascita, String statosentimentale, int id){
		int i=0;
		
		try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://" + "127.0.0.1" + "/" + "loscobigbook" + "?" + "user=" + "root" + "&password=" + "");
			
			
			PreparedStatement pstmt = con.prepareStatement(" UPDATE `utente` SET `Nome`= ?, `Cognome`= ?, `Email`= ?, `Password`= ?, `Datanascita`= ?, `Sesso`= ?, `Residenza`= ?, `Luogonascita`= ?, `Statosentimentale`= ? WHERE `ID`= ? LIMIT 1;");
			
			
			pstmt.setString(1, nome);
			pstmt.setString(2, cognome);
			pstmt.setString(3, email);
			pstmt.setString(4, password);
			pstmt.setString(5, datanascita);
			pstmt.setString(6, sesso);
			pstmt.setString(7, residenza);
			pstmt.setString(8, luogonascita);
			pstmt.setString(9, statosentimentale);
			pstmt.setInt(10, id);
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
