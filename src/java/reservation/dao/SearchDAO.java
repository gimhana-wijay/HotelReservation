package reservation.dao;

import java.util.List;

/**
 *
 * @author Gimhana Sandakelum
 */
public interface SearchDAO {
	public List<Object[]> searchHotel(String location, String fromDate, String toDate, int roomCount, String roomType,
			String bedType);

	public List<Object[]> searchTest();

}
