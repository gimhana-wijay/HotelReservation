package reservation.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import reservation.pojo.Payment;
import reservation.service.PaymentService;

/**
 *
 * @author Gimhana Sandakelum
 */
@Controller
public class PaymentPageController {
	@Autowired
	PaymentService paymentService;

	@RequestMapping(value = "/viewPaymentPage", method = RequestMethod.GET)
	public ModelAndView viewPaymentPage(@ModelAttribute Payment payment) {
		ModelAndView model = new ModelAndView();
		model.setViewName("PaymentPage");
		return model;
	}

	@RequestMapping(value = "forPaymentPage")
	public String forPaymentPage(@RequestParam String hotelId, @RequestParam String hotelName,
			@RequestParam String hotelLocation, @RequestParam String hotelAddress, @RequestParam String hotelPhone,
			@RequestParam String hotelMail, @RequestParam String hotelStar, @RequestParam String hotelEnabled,

			@RequestParam String roomId, @RequestParam String roomCode, @RequestParam String roomType,
			@RequestParam String bedType, @RequestParam int price, @RequestParam String roomEnabled,

			@RequestParam String inventoryId, @RequestParam String dates, @RequestParam String fromDate,
			@RequestParam String toDate, @RequestParam int rooms, @RequestParam String userName,
			@RequestParam String userType, HttpSession session) {

		System.out.println("get parameter forPaymentPage hotelId..." + hotelId);
		System.out.println("get parameter forPaymentPage hotelName..." + hotelName);
		System.out.println("get parameter forPaymentPage hotelLocation..." + hotelLocation);
		System.out.println("get parameter forPaymentPage hotelAddress..." + hotelAddress);
		System.out.println("get parameter forPaymentPage hotelPhone..." + hotelPhone);
		System.out.println("get parameter forPaymentPage hotelMail..." + hotelMail);
		System.out.println("get parameter forPaymentPage hotelStar..." + hotelStar);
		System.out.println("get parameter forPaymentPage hotelEnabled..." + hotelEnabled);
		System.out.println("get parameter forPaymentPage roomType..." + roomType);
		System.out.println("get parameter forPaymentPage bedType..." + bedType);
		System.out.println("get parameter forPaymentPage price..." + price);
		System.out.println("get parameter forPaymentPage dates..." + dates);
		System.out.println("get parameter fromDate date..." + fromDate);
		System.out.println("get parameter toDate date..." + toDate);
		System.out.println("get parameter forPaymentPage rooms..." + rooms);

		session.setAttribute("hotelId", hotelId);
		session.setAttribute("hotelName", hotelName);
		session.setAttribute("hotelLocation", hotelLocation);
		session.setAttribute("hotelAddress", hotelAddress);
		session.setAttribute("hotelPhone", hotelPhone);
		session.setAttribute("hotelMail", hotelMail);
		session.setAttribute("hotelStar", hotelStar);
		session.setAttribute("hotelEnabled", hotelEnabled);

		session.setAttribute("roomId", roomId);
		session.setAttribute("roomCode", roomCode);
		session.setAttribute("roomType", roomType);
		session.setAttribute("bedType", bedType);
		session.setAttribute("allRoomsPrice", price * rooms);
		session.setAttribute("roomEnabled", roomEnabled);

		session.setAttribute("inventoryId", inventoryId);
		session.setAttribute("dates", dates);
		session.setAttribute("fromDate", fromDate);
		session.setAttribute("toDate", toDate);
		session.setAttribute("rooms", rooms);

		session.setAttribute("userName", userName);
		session.setAttribute("userType", userType);

		return "redirect:/viewPaymentPage";
	}

