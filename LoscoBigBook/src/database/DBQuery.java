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
															+ " AND password LIKE ? AND Cancellato=0;");
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
	
	public static String controllo_email(String email)
	{
		String dbemail="";
		
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://" + "127.0.0.1" + "/" + "loscobigbook" + "?" +
                    "user=" + "root" + "&password=" + "");
			
			
			PreparedStatement pstmt = con.prepareStatement(" SELECT email " + 
														   " FROM utente " + 
															" WHERE email LIKE ? ");
			pstmt.setString(1, email);
			
			
			ResultSet rs = pstmt.executeQuery();
				
			while (rs.next()){
				
				dbemail = rs.getString("Email");			
			}
			
			con.close();
			
		}
		catch (Exception e) {
			System.out.println("Errore con DB o Query errata");
			e.printStackTrace();
		}

		return dbemail;
	} // End controllo_email
	
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
														   " WHERE Ruolo like 'user' AND (Nome LIKE ? OR cognome LIKE ?) AND Cancellato='0';");
			
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
															" WHERE Ricevente = ? AND Stato='in attesa' ");
			
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
		 // End friendship_list
	}
	
	public static int friendship_confirm(int richiedente,int ricevente){
		int i=0;
		
		try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://" + "127.0.0.1" + "/" + "loscobigbook" + "?" + "user=" + "root" + "&password=" + "");
			
			
			PreparedStatement pstmt = con.prepareStatement(" UPDATE `amicizia` SET `Stato`= 'Confermata' WHERE (`Richiedente`= ? AND `Ricevente`= ?) LIMIT 1;");
		
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
	}// End UPDATE_utente
	
	
	public static int friendship_delete(int richiedente,int ricevente){
		int i=0;
		
		try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://" + "127.0.0.1" + "/" + "loscobigbook" + "?" + "user=" + "root" + "&password=" + "");
			
			
			PreparedStatement pstmt = con.prepareStatement(" DELETE FROM `amicizia` WHERE (`Richiedente`= ? AND `Ricevente`= ?) LIMIT 1;");
		
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
	}// End friendship_delete
	
	
	
	public static int friend_delete(int richiedente,int ricevente)
	{
		int i=0;
		
		try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://" + "127.0.0.1" + "/" + "loscobigbook" + "?" + "user=" + "root" + "&password=" + "");
			
			
			PreparedStatement pstmt = con.prepareStatement(" DELETE FROM `amicizia` WHERE ((`Richiedente`= ? AND `Ricevente`= ?) OR (`Richiedente`= ? AND `Ricevente`= ?)) AND Stato='Confermata' LIMIT 1;");
		
			pstmt.setInt(1, richiedente);
			pstmt.setInt(2, ricevente);
			
			pstmt.setInt(3, ricevente);
			pstmt.setInt(4, richiedente);
			
			i = pstmt.executeUpdate();
			
			con.close();
	}

		catch (Exception e) 
		{
			System.out.println("Errore con DB o Query errata");
			e.printStackTrace();
		}
		
		return i;
	}// End friendship_delete
	
	
	public static ArrayList<Friendship> confirmed_friend(int id)
	{
		ArrayList <Friendship> f_list= new ArrayList<Friendship>();
		
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://" + "127.0.0.1" + "/" + "loscobigbook" + "?" +
                    "user=" + "root" + "&password=" + "");
			
			
			PreparedStatement pstmt = con.prepareStatement(" SELECT * " + 
														   " FROM amicizia " + 
															" WHERE (Ricevente = ? OR Richiedente=?) AND Stato='Confermata' ");
			
			pstmt.setInt(1, id);
			pstmt.setInt(2, id);
			
			ResultSet rs = pstmt.executeQuery();
				
			while (rs.next()){
				
					int ricevente=rs.getInt("Ricevente");
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
	
	
	public static ArrayList<Utente> admin_list_user()
	{	
		Utente ut = null;
		ArrayList<Utente> user_list=new ArrayList<Utente>();
		
		
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://" + "127.0.0.1" + "/" + "loscobigbook" + "?" +
                    "user=" + "root" + "&password=" + "");
			
			
			PreparedStatement pstmt = con.prepareStatement(" SELECT * FROM utente WHERE Ruolo='user' AND Cancellato='0'; ");
														   
			
			ResultSet rs = pstmt.executeQuery();
				
			while (rs.next())
			{
				
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
				user_list.add(ut);
			}
			con.close();
			
		}
		catch (Exception e) {
			System.out.println("Errore con DB o Query errata");
			e.printStackTrace();
		}
		return user_list;
		 // End DB_Login_ByCookie.
	}
	
	
	public static int banna_user(int id)
	{
		int i=0;
		
		try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://" + "127.0.0.1" + "/" + "loscobigbook" + "?" + "user=" + "root" + "&password=" + "");
			
			
			PreparedStatement pstmt = con.prepareStatement(" UPDATE `utente` SET `Cancellato`= '1' WHERE (`ID`= ?) LIMIT 1;");
		
			pstmt.setInt(1, id);
			
			i = pstmt.executeUpdate();
			
			con.close();
	}

		catch (Exception e) 
		{
			System.out.println("Errore con DB o Query errata");
			e.printStackTrace();
		}
		
		return i;
	}// End banna_user
	
	public static int delete_user_friendship(int id)
	{
		int i=0;
		
		try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://" + "127.0.0.1" + "/" + "loscobigbook" + "?" + "user=" + "root" + "&password=" + "");
			
			
			PreparedStatement pstmt = con.prepareStatement(" DELETE FROM `amicizia` WHERE (`Richiedente`= ? OR Ricevente = ?) LIMIT 1;");
		
			pstmt.setInt(1, id);
			pstmt.setInt(2, id);
			
			
			i = pstmt.executeUpdate();
			
			con.close();
	}

		catch (Exception e) 
		{
			System.out.println("Errore con DB o Query errata");
			e.printStackTrace();
		}
		
		return i;
	}// End delete_user_friendship
	
