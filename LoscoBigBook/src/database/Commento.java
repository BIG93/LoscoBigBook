package database;

public class Commento {
	
	public int ID;
	public int ID_utente;
	public int ID_post;
	public String testo;
	public int like;
	public int dislike;
	public String nome;
	public String cognome;

	public Commento(int ID, int ID_utente, int ID_post, String testo, int like,int dislike,String nome, String cognome) {	
		this.ID = ID;
		this.ID_utente = ID_utente;
		this.ID_post = ID_post;
		this.testo = testo;
		this.like = like;
		this.dislike = dislike;
		this.nome=nome;
		this.cognome=cognome;
	}
}
