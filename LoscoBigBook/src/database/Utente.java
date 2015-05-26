package database;

public class Utente {
	public String email = "";
	public String nome= "";
	public String cognome = "";
	public String sesso="";
	public String datanascita="";
	public String ruolo = "";
	
	public Utente(String email, String nome, String cognome,String sesso, String datanascita, String ruolo){
		this.nome = nome;
		this.email = email;
		this.cognome = cognome;
		this.sesso = sesso;
		this.datanascita = datanascita;
		this.ruolo = ruolo;
	}
}
