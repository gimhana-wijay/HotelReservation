package reservation.service;

import java.util.List;

import reservation.pojo.User;

/**
 *
 * @author Gimhana Sandakelum
 */
public interface UserService {
	public int saveUser(User user);

	public List<User> getUserList();

	public void deleteUser(String id);

	public User searchUser(String id);

	public void updateUser(User user);

	public List<User> searchUser(String username, String password);

	public List<User> advanceSearchUser(String name, String userName, String userType, String email);

}
