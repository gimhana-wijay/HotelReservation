package reservation.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import reservation.dao.RoomDAO;
import reservation.dto.RoomData;
import reservation.pojo.Hotel;
import reservation.pojo.Room;
import reservation.service.RoomService;

/**
 *
 * @author Gimhana Sandakelum
 */
@Service
public class RoomServiceImpl implements RoomService {
	@Autowired
	private RoomDAO roomDAO;

	@Override
	public int saveRoom(RoomData roomData) {
		return roomDAO.saveRoom(roomData);
	}

	@Override
	public List<Hotel> lastHotels() {
		return roomDAO.lastHotels();
	}

	@Override
	public List<Room> getRoomList() {
		return roomDAO.getRoomList();
	}

	@Override
	public void deleteRoom(String id) {
		roomDAO.deleteRoom(id);
	}

	@Override
	public Room searchRoom(String id) {
		return roomDAO.searchRoom(id);
	}

}