public static int pubblica_post(int id, String post){
		
		int i=0;
		
		try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://" + "127.0.0.1" + "/" + "loscobigbook" + "?" + "user=" + "root" + "&password=" + "");
			
			
			PreparedStatement pstmt = con.prepareStatement(" INSERT INTO `post` "
					+ " (`Post`, `ID_utente`, `like`, `dislike`) "
					+ " VALUES (?, ? , 0 , 0); ");
			
			pstmt.setString(1, post);
			pstmt.setInt(2, id);
			
			
			i = pstmt.executeUpdate();
			
			con.close();
		
		}

		catch (Exception e) 
		{
			System.out.println("Errore con DB o Query errata");
			e.printStackTrace();
		}
		
		return i;
	}// End pubblica_post

public static int pubblica_commento(int id_utente, int id_post, String commento){
	
	int i=0;
	
	try{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://" + "127.0.0.1" + "/" + "loscobigbook" + "?" + "user=" + "root" + "&password=" + "");
		
		
		PreparedStatement pstmt = con.prepareStatement(" INSERT INTO `commenti` "
				+ " (`Commento`, `ID_utente`, `ID_post`, `like`, `dislike`) "
				+ " VALUES (?, ? , ?, 0 , 0); ");
		
		pstmt.setString(1, commento);
		pstmt.setInt(2, id_utente);
		pstmt.setInt(3, id_post);
				
		i = pstmt.executeUpdate();
		
		con.close();
	
	}

	catch (Exception e) 
	{
		System.out.println("Errore con DB o Query errata");
		e.printStackTrace();
	}
	
	return i;
}// End pubblica_post



public static ArrayList<Post> show_post_bacheca()
{
	ArrayList <Post> post_list= new ArrayList<Post>();
	
	try
	{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://" + "127.0.0.1" + "/" + "loscobigbook" + "?" +
                "user=" + "root" + "&password=" + "");
		
		
		PreparedStatement pstmt = con.prepareStatement("SELECT * FROM post ORDER BY ID DESC");
		
		ResultSet rs = pstmt.executeQuery();
			
		while (rs.next()){
			int id=rs.getInt("ID");
			String post=rs.getString("Post");
			int id_utente=rs.getInt("ID_utente");
			int like=rs.getInt("like");
			int dislike=rs.getInt("dislike");
			
			Post p=new Post(id,post,id_utente,like,dislike);
			
			post_list.add(p);		
		}	
		con.close();
		
	}
	catch (Exception e) {
		System.out.println("Errore con DB o Query errata");
		e.printStackTrace();
	}
	return post_list;
	 // End show_post_bacheca
}

