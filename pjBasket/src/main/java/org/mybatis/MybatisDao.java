package org.mybatis;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public final class MybatisDao {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate = null;
	
	private static final Logger logger = LoggerFactory.getLogger(MybatisDao.class);

	/******************************************************************************************
	 * 아래 메소드들 호출하는 예시코드 : MybatisDAO.getInstance().selectList(ss, "memList", pMap);
	 * @param ss : Logic에서 생성한 SqlSession객체
	 * @param sql : DB쿼리문 작성하는 xml파일의 id
	 * @param pMap : sql문에 필요한 값들 (검색조건, insert할 값 등)
	 * @return
	 */
	public List<Map<String, Object>> selectList(String sql, Map<String, Object> pMap) {
		logger.info("selectList - " + sql + "...");
		return sqlSessionTemplate.selectList(sql, pMap);
	}

	public Object selectObject(String sql, Map<String, Object> pMap) {
		logger.info("selectObject - " + sql + "...");
		return sqlSessionTemplate.selectOne(sql, pMap);
	}

	public Map<String, Object> selectMap(String sql, Map<String, Object> pMap) {
		logger.info("selectMap - " + sql + "...");
		return sqlSessionTemplate.selectOne(sql, pMap);
	}

	public int insert(String sql, Map<String, Object> pMap) {
		logger.info("insert - " + sql + "...");
		return sqlSessionTemplate.insert(sql, pMap);
	}

	public int update(String sql, Map<String, Object> pMap) {
		logger.info("update - " + sql + "...");
		return sqlSessionTemplate.update(sql, pMap);
	}

	public int delete(String sql, Map<String, Object> pMap) {
		logger.info("delete - " + sql + "...");
		return sqlSessionTemplate.update(sql, pMap);
	}

	public Map<String, Object> procedure(String sql, Map<String, Object> pMap) {
		logger.info("procedure - " + sql + "...");
		sqlSessionTemplate.update(sql, pMap);
		return pMap;
	}

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> openCursor(String sql, Map<String, Object> pMap) {
		logger.info("openCursor - " + sql + "...");
		sqlSessionTemplate.update(sql, pMap);
		return (List<Map<String, Object>>) pMap.get(sql);
	}
}
