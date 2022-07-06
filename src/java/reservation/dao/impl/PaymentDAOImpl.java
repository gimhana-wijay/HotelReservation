package reservation.dao.impl;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import reservation.dao.PaymentDAO;
import reservation.pojo.Payment;

/**
 *
 * @author Gimhana Sandakelum
 */
@Repository
public class PaymentDAOImpl implements PaymentDAO {

	@Autowired
	SessionFactory sessionFactory;

	@Override
	public int savePayment(Payment payment) {
		Session session = null;

		try {
			session = sessionFactory.openSession();
			System.out.println("save obj payment ........" + payment.getName());
			session.save(payment);

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return 0;
	}

	@Override
	public Payment getSearchConfirmation(String data) {
		System.out.println("getSearchConfirmation parameters -" + data);
		Payment payment = null;
		Session session = null;
		try {
			session = sessionFactory.openSession();
			if (!data.equals("")) {
				payment = (Payment) session.getNamedQuery("Payment.findByEmail").setParameter("email", data)
						.setMaxResults(1).uniqueResult();
				System.out.println("QUERY RUN--getSearchConfirmation" + payment);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		System.out.println("getSearchConfirmation+++++++++++++++++++" + payment);
		return payment;

	}

	@Override
	public boolean deleteInventoryAfterPayment(String inventoryId, String roomCount) {
		boolean process = false;

		System.out.println("deleteInventoryAfterPayment impl values :" + inventoryId.substring(0, 3) + "|" + roomCount);
		return process;
	}

}