	@RequestMapping(value = "/paymentDetails", method = RequestMethod.POST)
	public String paymentDetails(ModelMap modelMap, @ModelAttribute Payment payment, HttpSession session) {
		ModelAndView model = new ModelAndView();
		System.out.println("paymentDetails getting............" + payment.getBookingType());

		System.out.println("savePayment getHotelID----------" + payment.getHotelID());
		System.out.println("savePayment getHotelName----------" + payment.getHotelName());
		System.out.println("savePayment getHotelLocation----------" + payment.getHotelLocation());
		System.out.println("savePayment getHotelAddress----------" + payment.getHotelAddress());
		System.out.println("savePayment getHotelPhone----------" + payment.getHotelPhone());
		System.out.println("savePayment getHotelEmail----------" + payment.getHotelEmail());
		System.out.println("savePayment getHotelStar----------" + payment.getHotelStar());
		System.out.println("savePayment getHotelEnabled----------" + payment.getHotelEnabled());

		System.out.println("savePayment getName----------" + payment.getName());
		System.out.println("savePayment getAddress----------" + payment.getAddress());
		System.out.println("savePayment getCountry----------" + payment.getCountry());
		System.out.println("savePayment getDescreption----------" + payment.getDescreption());
		System.out.println("savePayment getPhone----------" + payment.getPhone());
		System.out.println("savePayment getEmail----------" + payment.getEmail());
		System.out.println("savePayment getConfirm----------" + payment.getConfirm());

		if (null != payment) {
			paymentService.savePayment(payment);
			System.out.println("save payment....." + payment.getName());

			try {
				String inventoryId = (String) session.getAttribute("inventoryId");
				String roomCount = "2";
				System.out.println("deleteInventoryAfterPayment>>>>>>>>>>>>>>>");
				System.out.println("delete inventoryId....." + inventoryId);
				System.out.println("delete roomCount....." + roomCount);

				paymentService.deleteInventoryAfterPayment(inventoryId, roomCount);

			} catch (Exception e) {
			}
			session.setAttribute("key", payment.getEmail());

			// User
			session.setAttribute("userName", payment.getName());
			session.setAttribute("userCountry", payment.getCountry());
			session.setAttribute("userAddress", payment.getAddress());
			session.setAttribute("userDesc", payment.getDescreption());
			session.setAttribute("userPhone", payment.getPhone());
			session.setAttribute("userEmail", payment.getEmail());
			session.setAttribute("userConfirmStatus", payment.getConfirm());
			session.setAttribute("bookingType", payment.getBookingType());
			// Hotel
			session.setAttribute("hotelID", payment.getHotelID());
			session.setAttribute("hotelName", payment.getHotelName());
			session.setAttribute("hotelLocation", payment.getHotelLocation());
			session.setAttribute("hotelAddress", payment.getHotelAddress());
			session.setAttribute("hotelPhone", payment.getHotelPhone());
			session.setAttribute("hotelEmail", payment.getHotelEmail());
			session.setAttribute("hotelStar", payment.getHotelStar());
			session.setAttribute("hotelEnabled", payment.getHotelEnabled());
			// Room
			session.setAttribute("roomId", payment.getRoomId());
			session.setAttribute("roomCode", payment.getRoomCode());
			session.setAttribute("roomType", payment.getRoomType());
			session.setAttribute("bedType", payment.getBedType());
			session.setAttribute("roomEnabled(", payment.getRoomEnabled());
			session.setAttribute("allRoomsPrice", payment.getAllRoomsPrice());
			// Inventory
			session.setAttribute("inventoryId", payment.getInventoryId());
			session.setAttribute("inventoryFrom", payment.getInventoryFrom());
			session.setAttribute("inventoryTo", payment.getInventoryTo());
			session.setAttribute("inventoryCount", payment.getInventoryCount());
			session.setAttribute("inventoryDates", payment.getInventoryDates());

		}

		String bookingType = payment.getBookingType();
		if (bookingType.equals("offline")) {
			return "redirect:/viewConfirmationPage";
		} else {
			return "redirect:/viewOnlineBooking";
		}
	}

	@RequestMapping(value = "/viewOnlineBooking", method = RequestMethod.GET)
	public ModelAndView viewOnlineBooking(@ModelAttribute Payment payment, HttpSession session) {
		ModelAndView model = new ModelAndView();

		model.setViewName("OnlineBooking");
		return model;
	}

	@RequestMapping(value = "/viewOfflineBooking", method = RequestMethod.GET)
	public ModelAndView viewOfflineBooking(@ModelAttribute Payment payment, HttpSession session) {
		ModelAndView model = new ModelAndView();

		model.setViewName("OfflineBooking");
		return model;
	}

	@RequestMapping(value = "/viewConfirmationPage", method = RequestMethod.GET)
	public ModelAndView viewConfirmationPage(@ModelAttribute Payment payment, HttpSession session) {
		ModelAndView model = new ModelAndView();
		String data = (String) session.getAttribute("key");
		try {
			payment = paymentService.getSearchConfirmation(data);
			System.out.println("payment obj........" + payment);

		} catch (Exception e) {
			System.out.println("payment ERROR......" + e);

		}
		model.addObject("payment", payment);
		model.setViewName("ConfirmationPage");
		return model;
	}
}
