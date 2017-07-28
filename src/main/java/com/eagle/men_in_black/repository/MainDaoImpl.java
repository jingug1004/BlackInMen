package com.eagle.men_in_black.repository;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.eagle.men_in_black.model.MainDto;

@Repository
public class MainDaoImpl implements MainDao {

	private final String namespace="com.eagle.repository.mapper.Main";
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public MainDto do_search_pw(String id) {
		String statement = namespace+".do_search_pw";
		return sqlSession.selectOne(statement,id);
	}

	@Override
	public MainDto do_search_email(String email) {
		String statement = namespace+".do_search_email";
		return sqlSession.selectOne(statement,email);
	}

	@Override
	public int do_join_MIB(HashMap<String, String> map) {
		String statement = namespace+".do_join_MIB";
		return sqlSession.insert(statement,map);
		
	}

	@Override
	public List<MainDto> do_select_banner() {
		String statement = namespace+".do_select_banner";
		return sqlSession.selectList(statement);
	}

	@Override
	public List<MainDto> do_select_bestItem(String ITEM) {
		String statement = namespace+".do_select_bestItem";
		return sqlSession.selectList(statement,ITEM);
	}

	@Override
	public List<MainDto> do_select_subitemheader() {
		String statement = namespace+".do_select_subitemheader";
		return sqlSession.selectList(statement);
	}

	@Override
	public int do_insert_point(String USER_ID) {
		String statement = namespace+".do_insert_point";
		return sqlSession.insert(statement, USER_ID);
	}

	@Override
	public int do_insert_coup(String USER_ID) {
		String statement = namespace+".do_insert_coup";
		return sqlSession.insert(statement, USER_ID);
	}

	

}
