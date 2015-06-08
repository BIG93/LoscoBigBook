package database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import database.Utente;

import java.util.*;

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
			}
			con.close();
			
		}
		catch (Exception e) {
			System.out.println("Errore con DB o Query errata");
			e.printStackTrace();
		}
		return ut;
		 // End DB_Login_ByCookie.
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
	}// End registrazione
	
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
	}// End UPDATE_utente
	
	
	public static ArrayList<Utente> User_search(String cerca)
	{
		ArrayList<Utente> userfind = new ArrayList<Utente>();
		Utente ut = null;
		
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://" + "127.0.0.1" + "/" + "loscobigbook" + "?" +
                    "user=" + "root" + "&password=" + "");
			
			
			PreparedStatement pstmt = con.prepareStatement(" SELECT * " +
														   " FROM utente " +
														   " WHERE Ruolo like 'user' AND (Nome LIKE ? OR cognome LIKE ?)");
			
			pstmt.setString(1, cerca + "%");
			pstmt.setString(2, cerca + "%" );
			
			ResultSet rs = pstmt.executeQuery();
				
			while (rs.next()){
				int id= rs.getInt("ID");
				String nome = rs.getString("Nome");	
				String cognome = rs.getString("Cognome");	
				String email = rs.getString("Email");	
				String sesso= rs.getString("Sesso");
				String datanascita= rs.getString("Datanascita");
				String ruolo= rs.getString("Ruolo");
				String luogonascita= rs.getString("Luogonascita");
				String statosentimentale= rs.getString("Statosentimentale");
				String residenza= rs.getString("Residenza");
				String password= rs.getString("Password");
				
				ut = new Utente(id, email, nome, cognome, sesso, datanascita, ruolo,luogonascita, statosentimentale,residenza, password);
				
				userfind.add(ut);
			}
			
			con.close();
			
		}
		catch (Exception e) {
			System.out.println("Errore con DB o Query errata");
			e.printStackTrace();
		}
		return userfind;
	} // End User_search
	
	public static Utente userByID(int ID)
	{
		Utente ut = null;
		
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://" + "127.0.0.1" + "/" + "loscobigbook" + "?" +
                    "user=" + "root" + "&password=" + "");
			
			
			PreparedStatement pstmt = con.prepareStatement(" SELECT * " + 
														   " FROM utente " + 
															" WHERE ID LIKE ? ");
			pstmt.setInt(1, ID);
			
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
		 // End userByID
	}
	
	public static int friend_request(int richiedente, int ricevente){
		
		int i=0;
		
		try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://" + "127.0.0.1" + "/" + "loscobigbook" + "?" + "user=" + "root" + "&password=" + "");
			
			
			PreparedStatement pstmt = con.prepareStatement(" INSERT INTO `amicizia` "
					+ " (`Richiedente`, `Ricevente`, `Stato`) "
					+ " VALUES (?, ?, 'in attesa'); ");
			
			pstmt.setInt(1, richiedente);
			pstmt.setInt(2, ricevente);
			
			
			i = pstmt.executeUpdate();
			
			con.close();
		
		}

		catch (Exception e) 
		{
			System.out.println("Errore con DB o Query errata");
			e.printStackTrace();
		}
		
		return i;
	}// End friend_request
	
	public static Friendship friendship_status(int richiedente, int ricevente)
	{
		Friendship f=null;
		
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://" + "127.0.0.1" + "/" + "loscobigbook" + "?" +
                    "user=" + "root" + "&password=" + "");
			
			
			PreparedStatement pstmt = con.prepareStatement(" SELECT Stato " + 
														   " FROM amicizia " + 
															" WHERE (Richiedente = ? AND Ricevente = ?) OR (Richiedente = ? AND Ricevente = ?)");
			pstmt.setInt(1, richiedente);
			pstmt.setInt(2, ricevente);
			pstmt.setInt(3, ricevente);
			pstmt.setInt(4, richiedente);
			
			
			
			ResultSet rs = pstmt.executeQuery();
				
			while (rs.next()){
				
				String stato = rs.getString("Stato");
				
				f=new Friendship(richiedente, ricevente , stato);
						
			}
			con.close();
			
		}
		catch (Exception e) {
			System.out.println("Errore con DB o Query errata");
			e.printStackTrace();
		}
		return f;
		 // End Friendship_status
		}
	
	public static ArrayList<Friendship> friendship_list(int ricevente)
	{
		ArrayList <Friendship> f_list= new ArrayList<Friendship>();
		
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://" + "127.0.0.1" + "/" + "loscobigbook" + "?" +
                    "user=" + "root" + "&password=" + "");
			
			
			PreparedStatement pstmt = con.prepareStatement(" SELECT * " + 
														   " FROM amicizia " + 
															" WHERE Ricevente = ? ");
			
			pstmt.setInt(1, ricevente);
			
			
			ResultSet rs = pstmt.executeQuery();
				
			while (rs.next()){
				
				int richiedente=rs.getInt("Richiedente");
				String stato = rs.getString("Stato");
				
				
				Friendship f=new Friendship(richiedente, ricevente , stato);
				
				f_list.add(f);		
			}	
			con.close();
			
		}
		catch (Exception e) {
			System.out.println("Errore con DB o Query errata");
			e.printStackTrace();
		}
		return f_list;
		 // End userByID
	}
	
	
	
}
