package reservation.service;

import reservation.pojo.Payment;

/**
 *
 * @author Gimhana Sandakelum
 */
public interface PaymentService {
	public int savePayment(Payment payment);

	public Payment getSearchConfirmation(String data);

	public boolean deleteInventoryAfterPayment(String inventoryId, String roomCount);

}
