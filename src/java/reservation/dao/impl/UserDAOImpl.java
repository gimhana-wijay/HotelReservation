package reservation.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate4.HibernateTemplate;
import org.springframework.stereotype.Repository;

import reservation.dao.UserDAO;
import reservation.db.DBConnection;
import reservation.dto.UserPasswordHistory;
import reservation.pojo.PasswordHistory;
import reservation.pojo.User;
import reservation.security.AES;

/**
 *
 * @author Gimhana Sandakelum
 */
@Repository
public class UserDAOImpl implements UserDAO {

	@Autowired
	SessionFactory sessionFactory;
	private HibernateTemplate hibernateTemplate;

	@Override
	public int saveUser(User user) {
		Session session = null;

		try {
			session = sessionFactory.openSession();
			System.out.println("save obj user.getName()........" + user.getName());

			String EnPswd = AES.doEncript(user.getPassword());
			String DePswd = AES.doDecript(EnPswd);
			System.out.println("encripted pswd -------------------->" + EnPswd);
			System.out.println("decripted pswd -------------------->" + DePswd);

			user.setPassword(EnPswd);
			session.save(user);

			// sendEmail(user.getEmail());
			// UserConfirmEmail.UserConfirmEmail(user.getEmail());
			try {
				processPasswordHistory(user.getUserName());
				savePasswordHistory(user);
			} catch (Exception e) {
				System.err.println("ERROR save savePasswordHistory >" + e);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return 0;
	}

	// search password history
	public boolean processPasswordHistory(String userName) {
		boolean status = false;
		System.out.println("searchPasswordHistory DAO Impl---------" + userName);

		List<PasswordHistory> lastList = null;

		try {
			String sql = "SELECT *FROM password_history  WHERE userName = '" + userName + "' order BY id";
			System.out.println("searchPasswordHistory query >" + sql);
			lastList = null;
			Session session = sessionFactory.openSession();

			try {
				SQLQuery query = session.createSQLQuery(sql);
				lastList = query.list();
				System.out.println("searchPasswordHistory lastList size --" + lastList.size());

				if (lastList.size() == 4) {
					PasswordHistory passwordHistory = lastList.get(1);
					System.out.println("searchPasswordHistory lastList 1 --" + passwordHistory.getId());
					int id = passwordHistory.getId();
					deletePasswordHistory(id);
				}

			} catch (HibernateException ex) {
				ex.printStackTrace();
			} finally {
				session.close();
			}
		} catch (Exception e) {
			System.err.println("ERROR searchPasswordHistory........." + e);
		}
		return status;
	}

	public boolean deletePasswordHistory(int id) {

		try {
			System.out.println("deletePasswordHistory id -" + id);
			Session session = sessionFactory.openSession();

			try {
				PasswordHistory history = (PasswordHistory) session.load(PasswordHistory.class, new Integer(id));

				if (null != history) {
					session.delete(history);
					session.flush();
				}

			} catch (HibernateException ex) {
				ex.printStackTrace();
			} finally {
				session.close();
			}
		} catch (Exception e) {
		}
		return true;
	}

	// save password history
	public static int savePasswordHistory(User user) throws ClassNotFoundException, SQLException {
		String sql = "Insert into password_history values(?,?,?,?)";
		System.out.println("savePasswordHistory sql >" + sql);
		Connection conn = DBConnection.getDBConnection().getConnection();
		PreparedStatement stm = conn.prepareStatement(sql);
		UserPasswordHistory history = new UserPasswordHistory();
		stm.setObject(1, history.getId());
		stm.setObject(2, user.getName());
		stm.setObject(3, user.getUserName());
		stm.setObject(4, user.getPassword());
		return stm.executeUpdate();

	}

//    sent email
	public static void sendEmail(String email) {
		System.out.println("send email run.........." + email);
		String to = email;// change accordingly
		String from = "gswijayavithana@gmail.com";
		String host = "255.255.255.0";// or IP address
		System.out.println("send email run to.........." + to);

		// Get the session object
		Properties properties = System.getProperties();
		properties.setProperty("mail.smtp.host", host);
		javax.mail.Session session = javax.mail.Session.getDefaultInstance(properties);

		// compose the message
		try {
			MimeMessage message = new MimeMessage(session);
			message.setFrom(new InternetAddress(from));
			message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
			message.setSubject("Ping");
			message.setText("Hello, this is example of sending email  ");

			// Send message
			Transport.send(message);
			System.out.println("message sent successfully....");

		} catch (MessagingException mex) {
			mex.printStackTrace();
		}
	}
//    sent email

	@Override
	public List<User> getUserList() {
		List<User> userList = new ArrayList<User>();
		Session session = null;
		try {
			session = sessionFactory.openSession();
			userList = session.getNamedQuery("User.findAll").list();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return userList;
	}

	@Override
	public void deleteUser(String id) {
		int intId = Integer.parseInt(id);
		System.out.println("deleteUser....DAOImpl -" + intId);
		Session session = sessionFactory.openSession();

		try {
			User user = (User) session.load(User.class, new Integer(intId));

			if (null != user) {
				session.delete(user);
				session.flush();
			}

		} catch (HibernateException ex) {
			ex.printStackTrace();
		} finally {
			session.close();
		}
	}

	@Override
	public User searchUser(String id) {
		int search_id = Integer.parseInt(id);
		System.out.println("searchUser id........" + search_id);

		Session session = sessionFactory.openSession();
		Transaction transaction = null;

		try {
			transaction = session.beginTransaction();
			User user = new User();
			Criteria cr2 = session.createCriteria(User.class).add(Restrictions.eq("userId", search_id));
			List<User> list = cr2.list();
			for (User user1 : list) {
				user.setUserId(user1.getUserId());
				user.setCountry(user1.getCountry());
				user.setName(user1.getName());
				user.setUserName(user1.getUserName());
				String DePswd = AES.doDecript(user1.getPassword());
				user.setPassword(DePswd);
				user.setAddress(user1.getAddress());
				user.setDescreption(user1.getDescreption());
				user.setEmail(user1.getEmail());
				user.setPhone(user1.getPhone());
				user.setUserType(user1.getUserType());
				user.setStatus(user1.getStatus());

			}

			transaction.commit();
			return user;

		} catch (HibernateException e) {
			e.printStackTrace();
			return null;
		} finally {
			session.close();
		}
	}

	@Override
	public void updateUser(User user) {
		Session session = sessionFactory.openSession();
		Transaction transaction = null;

		try {
			transaction = session.beginTransaction();
			Criteria cr2 = session.createCriteria(User.class).add(Restrictions.eq("id", user.getUserId()));
			List<User> cList = cr2.list();
			for (User user1 : cList) {
				user1.setUserId(user.getUserId());
				user1.setName(user.getName());
				user1.setUserName(user.getUserName());
				String EnPswd = AES.doEncript(user.getPassword());
				user1.setPassword(EnPswd);
				user1.setCountry(user.getCountry());
				user1.setAddress(user.getAddress());
				user1.setDescreption(user.getDescreption());
				user1.setEmail(user.getEmail());
				user1.setPhone(user.getPhone());
				user1.setUserType(user.getUserType());
				user1.setStatus(user.getStatus());
				session.update(user1);

				System.out.println("GET updated user id -->" + user.getUserId());
				System.out.println("GET updated user Name -->" + user.getName());
				System.out.println("GET updated user Address -->" + user.getAddress());
				System.out.println("GET updated user Address -->" + user.getDescreption());
				System.out.println("GET updated user Email -->" + user.getEmail());
				System.out.println("GET updated user Phone -->" + user.getPhone());
				System.out.println("GET updated user UT -->" + user.getUserType());
				System.out.println("GET updated user S -->" + user.getStatus());

			}

			transaction.commit();
			try {
				String EnPswd = AES.doEncript(user.getPassword());
				user.setPassword(EnPswd);
				savePasswordHistory(user);
			} catch (Exception e) {
				System.err.println("ERROR update savePasswordHistory >" + e);
			}
		} catch (HibernateException e) {
			e.printStackTrace();

		} finally {
			session.close();
		}
	}

	@Override
	public List<User> searchUser(String username, String password) {
		System.out.println("user username DAO Impl---------" + username);
		System.out.println("user password DAO Impl---------" + password);
		String EnPswd = AES.doEncript(password);

		List<User> lastList = null;

		try {
			String sql = "SELECT *FROM User WHERE userName = '" + username + "' and password = '" + EnPswd + "'";
			System.out.println("getDate after query >" + sql);
			lastList = null;
			Session session = sessionFactory.openSession();

			try {
				SQLQuery query = session.createSQLQuery(sql);
				lastList = query.list();
				System.out.println("lastList = query.list() -" + lastList);
			} catch (HibernateException ex) {
				ex.printStackTrace();
			} finally {
				session.close();
			}
		} catch (Exception e) {
			System.err.println("ERROR SEARCH RRESULT........." + e);
		}
		System.out.println("final result obj -" + lastList);
		return lastList;
	}

	@Override
	public List<User> advanceSearchUser(String name, String userName, String userType, String email) {
		System.out.println("advanceSearchUser DAO Impl name---------" + name);
		System.out.println("advanceSearchUser DAO Impl userName---------" + userName);
		System.out.println("advanceSearchUser DAO Impl userType---------" + userType);
		System.out.println("advanceSearchUser DAO Impl email---------" + email);

		List<User> lastList = null;

		try {
			String sql = "SELECT *FROM User WHERE name = '" + name + "' OR userName = '" + userName
					+ "' OR userType = '" + userType + "' OR email = '" + email + "'";
			System.out.println("getDate after query >" + sql);
			lastList = null;
			Session session = sessionFactory.openSession();

			try {
				SQLQuery query = session.createSQLQuery(sql);
				lastList = query.list();
				System.out.println("lastList = query.list() -" + lastList);
				for (User user : lastList) {
					System.out.println("ccccccccccccccccc>" + user.getUserName());

				}
			} catch (HibernateException ex) {
				ex.printStackTrace();
			} finally {
				session.close();
			}
		} catch (Exception e) {
			System.err.println("ERROR SEARCH RRESULT........." + e);
		}
		System.out.println("final result obj -" + lastList);
		return lastList;
	}

}
