package reservation.dto;

/**
 *
 * @author Gimhana Sandakelum
 */
public class RoomData {

	private int hotelId;
	private String hotelName;
	private int roomId;
	private String roomCode;
	private String roomType;
	private String bedType;
	private String roomEnabled;
	private long roomPrice;

	public int getHotelId() {
		return hotelId;
	}

	public void setHotelId(int hotelId) {
		this.hotelId = hotelId;
	}

	public String getHotelName() {
		return hotelName;
	}

	public void setHotelName(String hotelName) {
		this.hotelName = hotelName;
	}

	public int getRoomId() {
		return roomId;
	}

	public void setRoomId(int roomId) {
		this.roomId = roomId;
	}

	public String getRoomCode() {
		return roomCode;
	}

	public void setRoomCode(String roomCode) {
		this.roomCode = roomCode;
	}

	public String getRoomType() {
		return roomType;
	}

	public void setRoomType(String roomType) {
		this.roomType = roomType;
	}

	public String getBedType() {
		return bedType;
	}

	public void setBedType(String bedType) {
		this.bedType = bedType;
	}

	public String getRoomEnabled() {
		return roomEnabled;
	}

	public void setRoomEnabled(String roomEnabled) {
		this.roomEnabled = roomEnabled;
	}

	public long getRoomPrice() {
		return roomPrice;
	}

	public void setRoomPrice(long roomPrice) {
		this.roomPrice = roomPrice;
	}

}