public static ArrayList<Post> show_post_profile(int id_utente)
{
	ArrayList <Post> post_list= new ArrayList<Post>();
	
	try
	{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://" + "127.0.0.1" + "/" + "loscobigbook" + "?" +
                "user=" + "root" + "&password=" + "");
		
		
		PreparedStatement pstmt = con.prepareStatement(" SELECT * " + 
													   " FROM post " +
														" WHERE ID_utente=? ORDER BY ID DESC");
		
		pstmt.setInt(1, id_utente);
		ResultSet rs = pstmt.executeQuery();
			
		while (rs.next()){
			
			int id_post=rs.getInt("ID");
			String post=rs.getString("Post");
			int like=rs.getInt("like");
			int dislike=rs.getInt("dislike");
			
			Post p=new Post(id_post,post,id_utente,like,dislike);
			
			post_list.add(p);		
		}	
		con.close();
		
	}
	catch (Exception e) {
		System.out.println("Errore con DB o Query errata");
		e.printStackTrace();
	}
	return post_list;
	 // End show.post_profile
}

public static int like_post(int id)
{
	int i=0;
	
	try{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://" + "127.0.0.1" + "/" + "loscobigbook" + "?" + "user=" + "root" + "&password=" + "");
		
		
		PreparedStatement pstmt = con.prepareStatement(" UPDATE `post` SET post.`like`= post.`like`+1 WHERE (`ID`= ?)");
	
		pstmt.setInt(1, id);
		
		i = pstmt.executeUpdate();
		
		con.close();
}

	catch (Exception e) 
	{
		System.out.println("Errore con DB o Query errata");
		e.printStackTrace();
	}
	
	return i;
}// End like_post

public static int dislike_post(int id)
{
	int i=0;
	
	try{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://" + "127.0.0.1" + "/" + "loscobigbook" + "?" + "user=" + "root" + "&password=" + "");
		
		
		PreparedStatement pstmt = con.prepareStatement(" UPDATE `post` SET post.`dislike`= post.`dislike`+1 WHERE (`ID`= ?)");
	
		pstmt.setInt(1, id);
		
		i = pstmt.executeUpdate();
		
		con.close();
}

	catch (Exception e) 
	{
		System.out.println("Errore con DB o Query errata");
		e.printStackTrace();
	}
	
	return i;
}// End dislike_post

public static int non_like_post(int id)
{
	int i=0;
	
	try{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://" + "127.0.0.1" + "/" + "loscobigbook" + "?" + "user=" + "root" + "&password=" + "");
		
		
		PreparedStatement pstmt = con.prepareStatement(" UPDATE `post` SET post.`like`= post.`like`-1 WHERE (`ID`= ?)");
	
		pstmt.setInt(1, id);
		
		i = pstmt.executeUpdate();
		
		con.close();
}

	catch (Exception e) 
	{
		System.out.println("Errore con DB o Query errata");
		e.printStackTrace();
	}
	
	return i;
}// End non_like_post

public static int non_dislike_post(int id)
{
	int i=0;
	
	try{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://" + "127.0.0.1" + "/" + "loscobigbook" + "?" + "user=" + "root" + "&password=" + "");
		
		
		PreparedStatement pstmt = con.prepareStatement(" UPDATE `post` SET post.`dislike`= post.`dislike`-1 WHERE (`ID`= ?)");
	
		pstmt.setInt(1, id);
		
		i = pstmt.executeUpdate();
		
		con.close();
}

	catch (Exception e) 
	{
		System.out.println("Errore con DB o Query errata");
		e.printStackTrace();
	}
	
	return i;
}// End like_post

public static ArrayList<Commento> show_comment(int id_post)
{
	ArrayList <Commento> comment_list= new ArrayList<Commento>();
	
	try
	{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://" + "127.0.0.1" + "/" + "loscobigbook" + "?" +
                "user=" + "root" + "&password=" + "");
		
		
		PreparedStatement pstmt = con.prepareStatement(" SELECT * FROM commenti AS c JOIN utente AS u ON c.ID_utente=u.ID WHERE ID_post=? ORDER BY c.ID DESC");
		
		pstmt.setInt(1, id_post);
		
		ResultSet rs = pstmt.executeQuery();
			
		while (rs.next()){
			int id=rs.getInt("ID");
			String commento=rs.getString("Commento");
			int id_utente=rs.getInt("ID_utente");
			int like=rs.getInt("like");
			int dislike=rs.getInt("dislike");
			String nome=rs.getString("Nome");
			String cognome =rs.getString("Cognome");
			
			Commento c = new Commento(id, id_utente, id_post, commento, like, dislike,nome,cognome);
			
			comment_list.add(c);		
		}	
		con.close();
		
	}
	catch (Exception e) {
		System.out.println("Errore con DB o Query errata");
		e.printStackTrace();
	}
	return comment_list;
	 // End show_comment
}

