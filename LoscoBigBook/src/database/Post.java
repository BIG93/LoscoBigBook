package database;

public class Post {

	public int id;
	public String Post;
	public int ID_utente;
	public int like;
	public int dislike;

	public Post(int id,String Post, int ID_utente, int like, int dislike) {
		// TODO Auto-generated constructor stub
		this.id=id;
		this.Post=Post;
		this.ID_utente=ID_utente;
		this.like=like;
		this.dislike=dislike;
		

	}

}
