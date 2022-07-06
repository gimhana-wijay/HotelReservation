package reservation.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import reservation.pojo.Hotel;

/**
 *
 * @author Gimhana Sandakelum
 */
@Controller
public class TestController {

	@RequestMapping(value = "/test", method = RequestMethod.GET)
	public ModelAndView test(@ModelAttribute Hotel hotel) {
		ModelAndView model = new ModelAndView();
		model.setViewName("Test");
		return model;
	}
}
