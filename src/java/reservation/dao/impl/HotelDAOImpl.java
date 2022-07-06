package reservation.dao.impl;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate4.HibernateTemplate;
import org.springframework.stereotype.Repository;

import reservation.dao.HotelDAO;
import reservation.pojo.Hotel;

/**
 *
 * @author Gimhana Sandakelum
 */
@Repository
public class HotelDAOImpl implements HotelDAO {

	@Autowired
	SessionFactory sessionFactory;
	private HibernateTemplate hibernateTemplate;

	@Override
	public int saveHotel(Hotel hotel) {
		Session session = null;

		try {
			session = sessionFactory.openSession();
			System.out.println("save obj hotel.getDescreption()........" + hotel.getDescreption());
			session.save(hotel);

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return 0;
	}

	@Override
	public List<Hotel> getHotelList() {
		List<Hotel> hotelList = new ArrayList<Hotel>();
		Session session = null;
		try {
			session = sessionFactory.openSession();
			hotelList = session.getNamedQuery("Hotel.findAll").list();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return hotelList;
	}

	@Override
	public void deleteHotel(String id) {
		int intId = Integer.parseInt(id);
		Session session = sessionFactory.openSession();

		try {
			Hotel hotel = (Hotel) session.load(Hotel.class, new Integer(intId));

			if (null != hotel) {
				session.delete(hotel);
				session.flush();
			}

		} catch (HibernateException ex) {
			ex.printStackTrace();
		} finally {
			session.close();
		}
	}

	@Override
	public Hotel searchHotel(String id) {
		int search_id = Integer.parseInt(id);
		System.out.println("searchHotel id........" + search_id);

		Session session = sessionFactory.openSession();
		Transaction transaction = null;

		try {
			transaction = session.beginTransaction();
			Hotel hotel = new Hotel();
			Criteria cr2 = session.createCriteria(Hotel.class).add(Restrictions.eq("hotelId", search_id));
			List<Hotel> list = cr2.list();
			for (Hotel hotel1 : list) {
				hotel.setHotelId(hotel1.getHotelId());
				hotel.setLocation(hotel1.getLocation());
				hotel.setName(hotel1.getName());
				hotel.setAddress(hotel1.getAddress());
				hotel.setDescreption(hotel1.getDescreption());
				hotel.setEmail(hotel1.getEmail());
				hotel.setPhone(hotel1.getPhone());
				hotel.setStar(hotel1.getStar());
				hotel.setEnabled(hotel1.getEnabled());

				System.out.println("GET search hotel id -->" + hotel.getHotelId());
				System.out.println("GET search hotel Name -->" + hotel.getName());
				System.out.println("GET search hotel Address -->" + hotel.getAddress());
				System.out.println("GET search hotel Descreption -->" + hotel.getDescreption());
				System.out.println("GET search hotel Email -->" + hotel.getEmail());
				System.out.println("GET search hotel Phone -->" + hotel.getPhone());
				System.out.println("GET search hotel Star -->" + hotel.getStar());
				System.out.println("GET search hotel Enabled -->" + hotel.getEnabled());

			}

			transaction.commit();
			return hotel;

		} catch (HibernateException e) {
			e.printStackTrace();
			return null;
		} finally {
			session.close();
		}
	}

	@Override
	public void updateHotel(Hotel hotel) {

		Session session = sessionFactory.openSession();
		Transaction transaction = null;

		try {
			transaction = session.beginTransaction();
			Criteria cr2 = session.createCriteria(Hotel.class).add(Restrictions.eq("id", hotel.getHotelId()));
			List<Hotel> cList = cr2.list();
			for (Hotel hotel1 : cList) {
				hotel1.setHotelId(hotel.getHotelId());
				hotel1.setName(hotel.getName());
				hotel1.setLocation(hotel.getLocation());
				hotel1.setAddress(hotel.getAddress());
				hotel1.setDescreption(hotel.getDescreption());
				hotel1.setEmail(hotel.getEmail());
				hotel1.setPhone(hotel.getPhone());
				hotel1.setStar(hotel.getStar());
				hotel1.setEnabled(hotel.getEnabled());
				session.update(hotel1);

				System.out.println("GET updated hotel id -->" + hotel.getHotelId());
				System.out.println("GET updated hotel Name -->" + hotel.getName());
				System.out.println("GET updated hotel Address -->" + hotel.getAddress());
				System.out.println("GET updated hotel Address -->" + hotel.getDescreption());
				System.out.println("GET updated hotel Email -->" + hotel.getEmail());
				System.out.println("GET updated hotel Phone -->" + hotel.getPhone());
				System.out.println("GET updated hotel Phone -->" + hotel.getStar());
				System.out.println("GET updated hotel Enabled -->" + hotel.getEnabled());

			}

			transaction.commit();

		} catch (HibernateException e) {
			e.printStackTrace();

		} finally {
			session.close();
		}

	}

	@Override
	public List<Hotel> advanceSearchHotel(String name, String phone, String email, String enabled) {
		System.out.println("advanceSearchHotel DAO Impl name---------" + name);
		System.out.println("advanceSearchHotel DAO Impl phone---------" + phone);
		System.out.println("advanceSearchHotel DAO Impl email---------" + email);
		System.out.println("advanceSearchHotel DAO Impl enabled---------" + enabled);

		List<Hotel> lastList = null;

		try {
			String sql = "SELECT *FROM Hotel WHERE name = '" + name + "' OR phone = '" + phone + "' OR email = '"
					+ email + "' OR enabled = '" + enabled + "'";
			System.out.println("getDate after query >" + sql);
			lastList = null;
			Session session = sessionFactory.openSession();

			try {
				SQLQuery query = session.createSQLQuery(sql);
				lastList = query.list();
				System.out.println("lastList = query.list() -" + lastList);
			} catch (HibernateException ex) {
				ex.printStackTrace();
			} finally {
				session.close();
			}
		} catch (Exception e) {
			System.err.println("ERROR SEARCH RRESULT........." + e);
		}
		System.out.println("final result obj -" + lastList);
		return lastList;
	}

}
