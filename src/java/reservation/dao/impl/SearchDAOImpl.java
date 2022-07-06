package reservation.dao.impl;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import reservation.dao.SearchDAO;

/**
 *
 * @author Gimhana Sandakelum
 */
@Repository
public class SearchDAOImpl implements SearchDAO {

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public List<Object[]> searchHotel(String location, String fromDate, String toDate, int roomCount, String roomType,
			String bedType) {
//        String Searchdate = "";
//        String sql = "SELECT i.item_code,i.model,i.price,i.qty,i.warranty_period,v.brand,"
//                + "v.processor,v.screen,v.ram,v.hard,v.optical_drive,v.graphics,v.operating_system \n"
//                + "FROM item i,item_detail v WHERE (i.item_code=v.item_code AND brand like '%" + brand + "%' AND type like '%" + type + "%' AND model like '%" + model + "%' AND qty like '%" + qty + "%' AND price like '%" + price + "%')";

		System.out.println("SearchDAOImpl Query Parameters....." + location + "|" + fromDate + "|" + toDate + "|"
				+ roomCount + "|" + roomType + "|" + bedType);
		List<Object[]> result = null;
		ArrayList<String> getDateList = new ArrayList<>();
		try {
			getDateList = getInventorydates(fromDate, toDate);
			System.out.println("getDateList.size() is....." + getDateList.size());
			for (int i = 0; i < getDateList.size(); i++) {
				System.out.println("getDate>>>>>>>>>>>>>>>>>" + getDateList.get(i));
//                Searchdate = getDateList.get(i);

				String sql = "SELECT h.hotelID,r.roomId,i.inventoryId,h.name,h.location,h.address,h.phone,h.email,h.star,h.enabled,r.room_code,r.room_type,r.bed_type,r.room_enabled,r.room_price,i.inventory_dates,i.inventory_from ,i.inventory_to,i.inventory_count FROM hotel h JOIN room r ON h.hotelId=r.hotelId JOIN inventory i ON i.roomId=r.roomId WHERE i.inventory_dates='"
						+ getDateList.get(i) + "' and h.location='" + location + "' and i.inventory_count='" + roomCount
						+ "' and r.room_type='" + roomType + "' and r.bed_type='" + bedType + "'";
				System.out.println("getDate after query >" + sql);
				result = null;
				Session session = sessionFactory.openSession();

				try {
					SQLQuery query = session.createSQLQuery(sql);
					result = query.list();
					System.out.println("result = query.list() -" + result);
				} catch (HibernateException ex) {
					ex.printStackTrace();
				} finally {
					session.close();
				}
			}
		} catch (ParseException ex) {
			System.err.println("ERROR SEARCH RRESULT.........");
		}
		System.out.println("final result obj -" + result);
		return result;
	}

	public ArrayList getInventorydates(String fromDate, String toDate) throws ParseException {
		List<Date> dates = new ArrayList<Date>();
		ArrayList<String> allDates = new ArrayList<>();
		String str_date = fromDate;
		String end_date = toDate;

		DateFormat formatter;

		formatter = new SimpleDateFormat("yyyy-MM-dd");
		Date startDate = (Date) formatter.parse(str_date);
		Date endDate = (Date) formatter.parse(end_date);
		long interval = 24 * 1000 * 60 * 60;
		long endTime = endDate.getTime();
		long curTime = startDate.getTime();
		while (curTime <= endTime) {
			dates.add(new Date(curTime));
			curTime += interval;
		}
		for (int i = 0; i < dates.size(); i++) {
			Date lDate = (Date) dates.get(i);
			String ds = formatter.format(lDate);
			// System.out.println(" Date is -->." + ds);
			allDates.add(ds);
		}
		return allDates;
	}

	@Override
	public List<Object[]> searchTest() {
		List<Object[]> result = null;

		try {
			String sql = "SELECT h.hotelID,r.roomId,i.inventoryId,h.name,h.location,h.address,h.phone,h.email,h.star,h.enabled,r.room_code,r.room_type,r.bed_type,r.room_enabled,r.room_price,i.inventory_dates FROM hotel h JOIN room r ON h.hotelId=r.hotelId JOIN inventory i ON i.roomId=r.roomId;";
			System.out.println("getDate after query >" + sql);
			Session session = sessionFactory.openSession();

			try {
				SQLQuery query = session.createSQLQuery(sql);
				result = query.list();
				System.out.println("result = query.list() -" + result);
			} catch (HibernateException ex) {
				ex.printStackTrace();
			} finally {
				session.close();
			}
		} catch (Exception e) {
		}
		System.out.println("LIST............." + result.size());

		return result;
	}
}
