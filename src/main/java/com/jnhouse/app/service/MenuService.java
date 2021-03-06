package com.jnhouse.app.service;

import java.util.List;

import com.jnhouse.app.bean.Menu;

public interface MenuService extends BaseService<Menu>{

	   /** 
	    * 取得该等级下最大排序号
	    *  
	    * @return 
	    */  
	Integer findMaxValue(Menu menu);
	
	/**
	 * 通过用户id获取菜单列表
	 * @param id
	 * @return
	 */
	List<Menu> getMenuByUserId(Integer id);
}
