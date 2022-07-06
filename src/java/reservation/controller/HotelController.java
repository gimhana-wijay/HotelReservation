package reservation.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import reservation.pojo.Hotel;
import reservation.service.HotelService;

/**
 *
 * @author Gimhana Sandakelum
 */
@Controller
public class HotelController {
	@Autowired
	HotelService hotelService;

	@RequestMapping(value = "/viewHotel", method = RequestMethod.GET)
	public ModelAndView viewHotel(@ModelAttribute Hotel hotel) {
		ModelAndView model = new ModelAndView();
		model.setViewName("Hotel");
		return model;
	}

	@RequestMapping(value = "/saveHotel", method = RequestMethod.POST)
	public String saveHotel(@ModelAttribute Hotel hotel, @RequestParam("image") String image) {

		System.out.println("name :" + hotel.getName());
		System.out.println("address :" + hotel.getAddress());
		System.out.println("email :" + hotel.getEmail());
		System.out.println("saveHotel desc***************" + hotel.getDescreption());
		System.out.println("saveHotel image***************" + image);

		if (null != hotel) {
			hotelService.saveHotel(hotel);
			System.out.println("save Hotel....." + hotel.getName());
		}
		return "redirect:/hotelList";
	}

	@RequestMapping(value = "/hotelList", method = RequestMethod.GET)
	public ModelAndView viewHotelList() {
		ModelAndView model = new ModelAndView();

		List<Hotel> hotelList = hotelService.getHotelList();
		System.out.println("view Hotel list....." + hotelList);
		model.addObject("hotelList", hotelList);

		model.setViewName("HotelList");
		return model;
	}

	@RequestMapping("/deleteHotel")
	public String deleteHotel(@RequestParam String id) {
		hotelService.deleteHotel(id);
		System.out.println("delete Hotel.....");
		return "redirect:/hotelList";
	}

	@RequestMapping("/editHotel")
	public ModelAndView editHotel(@RequestParam String id, @ModelAttribute Hotel hotel) {
		hotel = hotelService.searchHotel(id);
		Map<String, Object> map = new HashMap<String, Object>();
		System.out.println("get Hotel to update....." + hotel.getName());
		System.out.println("get Hotel to Location....." + hotel.getLocation());
		map.put("hotel", hotel);
		return new ModelAndView("UpdateHotel", "map", map);

	}

	@RequestMapping("/updateHotel")
	public String updateHotel(@ModelAttribute Hotel hotel) {

		System.out.println("GET  hotel id -->" + hotel.getHotelId());
		System.out.println("GET  hotel Name -->" + hotel.getName());
		System.out.println("GET  hotel Address -->" + hotel.getAddress());
		System.out.println("GET  hotel Address -->" + hotel.getDescreption());
		System.out.println("GET  hotel Email -->" + hotel.getEmail());
		System.out.println("GET  hotel Phone -->" + hotel.getPhone());
		System.out.println("GET  hotel Phone -->" + hotel.getStar());
		System.out.println("GET  hotel Enabled -->" + hotel.getEnabled());

		if (hotel != null) {
			hotelService.updateHotel(hotel);
			System.out.println("Updated Hotel....." + hotel.getName());

		}
		return "redirect:/hotelList";
	}

	@RequestMapping("/searchHotelData")
	public ModelAndView advanceSearchHotel(ModelMap modelMap, @RequestParam("name") String name,
			@RequestParam("phone") String phone, @RequestParam("email") String email,
			@RequestParam("enabled") String enabled, @ModelAttribute Hotel hotel) {
		System.out.println("name----" + name);
		System.out.println("phone---" + phone);
		System.out.println("email---" + email);
		System.out.println("enabled---" + enabled);

		List<Hotel> hotelList = hotelService.advanceSearchHotel(name, phone, email, enabled);
		System.out.println("hotelList is......" + hotelList.size());
		modelMap.addAttribute("hotelList", hotelList);
		return new ModelAndView("HotelSearchList");
	}

}
