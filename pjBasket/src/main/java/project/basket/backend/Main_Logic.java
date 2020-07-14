package project.basket.backend;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.MybatisDao;
import org.mybatis.TestMapper;
import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.util.ViewPathWrapper;

@Service
@ComponentScan(basePackages={"org.mybatis"})
public class Main_Logic {
	private Logger logger = LoggerFactory.getLogger(Main_Logic.class);
	
	@Autowired 
	MybatisDao mybatisDao ;
	
	//관리자웹 admin 로그인
	protected List<Map<String, Object>> try_login(HttpSession session, @RequestParam Map<String, Object> pMap) {
		logger.info("Main_Logic try_login");
		List<Map<String, Object>> list = new ArrayList<>();
		try {
			mybatisDao.openCursor("admin_login", pMap);
			//로그인 성공시 첫화면으로 이동
			list = (List<Map<String, Object>>)pMap.get("admin_login");
			
			logger.info("sto_name : "+list.get(0).get("STO_NAME"));
			logger.info("sto_code : "+list.get(0).get("STO_CODE"));
			session.setAttribute("sto_name", list.get(0).get("STO_NAME"));
			session.setAttribute("sto_code", list.get(0).get("STO_CODE"));
			
			return list;
		} catch (Exception e) {
			logger.error(e.getMessage());
			return list; 
		}
	}

}
