package reservation.dto;

/**
 *
 * @author Gimhana Sandakelum
 */
public class UserPasswordHistory {
	private String id;
	private String name;
	private String userName;
	private double userPassword;

	public UserPasswordHistory() {
	}

	public UserPasswordHistory(String id, String name, String userName, double userPassword) {
		this.id = id;
		this.name = name;
		this.userName = userName;
		this.userPassword = userPassword;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
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

	public double getUserPassword() {
		return userPassword;
	}

	public void setUserPassword(double userPassword) {
		this.userPassword = userPassword;
	}

	@Override
	public String toString() {
		return "UserPasswordHistory{" + "id=" + id + ", name=" + name + ", userName=" + userName + ", userPassword="
				+ userPassword + '}';
	}

}
