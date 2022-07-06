package reservation.email;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

/**
 *
 * @author Gimhana Sandakelum
 */
public class UserConfirmEmail {
	public static void UserConfirmEmail(String email) {
		System.out.println("UserConfirmEmail>>>>>" + email);
		final String username = email;
		final String password = "password";

		Properties prop = new Properties();
		prop.put("mail.smtp.host", "192.168.43.102");
		prop.put("mail.smtp.port", "25");
		prop.put("mail.smtp.auth", "true");
		prop.put("mail.smtp.starttls.enable", "true"); // TLS

		Session session = Session.getInstance(prop, new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(username, password);
			}
		});
		try {

			Message message = new MimeMessage(session);
			message.setFrom(new InternetAddress("gswijayavithana@gmail.com"));
			message.setRecipients(Message.RecipientType.TO,
					InternetAddress.parse("to_username_a@gmail.com, to_username_b@yahoo.com"));
			message.setSubject("User Confirm Email");
			message.setText("Hi," + "\n\n This is User Confirm Email.");

			Transport.send(message);

			System.out.println("User Confirm Email Done.....");

		} catch (MessagingException e) {
			e.printStackTrace();
		}
	}
}
