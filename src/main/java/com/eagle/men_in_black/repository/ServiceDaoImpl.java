package com.eagle.men_in_black.repository;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.eagle.men_in_black.model.ServiceDto;
import com.sun.mail.imap.protocol.Namespaces.Namespace;

@Repository
public class ServiceDaoImpl implements ServiceDao {
	Logger loger = LoggerFactory.getLogger(this.getClass());

	private final String namespace="com.eagle.repository.mapper.Service";
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public List<ServiceDto> do_service_main(HashMap<String, String> map) {
		String statement = namespace+".do_service_main";
		return sqlSession.selectList(statement, map);
	}

	@Override
	public ServiceDto do_service_detail(int seq) {
		String statement = namespace+".do_service_detail";
		return sqlSession.selectOne(statement, seq);
	}

	@Override
	public void do_service_reg(HashMap<String, String> map) {
		String statement = namespace+".do_service_reg";
		sqlSession.insert(statement,map);
	}

	@Override
	public void do_service_update(HashMap<String, String> map) {
		String statement = namespace+".do_service_update";
		sqlSession.update(statement, map);
		
	}

	@Override
	public int do_service_delete(int seq) {
		String statement = namespace+".do_service_delete";
		return sqlSession.delete(statement, seq);
	}

	@Override
	public List<ServiceDto> do_event_main(HashMap<String, String> map) {
		String statement = namespace+".do_event_main";
		return sqlSession.selectList(statement, map);
	}

	@Override
	public ServiceDto do_event_detail(int seq) {
		String statement = namespace+".do_event_detail";
		return sqlSession.selectOne(statement, seq);
	}

	@Override
	public int do_event_reg(HashMap<String, String> map) {
		String statement = namespace+".do_event_reg";
		return sqlSession.insert(statement,map);
		
	}

	@Override
	public void do_event_update(HashMap<String, String> map) {
		String statement = namespace+".do_event_update";
		sqlSession.update(statement, map);
		
	}

	@Override
	public int do_event_delete(int seq) {
		String statement = namespace+".do_event_delete";
		return sqlSession.delete(statement, seq);
	}

	@Override
	public int do_select_eventseq() {
		String statement = namespace+".do_select_eventseq";
		return sqlSession.selectOne(statement);
	}

	@Override
	public int do_event_photo(ServiceDto dto) {
		String statement = namespace+".do_event_photo";
		return sqlSession.insert(statement,dto);
	}

	@Override
	public int do_insert_coupon(ServiceDto dto) {
		String statement = namespace+".do_insert_coupon";
		return sqlSession.insert(statement,dto);
	}

	@Override
	public int do_select_couseq() {
		String statement = namespace+".do_select_couseq";
		return sqlSession.selectOne(statement);
	}

	@Override
	public int do_inser_coupt(ServiceDto dto) {
		String statement = namespace+".do_inser_coupt";
		return sqlSession.insert(statement,dto);
	}

	@Override
	public List<ServiceDto> do_select_couplist() {
		String statement = namespace+".do_select_couplist";
		return sqlSession.selectList(statement);
	}

	@Override
	public ServiceDto do_selelct_coupdt(int seq) {
		String statement = namespace+".do_selelct_coupdt";
		//loger.debug(seq+"");
	//	loger.debug(statement);
		return sqlSession.selectOne(statement,seq);
	}

	@Override
	public int check_coupon(HashMap<String, String> map) {
		String statement = namespace+".check_coupon";
		return sqlSession.selectOne(statement,map);
	}

	@Override
	public void do_photo_update(ServiceDto dto) {
		String statement = namespace+".do_photo_update";
		sqlSession.update(statement, dto);
	}

	@Override
	public int do_photo_delete(int seq) {
		String statement = namespace+".do_photo_delete";
		return sqlSession.delete(statement, seq);
	}

	@Override
	public void do_coup_update(ServiceDto dto) {
		String statement = namespace+".do_coup_update";
		sqlSession.update(statement, dto);
		
	}

	@Override
	public void do_coupphoto_update(ServiceDto dto) {
		String statement = namespace+".do_coupphoto_update";
		sqlSession.update(statement, dto);
		
	}

	@Override
	public int do_coupphoto_delete(int seq) {
		String statement = namespace+".do_coupphoto_delete";
		return sqlSession.delete(statement, seq);
	}

	@Override
	public int do_coup_delete(int seq) {
		String statement = namespace+".do_coup_delete";
		return sqlSession.delete(statement, seq);
	}

	
	
	

}