public static int post_delete(int id_post){
	int i=0;
	
	try{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://" + "127.0.0.1" + "/" + "loscobigbook" + "?" + "user=" + "root" + "&password=" + "");
		
		
		PreparedStatement pstmt = con.prepareStatement(" DELETE FROM `post` WHERE `ID`= ? LIMIT 1;");
	
		pstmt.setInt(1, id_post);
		
		i = pstmt.executeUpdate();
		
		con.close();
}

	catch (Exception e) 
	{
		System.out.println("Errore con DB o Query errata");
		e.printStackTrace();
	}
	
	return i;
}// End post_delete

public static int delete_comments(int id_post)
{
	int i=0;
	
	try{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://" + "127.0.0.1" + "/" + "loscobigbook" + "?" + "user=" + "root" + "&password=" + "");
		
		
		PreparedStatement pstmt = con.prepareStatement(" DELETE FROM `commenti` WHERE ID_post=?");
	
		pstmt.setInt(1, id_post);	
		
		i = pstmt.executeUpdate();
		
		con.close();
}

	catch (Exception e) 
	{
		System.out.println("Errore con DB o Query errata");
		e.printStackTrace();
	}
	
	return i;
}// End delete_comments

public static int like_insert(int id_post, int id_utente){
	int i=0;
	try{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://" + "127.0.0.1" + "/" + "loscobigbook" + "?" + "user=" + "root" + "&password=" + "");
		
		
		PreparedStatement pstmt = con.prepareStatement(" INSERT INTO `like_post` (ID_post, `ID_utente`) VALUES (?, ?)");
		
		
		pstmt.setInt(1, id_post);
		pstmt.setInt(2, id_utente);
		
		
		i = pstmt.executeUpdate();
		
		con.close();
	}

	catch (Exception e) 
	{
		System.out.println("Errore con DB o Query errata");
		e.printStackTrace();
	}
	
	return i;
}// End like_insert

public static int dislike_insert(int id_post, int id_utente){
	int i=0;
	try{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://" + "127.0.0.1" + "/" + "loscobigbook" + "?" + "user=" + "root" + "&password=" + "");
		
		
		PreparedStatement pstmt = con.prepareStatement(" INSERT INTO `dislike_post` (ID_post, `ID_utente`) VALUES (?, ?)");
		
		
		pstmt.setInt(1, id_post);
		pstmt.setInt(2, id_utente);
		
		
		i = pstmt.executeUpdate();
		
		con.close();
	}

	catch (Exception e) 
	{
		System.out.println("Errore con DB o Query errata");
		e.printStackTrace();
	}
	
	return i;
}// End dislike_insert

public static int like_delete(int id_post, int id_utente){
	int i=0;
	try{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://" + "127.0.0.1" + "/" + "loscobigbook" + "?" + "user=" + "root" + "&password=" + "");
		
		
		PreparedStatement pstmt = con.prepareStatement(" DELETE FROM `like_post` WHERE ID_post=? AND ID_utente=?");
		
		pstmt.setInt(1, id_post);
		pstmt.setInt(2, id_utente);
		
		i = pstmt.executeUpdate();
		
		con.close();
	}

	catch (Exception e) 
	{
		System.out.println("Errore con DB o Query errata");
		e.printStackTrace();
	}
	
	return i;
}// End like_insert

public static int dislike_delete(int id_post, int id_utente){
	int i=0;
	try{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://" + "127.0.0.1" + "/" + "loscobigbook" + "?" + "user=" + "root" + "&password=" + "");
		
		
		PreparedStatement pstmt = con.prepareStatement(" DELETE FROM `dislike_post` WHERE ID_post=? AND ID_utente=?");
		
		pstmt.setInt(1, id_post);
		pstmt.setInt(2, id_utente);
		
		i = pstmt.executeUpdate();
		
		con.close();
	}

	catch (Exception e) 
	{
		System.out.println("Errore con DB o Query errata");
		e.printStackTrace();
	}
	
	return i;
}// End like_insert

