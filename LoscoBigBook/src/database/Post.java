package database;

public class Post {
<<<<<<< HEAD
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
		
=======

public int id_post;
public String post;
public int id_utente;
public int like;
public int dislike;

	public Post(int id_post, String post, int id_utente, int like, int dislike) {
		// TODO Auto-generated constructor stub
		this.id_post=id_post;
		this.post=post;
		this.id_utente=id_utente;
		this.like=like;
		this.dislike=dislike;
>>>>>>> 5f335fd50bd848679217ab66d5d1d80f683f0efe
	}

}
