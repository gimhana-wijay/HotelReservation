package reservation.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import reservation.dao.UserDAO;
import reservation.pojo.User;
import reservation.service.UserService;

/**
 *
 * @author Gimhana Sandakelum
 */
@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserDAO userDAO;

	@Override
	public int saveUser(User user) {
		return userDAO.saveUser(user);
	}

	@Override
	public List<User> getUserList() {
		return userDAO.getUserList();
	}

	@Override
	public void deleteUser(String id) {
		userDAO.deleteUser(id);
	}

	@Override
	public User searchUser(String id) {
		return userDAO.searchUser(id);
	}

	@Override
	public void updateUser(User user) {
		userDAO.updateUser(user);
	}

	@Override
	public List<User> searchUser(String username, String password) {
		return userDAO.searchUser(username, password);
	}

	@Override
	public List<User> advanceSearchUser(String name, String userName, String userType, String email) {
		return userDAO.advanceSearchUser(name, userName, userType, email);
	}

}
