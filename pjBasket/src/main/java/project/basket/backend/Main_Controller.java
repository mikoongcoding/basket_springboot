package project.basket.backend;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/main/*")
public class Main_Controller {
	private Logger logger = LoggerFactory.getLogger(Main_Controller.class);
	
	@Autowired
	private Main_Logic main_logic = null;

	@PostMapping("try_login")
	public @ResponseBody List<Map<String, Object>> try_login(HttpSession session, @RequestParam Map<String, Object> pMap) {
		logger.info("try_login");
		return main_logic.try_login(session, pMap);
	}

}