public static Like check_like(int id_utente, int id_post)
{
	Like l=null;
	
	try
	{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://" + "127.0.0.1" + "/" + "loscobigbook" + "?" +
                "user=" + "root" + "&password=" + "");
		
		
		PreparedStatement pstmt = con.prepareStatement(" SELECT * " + 
													   " FROM like_post " +
														" WHERE ID_utente=? AND ID_post=?");
		
		pstmt.setInt(1, id_utente);
		pstmt.setInt(2, id_post);
		
		ResultSet rs = pstmt.executeQuery();
			
		while (rs.next()){
			
			int id=rs.getInt("ID");
			
			l= new Like(id, id_post, id_utente);
						
		}	
		con.close();
		
	}
	catch (Exception e) {
		System.out.println("Errore con DB o Query errata");
		e.printStackTrace();
	}
	return l;
	 // End check_like
}

public static Dislike check_dislike(int id_utente, int id_post)
{
	Dislike d=null;
	
	try
	{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://" + "127.0.0.1" + "/" + "loscobigbook" + "?" +
                "user=" + "root" + "&password=" + "");
		
		
		PreparedStatement pstmt = con.prepareStatement(" SELECT * " + 
													   " FROM dislike_post " +
														" WHERE ID_utente=? AND ID_post=?");
		
		pstmt.setInt(1, id_utente);
		pstmt.setInt(2, id_post);
		
		ResultSet rs = pstmt.executeQuery();
			
		while (rs.next()){
			
			int id=rs.getInt("ID");
			
			d= new Dislike(id, id_post, id_utente);
						
		}	
		con.close();
		
	}
	catch (Exception e) {
		System.out.println("Errore con DB o Query errata");
		e.printStackTrace();
	}
	return d;
	 // End check_dislike
}


// QUERY LIKE DISLIKE COMMENTI
public static int like_comment(int id)
{
	int i=0;
	
	try{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://" + "127.0.0.1" + "/" + "loscobigbook" + "?" + "user=" + "root" + "&password=" + "");
		
		
		PreparedStatement pstmt = con.prepareStatement(" UPDATE `commenti` SET commenti.`like`= commenti.`like`+1 WHERE (`ID`= ?)");
	
		pstmt.setInt(1, id);
		
		i = pstmt.executeUpdate();
		
		con.close();
}

	catch (Exception e) 
	{
		System.out.println("Errore con DB o Query errata");
		e.printStackTrace();
	}
	
	return i;
}// End like_post

public static int dislike_comment(int id)
{
	int i=0;
	
	try{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://" + "127.0.0.1" + "/" + "loscobigbook" + "?" + "user=" + "root" + "&password=" + "");
		
		
		PreparedStatement pstmt = con.prepareStatement(" UPDATE `commenti` SET commenti.`dislike`= commenti.`dislike`+1 WHERE (`ID`= ?)");
	
		pstmt.setInt(1, id);
		
		i = pstmt.executeUpdate();
		
		con.close();
}

	catch (Exception e) 
	{
		System.out.println("Errore con DB o Query errata");
		e.printStackTrace();
	}
	
	return i;
}// End dislike_post

public static int non_like_comment(int id)
{
	int i=0;
	
	try{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://" + "127.0.0.1" + "/" + "loscobigbook" + "?" + "user=" + "root" + "&password=" + "");
		
		
		PreparedStatement pstmt = con.prepareStatement(" UPDATE `commenti` SET commenti.`like`= commenti.`like`-1 WHERE (`ID`= ?)");
	
		pstmt.setInt(1, id);
		
		i = pstmt.executeUpdate();
		
		con.close();
}

	catch (Exception e) 
	{
		System.out.println("Errore con DB o Query errata");
		e.printStackTrace();
	}
	
	return i;
}// End non_like_post

public static int non_dislike_comment(int id)
{
	int i=0;
	
	try{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://" + "127.0.0.1" + "/" + "loscobigbook" + "?" + "user=" + "root" + "&password=" + "");
		
		
		PreparedStatement pstmt = con.prepareStatement(" UPDATE `commenti` SET commenti.`dislike`= commenti.`dislike`-1 WHERE (`ID`= ?)");
	
		pstmt.setInt(1, id);
		
		i = pstmt.executeUpdate();
		
		con.close();
}

	catch (Exception e) 
	{
		System.out.println("Errore con DB o Query errata");
		e.printStackTrace();
	}
	
	return i;
}// End like_post

