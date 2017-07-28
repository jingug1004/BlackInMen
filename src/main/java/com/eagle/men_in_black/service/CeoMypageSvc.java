package com.eagle.men_in_black.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.eagle.men_in_black.model.CeoMypageDto;

public interface CeoMypageSvc {
	public List<CeoMypageDto> do_ceomypage_main(HashMap<String, String> map);
	public List<CeoMypageDto> do_search_review(Map<String, Object> map);
	public List<CeoMypageDto> do_search_QnA(Map<String, Object> map);
	public String do_search_delstep(int SEQ);
	public int do_update_delstep(HashMap<String, String> map);
	public int do_insert_product(HashMap<String, String> map);
	public int do_insert_product_detail(List<CeoMypageDto> map);
	public int do_insert_product_photo(List<HashMap<String, String>> map);
	public int do_select_proseq();
	public List<String> do_search_subitem(String item);
	public List<CeoMypageDto> do_select_mainbanner(HashMap<String, String> map);
	public List<CeoMypageDto> do_select_mainbanpt(List<Integer> seqlist);
	public int do_insert_mainbanner(List<CeoMypageDto> map);
	public List<Integer> do_select_banseq(List<Integer> seqlist);
	public int do_insert_banpt(List<HashMap<String, String>> map);
	public int do_update_admre(CeoMypageDto dto);
	public CeoMypageDto do_select_cancle(int DEL_SEQ);
	public CeoMypageDto do_select_prophoceo(int PRO_SEQ);
	public CeoMypageDto do_select_maindetail(HashMap<String, Object> map);
	public int do_insert_canclepoint(HashMap<String, Object> map);
	public int do_update_canclecoup(int COUP_SEQ);
}
