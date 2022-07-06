package reservation.dao.impl;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import reservation.dao.RoomDAO;
import reservation.dto.RoomData;
import reservation.pojo.Hotel;
import reservation.pojo.Room;

/**
 *
 * @author Gimhana Sandakelum
 */
@Repository
public class RoomDAOImpl implements RoomDAO {
	@Autowired
	SessionFactory sessionFactory;

	@Override
	public int saveRoom(RoomData roomData) {
		Session session = null;

		try {
			session = sessionFactory.openSession();
			Room room = new Room();
			room.setRoomCode(roomData.getRoomCode());
			room.setRoomType(roomData.getRoomType());
			room.setBedType(roomData.getBedType());
			room.setRoomEnabled(roomData.getRoomEnabled());
			room.setRoomPrice(roomData.getRoomPrice());

			Hotel hotel = getHotelById(roomData.getHotelId());
			System.out.println("inside save room: Hotel Id :>" + hotel.getHotelId());
			room.setHotelId(hotel);
			session.save(room);

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return 0;
	}

	@Override
	public List<Hotel> lastHotels() {
		Session session = sessionFactory.openSession();
		List<Hotel> lastList = null;

		try {
			Query query = session.createQuery("SELECT h FROM Hotel h order by hotelId desc");
			query.setMaxResults(4);

			lastList = (List<Hotel>) query.list();
			System.out.println("============" + lastList.get(0));

		} catch (HibernateException ex) {
			ex.printStackTrace();
		} finally {
			session.close();
		}

		return lastList;

	}

	@Override
	public List<Room> getRoomList() {
		List<Room> roomList = new ArrayList<Room>();
		Session session = null;
		try {
			System.out.println("get Room List Impl....");
			session = sessionFactory.openSession();
			roomList = session.getNamedQuery("Room.findAll").list();
			System.out.println("get Room List Impl 0...." + roomList.get(0));

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return roomList;
	}

	public Hotel getHotelById(int hotelId) {
		Hotel hotel = null;
		Session session = null;
		try {
			session = sessionFactory.openSession();
			hotel = (Hotel) session.getNamedQuery("Hotel.findByHotelId").setParameter("hotelId", hotelId)
					.setMaxResults(1).uniqueResult();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return hotel;
	}

	@Override
	public void deleteRoom(String id) {
		int intId = Integer.parseInt(id);
		Session session = sessionFactory.openSession();

		try {
			Room room = (Room) session.load(Room.class, new Integer(intId));

			if (null != room) {
				session.delete(room);
				session.flush();
			}
			System.out.println("ROOM DELETED !");

		} catch (HibernateException ex) {
			ex.printStackTrace();
			System.err.println(")))))))))))))))))))))))))))))))))))))))))))))))))))))))))ERROR DELETE ROOM");
		} finally {
			session.close();
		}
	}

	@Override
	public Room searchRoom(String id) {
		int search_id = Integer.parseInt(id);
		System.out.println("searchRoom id........" + search_id);

		Session session = sessionFactory.openSession();
		Transaction transaction = null;

		try {
			transaction = session.beginTransaction();
			Room room = new Room();
			Criteria cr2 = session.createCriteria(Room.class).add(Restrictions.eq("roomId", search_id));
			List<Room> list = cr2.list();
			for (Room room1 : list) {
				room.setRoomId(room1.getRoomId());
				room.setRoomCode(room1.getRoomCode());
				room.setRoomType(room1.getRoomType());
				room.setBedType(room1.getBedType());
				room.setRoomEnabled(room1.getRoomEnabled());
				room.setRoomPrice(room1.getRoomPrice());
				room.setHotelId(room1.getHotelId());

				System.out.println("GET search getRoomId -->" + room.getRoomId());
				System.out.println("GET search getRoomCode -->" + room.getRoomCode());
				System.out.println("GET search getRoomType -->" + room.getRoomType());
				System.out.println("GET search room.getBedType -->" + room.getBedType());
				System.out.println("GET search room.getRoomEnabled -->" + room.getRoomEnabled());
				System.out.println("GET search room.getHotelId -->" + room.getHotelId());

			}

			transaction.commit();
			return room;

		} catch (HibernateException e) {
			e.printStackTrace();
			return null;
		} finally {
			session.close();
		}
	}

}
