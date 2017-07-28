package com.eagle.men_in_black.repository;

import java.util.HashMap;
import java.util.List;

import com.eagle.men_in_black.model.ServiceDto;


public interface ServiceDao {
	
	public List<ServiceDto> do_service_main(HashMap<String, String> map);
	public ServiceDto do_service_detail(int seq);
	public void do_service_reg(HashMap<String, String> map);
	public void do_service_update(HashMap<String, String> map);
	public int do_service_delete(int seq);
	public List<ServiceDto> do_event_main(HashMap<String, String> map); 
	public ServiceDto do_event_detail(int seq);
	public int do_event_reg(HashMap<String, String> map);
	public void do_event_update(HashMap<String, String> map);
	public int do_event_delete(int seq); 
	public int do_select_eventseq();
	public int do_event_photo(ServiceDto dto);
	public int do_insert_coupon(ServiceDto dto);
	public int do_select_couseq();
	public int do_inser_coupt(ServiceDto dto);
	public List<ServiceDto> do_select_couplist();
	public ServiceDto do_selelct_coupdt(int seq);
	public int check_coupon(HashMap<String, String> map);
	public void do_photo_update(ServiceDto dto);
	public int do_photo_delete(int seq);
	public void do_coup_update(ServiceDto dto);
	public void do_coupphoto_update(ServiceDto dto);
	public int do_coupphoto_delete(int seq); 
	public int do_coup_delete(int seq);
	
}
