package reservation.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import reservation.dao.PaymentDAO;
import reservation.pojo.Payment;
import reservation.service.PaymentService;

/**
 *
 * @author Gimhana Sandakelum
 */
@Service
public class PaymentServiceImpl implements PaymentService {

	@Autowired
	private PaymentDAO paymentDAO;

	@Override
	public int savePayment(Payment payment) {
		return paymentDAO.savePayment(payment);
	}

	@Override
	public Payment getSearchConfirmation(String data) {
		return paymentDAO.getSearchConfirmation(data);
	}

	@Override
	public boolean deleteInventoryAfterPayment(String inventoryId, String roomCount) {
		return paymentDAO.deleteInventoryAfterPayment(inventoryId, roomCount);
	}

}
