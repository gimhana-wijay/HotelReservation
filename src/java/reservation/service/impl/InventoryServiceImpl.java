package reservation.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import reservation.dao.InventoryDAO;
import reservation.dto.InventoryData;
import reservation.pojo.Room;
import reservation.service.InventoryService;

/**
 *
 * @author Gimhana Sandakelum
 */
@Service
public class InventoryServiceImpl implements InventoryService {

	@Autowired
	private InventoryDAO inventoryDAO;

	@Override
	public List<Room> lastRooms() {
		return inventoryDAO.lastRooms();
	}

	@Override
	public int saveInventory(InventoryData inventoryData) {
		return inventoryDAO.saveInventory(inventoryData);
	}

}
