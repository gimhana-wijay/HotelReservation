package reservation.dao;

import java.util.List;

import reservation.dto.InventoryData;
import reservation.pojo.Room;

/**
 *
 * @author Gimhana Sandakelum
 */
public interface InventoryDAO {
	public List<Room> lastRooms();

	public int saveInventory(InventoryData inventoryData);

}
