package reservation.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import reservation.dao.HotelDAO;
import reservation.pojo.Hotel;
import reservation.service.HotelService;

/**
 *
 * @author Gimhana Sandakelum
 */
@Service
public class HotelServiceImpl implements HotelService {

	@Autowired
	private HotelDAO hotelDAO;

	@Override
	public int saveHotel(Hotel hotel) {
		return hotelDAO.saveHotel(hotel);
	}

	@Override
	public List<Hotel> getHotelList() {
		return hotelDAO.getHotelList();
	}

	@Override
	public void deleteHotel(String id) {
		hotelDAO.deleteHotel(id);
	}

	@Override
	public Hotel searchHotel(String id) {
		return hotelDAO.searchHotel(id);
	}

	@Override
	public void updateHotel(Hotel hotel) {
		hotelDAO.updateHotel(hotel);
	}

	@Override
	public List<Hotel> advanceSearchHotel(String name, String phone, String email, String enabled) {
		return hotelDAO.advanceSearchHotel(name, phone, email, enabled);
	}

}
