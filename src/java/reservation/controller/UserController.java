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

import reservation.pojo.User;
import reservation.service.UserService;

/**
 *
 * @author Gimhana Sandakelum
 */
@Controller
public class UserController {
	@Autowired
	UserService userService;

	@RequestMapping(value = "/viewUser", method = RequestMethod.GET)
	public ModelAndView viewHotel(@ModelAttribute User user) {
		ModelAndView model = new ModelAndView();
		model.setViewName("User");
		return model;
	}

	@RequestMapping(value = "/saveUser", method = RequestMethod.POST)
	public String saveUser(@ModelAttribute User user) {

		System.out.println("name :" + user.getName());
		System.out.println("country :" + user.getCountry());
		System.out.println("address :" + user.getAddress());
		System.out.println("desc :" + user.getDescreption());
		System.out.println("phone :" + user.getPhone());
		System.out.println("email :" + user.getEmail());
		System.out.println("type :" + user.getUserType());
		System.out.println("status :" + user.getStatus());

		if (null != user) {
			userService.saveUser(user);
			System.out.println("save user....." + user.getName());
		}

		return "redirect:/userList";
	}

	@RequestMapping(value = "/userList", method = RequestMethod.GET)
	public ModelAndView viewUserList() {
		ModelAndView model = new ModelAndView();

		List<User> userList = userService.getUserList();
		System.out.println("view User list....." + userList);
		model.addObject("userList", userList);

		model.setViewName("UserList");
		return model;
	}

	@RequestMapping("/deleteUser")
	public String deleteUser(@RequestParam String id) {
		try {
			System.out.println("get to delete User....." + id);
			userService.deleteUser(id);
			System.out.println("delete User....." + id);
		} catch (Exception e) {
		}
		return "redirect:/userList";
	}

	@RequestMapping("/editUser")
	public ModelAndView editUser(@RequestParam String id, @ModelAttribute User user) {
		user = userService.searchUser(id);
		Map<String, Object> map = new HashMap<String, Object>();
		System.out.println("get User to update....." + user.getName());
		System.out.println("get User to UserType....." + user.getUserType());
		map.put("user", user);
		return new ModelAndView("UpdateUser", "map", map);

	}

	@RequestMapping("/updateUser")
	public String updateUser(@ModelAttribute User user) {

		System.out.println("GET  user id -->" + user.getUserId());
		System.out.println("GET  user Name -->" + user.getName());
		System.out.println("GET  user Address -->" + user.getAddress());
		System.out.println("GET  user Address -->" + user.getDescreption());
		System.out.println("GET  user Email -->" + user.getEmail());
		System.out.println("GET  user Phone -->" + user.getPhone());
		System.out.println("GET  user UT -->" + user.getUserType());
		System.out.println("GET  user S -->" + user.getStatus());

		if (user != null) {
			userService.updateUser(user);
			System.out.println("Updated user....." + user.getName());

		}
		return "redirect:/userList";
	}

	@RequestMapping("/searchUserData")
	public ModelAndView advanceSearchUser(ModelMap modelMap, @RequestParam("name") String name,
			@RequestParam("userName") String userName, @RequestParam("userType") String userType,
			@RequestParam("email") String email, @ModelAttribute User user) {

		System.out.println("name----" + name);
		System.out.println("userName---" + userName);
		System.out.println("userType---" + userType);
		System.out.println("email---" + email);

		List<User> userList = userService.advanceSearchUser(name, userName, userType, email);
		System.out.println("userList is......" + userList.size());
		modelMap.addAttribute("userList", userList);
		return new ModelAndView("UserSearchList");
	}
}
