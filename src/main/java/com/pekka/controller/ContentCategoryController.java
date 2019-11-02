package com.pekka.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pekka.common.pojo.EasyUITreeNote;
import com.pekka.common.pojo.PekkaResult;
import com.pekka.content.service.ContentCategoryService;

@Controller
public class ContentCategoryController {

	@Autowired
	private ContentCategoryService contentCategoryService;

	/**
	 * 获取内容分类列表
	 * 
	 * @param parentId
	 *            当前节点id，也是子节点的父id
	 * @return
	 */
	@RequestMapping("/content/category/list")
	@ResponseBody
	public List<EasyUITreeNote> getContentCategoryList(@RequestParam(value = "id", defaultValue = "0") Long parentId) {
		List<EasyUITreeNote> list = contentCategoryService.getContentCategoryList(parentId);
		return list;
	}

	/**
	 * 新增节点
	 * 
	 * @param parentId
	 *            父节点id
	 * @param text
	 *            新增节点的名字
	 * @return
	 */
	@RequestMapping("/content/category/create")
	@ResponseBody
	public PekkaResult addContentCategory(Long parentId, @RequestParam(value = "name") String text) {
		PekkaResult result = contentCategoryService.addContentCategory(parentId, text);
		return result;
	}

	/**
	 * 重命名节点
	 * 
	 * @param id
	 *            节点id
	 * @param text
	 *            节点名字
	 * @return
	 */
	@RequestMapping("/content/category/update")
	@ResponseBody
	public PekkaResult updateContentCategory(Long id, @RequestParam(value = "name") String text) {
		PekkaResult result = contentCategoryService.updateContentCategory(id, text);
		return result;
	}

	/**
	 * 删除节点
	 * 
	 * @param id
	 *            节点id
	 * @return
	 */
	@RequestMapping("/content/category/delete")
	@ResponseBody
	public PekkaResult deleteContentCategory(Long id) {
		PekkaResult result = contentCategoryService.deleteContentCategory(id);
		return result;
	}
}
