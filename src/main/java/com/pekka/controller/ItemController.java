package com.pekka.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pekka.common.pojo.EasyUIDataGridResult;
import com.pekka.common.pojo.PekkaResult;
import com.pekka.pojo.TbItem;
import com.pekka.service.ItemService;

@Controller
public class ItemController {

	@Autowired
	private ItemService itemService;

	/**
	 * 查询商品
	 * 
	 * @param page
	 *            当前页码
	 * @param rows
	 *            每页显示数量
	 * @return
	 */
	@RequestMapping(value = "/item/list", method = RequestMethod.GET)
	@ResponseBody
	public EasyUIDataGridResult getItemList(Integer page, Integer rows) {
		return itemService.getItemList(page, rows);
	}

	/**
	 * 新增商品
	 * 
	 * @param item
	 *            商品对象(不含描述)
	 * @param desc
	 *            商品描述
	 * @return
	 */
	@RequestMapping("/item/save")
	@ResponseBody
	public PekkaResult itemSave(TbItem item, String desc) {
		PekkaResult result = itemService.addItem(item, desc);
		return result;
	}

	/**
	 * 查询商品描述
	 * 
	 * @param itemId
	 *            商品id
	 * @return
	 */
	@RequestMapping("/rest/item/query/item/desc/{itemId}")
	@ResponseBody
	public PekkaResult getItemDesc(@PathVariable Long itemId) {
		PekkaResult result = itemService.getItemDesc(itemId);
		return result;
	}

	/**
	 * 更新商品
	 * 
	 * @param item
	 *            商品
	 * @param desc
	 *            描述
	 * @return
	 */
	@RequestMapping("/rest/item/update")
	@ResponseBody
	public PekkaResult updateItem(TbItem item, String desc) {
		PekkaResult result = itemService.updateItem(item, desc);
		return result;
	}

	/**
	 * 删除商品
	 * 
	 * @param ids
	 *            所有待删除商品的id
	 * @return
	 */
	@RequestMapping("/rest/item/delete")
	@ResponseBody
	public PekkaResult deleteItem(Long[] ids) {
		PekkaResult result = itemService.deleteItem(ids);
		return result;
	}

	/**
	 * 下架商品
	 * 
	 * @param ids
	 *            所有待下架商品的id
	 * @return
	 */
	@RequestMapping("/rest/item/instock")
	@ResponseBody
	public PekkaResult instock(Long[] ids) {
		PekkaResult result = itemService.instock(ids);
		return result;
	}

	/**
	 * 上架商品
	 * 
	 * @param ids
	 *            所有待上架商品的id
	 * @return
	 */
	@RequestMapping("/rest/item/reshelf")
	@ResponseBody
	public PekkaResult reshelf(Long[] ids) {
		PekkaResult result = itemService.reshelf(ids);
		return result;
	}

}
