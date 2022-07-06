package reservation.dao.impl;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import reservation.dao.InventoryDAO;
import reservation.dto.InventoryData;
import reservation.pojo.Inventory;
import reservation.pojo.Room;

/**
 *
 * @author Gimhana Sandakelum
 */
@Repository
public class InventoryDAOImpl implements InventoryDAO {

	@Autowired
	SessionFactory sessionFactory;

	@Override
	public List<Room> lastRooms() {
		Session session = sessionFactory.openSession();
		List<Room> lastList = null;

		try {
			Query query = session.createQuery("SELECT r FROM Room r order by roomId desc");
			query.setMaxResults(4);

			lastList = (List<Room>) query.list();
			System.out.println("lastRooms ============" + lastList.get(0));

		} catch (HibernateException ex) {
			ex.printStackTrace();
		} finally {
			session.close();
		}

		return lastList;

	}

	@Override
	public int saveInventory(InventoryData inventoryData) {
		Session session = null;

		try {
			session = sessionFactory.openSession();

			ArrayList<String> getDateList = new ArrayList<>();
			getDateList = buildInventoryList(inventoryData.getInventoryFrom(), inventoryData.getInventoryTo());

			System.out.println("getDateList.size***************" + getDateList.size());
			for (int i = 0; i < getDateList.size(); i++) {
				System.out.println("***************" + getDateList.get(i));

				Inventory inventory = new Inventory();
				inventory.setInventoryFrom(inventoryData.getInventoryFrom());
				inventory.setInventoryTo(inventoryData.getInventoryTo());
				inventory.setInventoryDates(getDateList.get(i));
				inventory.setInventoryCount(inventoryData.getInventoryCount());
				System.out.println("inventoryData.getRoomId() - " + inventoryData.getRoomId());

				Room room = getRoomById(inventoryData.getRoomId());
				System.out.println("inside save inventory: Room Id :>" + room.getRoomId());
				inventory.setRoomId(room);
				session.save(inventory);

			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return 0;

	}

	public Room getRoomById(int roomId) {
		Room room = null;
		Session session = null;
		try {
			session = sessionFactory.openSession();
			room = (Room) session.getNamedQuery("Room.findByRoomId").setParameter("roomId", roomId).setMaxResults(1)
					.uniqueResult();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return room;
	}

	public ArrayList buildInventoryList(String fromDate, String toDate) throws ParseException {
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
}
