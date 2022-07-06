package reservation.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import reservation.dao.SearchDAO;
import reservation.service.SearchService;

/**
 *
 * @author Gimhana Sandakelum
 */
@Service
public class SearchServiceImpl implements SearchService {

	@Autowired
	private SearchDAO searchDAO;

	@Override
	public List<Object[]> searchHotel(String location, String fromDate, String toDate, int roomCount, String roomType,
			String bedType) {
		return searchDAO.searchHotel(location, fromDate, toDate, roomCount, roomType, bedType);
	}

	@Override
	public List<Object[]> searchTest() {
		return searchDAO.searchTest();
	}

}
