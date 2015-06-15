package database;

public class Dislike {
	
	public int ID;
	public int oggetto;
	public int ID_utente;

	public Dislike(int ID, int oggetto, int ID_utente) {
		this.ID = ID;
		this.oggetto = oggetto;
		this.ID_utente = ID_utente;
	}

}