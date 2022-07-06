package reservation.service;

import java.util.List;

import reservation.dto.InventoryData;
import reservation.pojo.Room;

/**
 *
 * @author Gimhana Sandakelum
 */
public interface InventoryService {
	public List<Room> lastRooms();

	public int saveInventory(InventoryData inventoryData);

}
