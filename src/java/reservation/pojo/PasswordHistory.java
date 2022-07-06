package reservation.pojo;

import java.io.Serializable;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.validation.constraints.Size;

/**
 *
 * @author Gimhana Sandakelum
 */
@Entity
@Table(name = "password_history")
@NamedQueries({ @NamedQuery(name = "PasswordHistory.findAll", query = "SELECT p FROM PasswordHistory p"),
		@NamedQuery(name = "PasswordHistory.findById", query = "SELECT p FROM PasswordHistory p WHERE p.id = :id"),
		@NamedQuery(name = "PasswordHistory.findByName", query = "SELECT p FROM PasswordHistory p WHERE p.name = :name"),
		@NamedQuery(name = "PasswordHistory.findByUserName", query = "SELECT p FROM PasswordHistory p WHERE p.userName = :userName"),
		@NamedQuery(name = "PasswordHistory.findByUserPassword", query = "SELECT p FROM PasswordHistory p WHERE p.userPassword = :userPassword") })
public class PasswordHistory implements Serializable {

	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Basic(optional = false)
	@Column(name = "id")
	private Integer id;
	@Size(max = 45)
	@Column(name = "name")
	private String name;
	@Size(max = 45)
	@Column(name = "userName")
	private String userName;
	@Size(max = 45)
	@Column(name = "userPassword")
	private String userPassword;

	public PasswordHistory() {
	}

	public PasswordHistory(Integer id) {
		this.id = id;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserPassword() {
		return userPassword;
	}

	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}

	@Override
	public int hashCode() {
		int hash = 0;
		hash += (id != null ? id.hashCode() : 0);
		return hash;
	}

	@Override
	public boolean equals(Object object) {
		// TODO: Warning - this method won't work in the case the id fields are not set
		if (!(object instanceof PasswordHistory)) {
			return false;
		}
		PasswordHistory other = (PasswordHistory) object;
		if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
			return false;
		}
		return true;
	}

	@Override
	public String toString() {
		return "reservation.pojo.PasswordHistory[ id=" + id + " ]";
	}

}
