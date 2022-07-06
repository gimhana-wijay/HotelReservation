package reservation.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import reservation.dto.RoomData;
import reservation.pojo.Hotel;
import reservation.pojo.Room;
import reservation.service.RoomService;

/**
 *
 * @author Gimhana Sandakelum
 */
@Controller
public class RoomController {
	@Autowired
	RoomService roomService;

	@RequestMapping(value = "/viewRoom", method = RequestMethod.GET)
	public ModelAndView viewRoom(@ModelAttribute RoomData roomData) {
		ModelAndView model = new ModelAndView();
		model.setViewName("Room");
		return model;
	}

	@RequestMapping(value = "/saveRoom", method = RequestMethod.POST)
	public String saveRoom(@ModelAttribute RoomData roomData) {
		System.out.println("SAVE ROOM-------------------------------------------------");
		System.out.println("hotelId ====================================" + roomData.getHotelId());
		System.out.println("roomType ====================================" + roomData.getRoomType());
		System.out.println("bedType ====================================" + roomData.getBedType());

		if (null != roomData) {

			roomService.saveRoom(roomData);

		}
		return "redirect:/roomList";
	}

	@RequestMapping(value = "viewSelectHotel")
	public ModelAndView viewSelectHotel() {
		List<Hotel> lastList = roomService.lastHotels();
		System.out.println("viewSelectHotel 0......" + lastList.get(0));

		return new ModelAndView("SelectHotel", "lastList", lastList);
	}

	@RequestMapping(value = "selectHotel")
	public String selectCustomer(@RequestParam String id, @RequestParam String name, HttpSession session) {

		session.setAttribute("hotelId", id);
		session.setAttribute("hotelName", name);

		return "redirect:/viewRoom";
	}

	@RequestMapping(value = "/roomList", method = RequestMethod.GET)
	public ModelAndView viewRoomList() {
		ModelAndView model = new ModelAndView();
		System.out.println("view Room list.....calling...");
		List<Room> roomList = roomService.getRoomList();
		System.out.println("view Room list....." + roomList);
		System.out.println("view Room 0 h....." + roomList.get(0).getHotelId());
		model.addObject("roomList", roomList);

		model.setViewName("RoomList");
		return model;
	}

	@RequestMapping(value = "/myRoomList", method = RequestMethod.GET)
	public ModelAndView viewHotelList() {
		ModelAndView model = new ModelAndView();
//        
//        List<Hotel> hotelList = hotelService.getHotelList();
//        System.out.println("view Hotel list....."+hotelList);
//        model.addObject("hotelList", hotelList);

		model.setViewName("MyRoomList");
		return model;
	}

	@RequestMapping("/deleteRoom")
	public String deleteRoom(@RequestParam String id) {
		roomService.deleteRoom(id);
		System.out.println("delete Hotel.....");
		return "redirect:/roomList";
	}

	@RequestMapping("/editRoom")
	public ModelAndView editRoom(@RequestParam String id, @ModelAttribute Room room) {
		room = roomService.searchRoom(id);
		Map<String, Object> map = new HashMap<String, Object>();
		System.out.println("get Room to update....." + room.getRoomId());
		map.put("room", room);
		return new ModelAndView("UpdateRoom", "map", map);

	}

	@RequestMapping("/updateRoom")
	public String updateRoom() {

//        System.out.println("GET  update to toom id -->"+room.getRoomId());
//        System.out.println("GET  update to RoomCode -->"+room.getRoomCode());
//        System.out.println("GET  update to RoomType -->"+room.getRoomType());
//        System.out.println("GET  update to BedType -->"+room.getBedType());
//        System.out.println("GET  update to RoomEnabled -->"+room.getRoomEnabled());
//        System.out.println("GET  update to HotelId -->"+room.getHotelId());

//        if (room != null) {
//            //hotelService.updateHotel(hotel);
//            System.out.println("Updated Room....."+room.getRoomId());
//            
//        }
		return "redirect:/roomList";
	}
}
