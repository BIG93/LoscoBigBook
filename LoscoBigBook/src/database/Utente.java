package database;

public class Utente {

	public String email = "";
	public String nome= "";
	public String cognome = "";
	public String sesso="";
	public String datanascita="";
	public String ruolo = "";
	public String luogonascita="";
	public String statosentimentale="";
	public String residenza="";
	
	public Utente(String email, String nome, String cognome,String sesso, String datanascita, String ruolo){
		this.nome = nome;
		this.email = email;
		this.cognome = cognome;
		this.sesso = sesso;
		this.datanascita = datanascita;
		this.ruolo = ruolo;
	}
	
	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getCognome() {
		return cognome;
	}

	public void setCognome(String cognome) {
		this.cognome = cognome;
	}

	public String getSesso() {
		return sesso;
	}

	public void setSesso(String sesso) {
		this.sesso = sesso;
	}

	public String getDatanascita() {
		return datanascita;
	}

	public void setDatanascita(String datanascita) {
		this.datanascita = datanascita;
	}

	public String getRuolo() {
		return ruolo;
	}

	public void setRuolo(String ruolo) {
		this.ruolo = ruolo;
	}

	public String getLuogonascita() {
		return luogonascita;
	}

	public void setLuogonascita(String luogonascita) {
		this.luogonascita = luogonascita;
	}

	public String getStatosentimentale() {
		return statosentimentale;
	}

	public void setStatosentimentale(String statosentimentale) {
		this.statosentimentale = statosentimentale;
	}

	public String getResidenza() {
		return residenza;
	}

	public void setResidenza(String residenza) {
		this.residenza = residenza;
	}
}