public static int like_comment_insert(int id_commento, int id_utente){
	int i=0;
	try{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://" + "127.0.0.1" + "/" + "loscobigbook" + "?" + "user=" + "root" + "&password=" + "");
		
		
		PreparedStatement pstmt = con.prepareStatement(" INSERT INTO `like_comment` (ID_commento, `ID_utente`) VALUES (?, ?)");
		
		
		pstmt.setInt(1, id_commento);
		pstmt.setInt(2, id_utente);
		
		
		i = pstmt.executeUpdate();
		
		con.close();
	}

	catch (Exception e) 
	{
		System.out.println("Errore con DB o Query errata");
		e.printStackTrace();
	}
	
	return i;
}// End like_insert

public static int dislike_comment_insert(int id_commento, int id_utente){
	int i=0;
	try{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://" + "127.0.0.1" + "/" + "loscobigbook" + "?" + "user=" + "root" + "&password=" + "");
		
		
		PreparedStatement pstmt = con.prepareStatement(" INSERT INTO `dislike_comment` (ID_commento, `ID_utente`) VALUES (?, ?)");
		
		
		pstmt.setInt(1, id_commento);
		pstmt.setInt(2, id_utente);
		
		
		i = pstmt.executeUpdate();
		
		con.close();
	}

	catch (Exception e) 
	{
		System.out.println("Errore con DB o Query errata");
		e.printStackTrace();
	}
	
	return i;
}// End dislike_insert

public static int like_comment_delete(int id_commento, int id_utente){
	int i=0;
	try{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://" + "127.0.0.1" + "/" + "loscobigbook" + "?" + "user=" + "root" + "&password=" + "");
		
		
		PreparedStatement pstmt = con.prepareStatement(" DELETE FROM `like_comment` WHERE ID_commento=? AND ID_utente=?");
		
		pstmt.setInt(1, id_commento);
		pstmt.setInt(2, id_utente);
		
		i = pstmt.executeUpdate();
		
		con.close();
	}

	catch (Exception e) 
	{
		System.out.println("Errore con DB o Query errata");
		e.printStackTrace();
	}
	
	return i;
}// End like_insert

public static int dislike_comment_delete(int id_commento, int id_utente){
	int i=0;
	try{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://" + "127.0.0.1" + "/" + "loscobigbook" + "?" + "user=" + "root" + "&password=" + "");
		
		
		PreparedStatement pstmt = con.prepareStatement(" DELETE FROM `dislike_comment` WHERE ID_commento=? AND ID_utente=?");
		
		pstmt.setInt(1, id_commento);
		pstmt.setInt(2, id_utente);
		
		i = pstmt.executeUpdate();
		
		con.close();
	}

	catch (Exception e) 
	{
		System.out.println("Errore con DB o Query errata");
		e.printStackTrace();
	}
	
	return i;
}// End like_insert

public static Like check_like_comment(int id_utente, int id_commento)
{
	Like l=null;
	
	try
	{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://" + "127.0.0.1" + "/" + "loscobigbook" + "?" +
                "user=" + "root" + "&password=" + "");
		
		
		PreparedStatement pstmt = con.prepareStatement(" SELECT * " + 
													   " FROM like_comment " +
														" WHERE ID_utente=? AND ID_commento=?");
		
		pstmt.setInt(1, id_utente);
		pstmt.setInt(2, id_commento);
		
		ResultSet rs = pstmt.executeQuery();
			
		while (rs.next()){
			
			int id=rs.getInt("ID");
			
			l= new Like(id, id_commento, id_utente);
						
		}	
		con.close();
		
	}
	catch (Exception e) {
		System.out.println("Errore con DB o Query errata");
		e.printStackTrace();
	}
	return l;
	 // End check_like
}

public static Dislike check_dislike_comment(int id_utente, int id_commento)
{
	Dislike d=null;
	
	try
	{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://" + "127.0.0.1" + "/" + "loscobigbook" + "?" +
                "user=" + "root" + "&password=" + "");
		
		
		PreparedStatement pstmt = con.prepareStatement(" SELECT * " + 
													   " FROM dislike_comment " +
														" WHERE ID_utente=? AND ID_commento=?");
		
		pstmt.setInt(1, id_utente);
		pstmt.setInt(2, id_commento);
		
		ResultSet rs = pstmt.executeQuery();
			
		while (rs.next()){
			
			int id=rs.getInt("ID");
			
			d= new Dislike(id, id_commento, id_utente);
						
		}	
		con.close();
		
	}
	catch (Exception e) {
		System.out.println("Errore con DB o Query errata");
		e.printStackTrace();
	}
	return d;
	 // End check_dislike_comment
}

}