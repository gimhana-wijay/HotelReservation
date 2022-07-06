package reservation.dto;

/**
 *
 * @author Gimhana Sandakelum
 */
public class InventoryData {

	private int roomId;
	private String roomType;
	private String inventoryFrom;
	private String inventoryTo;
	private int inventoryCount;
	private String InventoryDates;

	public int getRoomId() {
		return roomId;
	}

	public void setRoomId(int roomId) {
		this.roomId = roomId;
	}

	public String getRoomType() {
		return roomType;
	}

	public void setRoomType(String roomType) {
		this.roomType = roomType;
	}

	public String getInventoryFrom() {
		return inventoryFrom;
	}

	public void setInventoryFrom(String inventoryFrom) {
		this.inventoryFrom = inventoryFrom;
	}

	public String getInventoryTo() {
		return inventoryTo;
	}

	public void setInventoryTo(String inventoryTo) {
		this.inventoryTo = inventoryTo;
	}

	public int getInventoryCount() {
		return inventoryCount;
	}

	public void setInventoryCount(int inventoryCount) {
		this.inventoryCount = inventoryCount;
	}

	public String getInventoryDates() {
		return InventoryDates;
	}

	public void setInventoryDates(String InventoryDates) {
		this.InventoryDates = InventoryDates;
	}

}
