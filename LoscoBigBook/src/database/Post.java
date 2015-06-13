package database;

public class Post {

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
	}

}
