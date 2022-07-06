package reservation.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import reservation.service.SearchService;

/**
 *
 * @author Gimhana Sandakelum
 */
@Controller
public class SearchController {

	@Autowired
	SearchService searchService;

	@RequestMapping(value = "/viewEngine", method = RequestMethod.GET)
	public ModelAndView viewRoom() {
		ModelAndView model = new ModelAndView();
		model.setViewName("Engine");
		return model;
	}

	@RequestMapping("/searchHotel")
	public ModelAndView editHotel(ModelMap modelMap, @RequestParam String location, @RequestParam String fromDate,
			@RequestParam String toDate, @RequestParam int roomCount, @RequestParam String roomType,
			@RequestParam String bedType, @RequestParam String userName, @RequestParam String userType,
			HttpSession session) {

//         String from = fromDate.replaceAll("-", "/");
//         String to = toDate.replaceAll("-", "/");
		System.out.println("Start Search location...." + location);
		System.out.println("Start Search fomDate...." + fromDate);
		System.out.println("Start Search toDate...." + toDate);
		System.out.println("Start Search roomCount...." + roomCount);
		System.out.println("Start Search roomType...." + roomType);
		System.out.println("Start Search bedType...." + bedType);

		System.out.println("Start Search userName...." + userName);
		System.out.println("Start Search userType...." + userType);
		session.setAttribute("userName", userName);
		session.setAttribute("userType", userType);
//        hotel = hotelService.searchHotel(id);
//        Map<String, Object> map = new HashMap<String, Object>();
//        System.out.println("get Hotel to update....."+hotel.getName());
//        System.out.println("get Hotel to Location....."+hotel.getLocation());
//        map.put("hotel", hotel);
		List<Object[]> hotelResult = searchService.searchHotel(location, fromDate, toDate, roomCount, roomType,
				bedType);
		System.out.println("hotelResult is......" + hotelResult.size());
		modelMap.addAttribute("hotelResult", hotelResult);
		return new ModelAndView("SearchHotelList");

	}

	@RequestMapping("/searchTest")
	public ModelAndView searchTest(ModelMap modelMap) {

		List<Object[]> hotelResult = searchService.searchTest();
		System.out.println("hotelResult is......" + hotelResult.size());
		modelMap.addAttribute("hotelResult", hotelResult);
		return new ModelAndView("SearchHotel");

	}
}
