package reservation.service;

import java.util.List;

import reservation.dto.RoomData;
import reservation.pojo.Hotel;
import reservation.pojo.Room;

/**
 *
 * @author Gimhana Sandakelum
 */
public interface RoomService {
	public int saveRoom(RoomData roomData);

	public List<Hotel> lastHotels();

	public List<Room> getRoomList();

	public void deleteRoom(String id);

	public Room searchRoom(String id);
}
