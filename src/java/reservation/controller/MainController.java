package reservation.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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
public class MainController {
	@Autowired
	UserService userService;

	@RequestMapping(value = { "/", "/welcome**" }, method = RequestMethod.GET)
	public ModelAndView defaultPage() {
		ModelAndView model = new ModelAndView();
		model.setViewName("Loging");
		return model;

	}

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public ModelAndView login(@RequestParam("username") String username, @RequestParam("password") String password) {

		System.out.println("username------------" + username);
		System.out.println("password------------" + password);
		ModelAndView model = new ModelAndView();
		try {
			List<User> userList = userService.searchUser(username, password);
			System.out.println("viewSelectUser 0......" + userList.get(0));

			if (userList != null) {
				return new ModelAndView("Engine", "userList", userList);
			}
		} catch (Exception e) {
		}
		String errorMsg = "Invalid username or password";
		return new ModelAndView("Loging", "errorMsg", errorMsg);
	}
}
