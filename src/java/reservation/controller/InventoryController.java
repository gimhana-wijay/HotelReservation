package reservation.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import reservation.dto.InventoryData;
import reservation.pojo.Room;
import reservation.service.InventoryService;

/**
 *
 * @author Gimhana Sandakelum
 */
@Controller
public class InventoryController {
	@Autowired
	InventoryService inventoryService;

	@RequestMapping(value = "/viewInventory", method = RequestMethod.GET)
	public ModelAndView viewInventory(@ModelAttribute InventoryData inventoryData) {
		ModelAndView model = new ModelAndView();
		model.setViewName("Inventory");
		return model;
	}

	@RequestMapping(value = "viewSelectRoom")
	public ModelAndView viewSelectHotel() {
		List<Room> lastList = inventoryService.lastRooms();
		System.out.println("viewSelectRoom 0......" + lastList.get(0));

		return new ModelAndView("SelectRoom", "lastList", lastList);
	}

	@RequestMapping(value = "selectRoom")
	public String selectCustomer(@RequestParam String id, @RequestParam String type, HttpSession session) {

		session.setAttribute("roomId", id);
		session.setAttribute("roomType", type);

		return "redirect:/viewInventory";
	}

	@RequestMapping(value = "/saveInventory", method = RequestMethod.POST)
	public ModelAndView saveInventory(@ModelAttribute InventoryData inventoryData) {
		ModelAndView model = new ModelAndView();

		if (null != inventoryData) {

			inventoryService.saveInventory(inventoryData);
			System.out.println("RID ---->" + inventoryData.getRoomId());
			System.out.println("from ---->" + inventoryData.getInventoryFrom());
			System.out.println("To ---->" + inventoryData.getInventoryTo());
			System.out.println("count ---->" + inventoryData.getInventoryCount());
			model.setViewName("Inventory");
			System.out.println("get inventoryData to save --------------" + inventoryData);

		} else {
			System.out.println("-----save INVENTORY ERROR!!!!!!");
		}
		return model;
	}
}
