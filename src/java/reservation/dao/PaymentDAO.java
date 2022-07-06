package reservation.dao;

import reservation.pojo.Payment;

/**
 *
 * @author Gimhana Sandakelum
 */
public interface PaymentDAO {
	public int savePayment(Payment payment);

	public Payment getSearchConfirmation(String data);

	public boolean deleteInventoryAfterPayment(String inventoryId, String roomCount);

}
