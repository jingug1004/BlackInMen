package com.eagle.men_in_black.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.eagle.men_in_black.model.CategoryDto;
import com.eagle.men_in_black.repository.CategoryDao;

@Service
public class CategorySvcImpl implements CategorySvc {
	@Autowired
	private CategoryDao categoryDao;
	
	@Override
	public List<CategoryDto> do_selectCategoryProductList(HashMap<String, Object> map) {
		return categoryDao.do_selectCategoryProductList(map);
	}

	@Override
	public List<CategoryDto> do_selectSub_itemList(String ITEM) {
		return categoryDao.do_selectSub_itemList(ITEM);
	}

	@Override
	public List<CategoryDto> do_selectNewProductList(HashMap<String, Object> map) {
		return categoryDao.do_selectNewProductList(map);
	}

	@Override
	public List<CategoryDto> do_selectCategoryProductBestList(String ITEM) {
		return categoryDao.do_selectCategoryProductBestList(ITEM);
	}
}
