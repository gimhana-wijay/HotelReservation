package reservation.service;

import java.util.List;

import reservation.pojo.Hotel;

/**
 *
 * @author Gimhana Sandakelum
 */
public interface HotelService {
	public int saveHotel(Hotel hotel);

	public List<Hotel> getHotelList();

	public void deleteHotel(String id);

	public Hotel searchHotel(String id);

	public void updateHotel(Hotel hotel);

	public List<Hotel> advanceSearchHotel(String name, String phone, String email, String enabled);

}
