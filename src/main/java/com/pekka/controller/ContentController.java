package com.pekka.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pekka.common.pojo.EasyUIDataGridResult;
import com.pekka.common.pojo.PekkaResult;
import com.pekka.content.service.ContentService;
import com.pekka.pojo.TbContent;

@Controller
public class ContentController {

	@Autowired
	private ContentService contentService;

	/**
	 * 获取内容列表
	 * 
	 * @param categoryId
	 *            分类id
	 * @param page
	 *            当前页
	 * @param rows
	 *            每页的记录数
	 * @return
	 */
	@RequestMapping("/content/query/list")
	@ResponseBody
	public EasyUIDataGridResult getContentList(Long categoryId, Integer page, Integer rows) {
		EasyUIDataGridResult result = contentService.getContentList(categoryId, page, rows);
		return result;
	}

	/**
	 * 新增内容
	 * 
	 * @param tbContent
	 * @return
	 */
	@RequestMapping(value = "/content/save", method = RequestMethod.POST)
	@ResponseBody
	public PekkaResult saveContent(TbContent tbContent) {
		PekkaResult result = contentService.saveContent(tbContent);
		return result;
	}

	/**
	 * 编辑内容
	 * 
	 * @param tbContent
	 * @return
	 */
	@RequestMapping("/rest/content/edit")
	@ResponseBody
	public PekkaResult editContent(TbContent tbContent) {
		PekkaResult result = contentService.editContent(tbContent);
		return result;
	}

	/**
	 * 删除内容
	 * 
	 * @param ids
	 * @return
	 */
	@RequestMapping("/content/delete")
	@ResponseBody
	public PekkaResult deleteContent(Long[] ids) {
		PekkaResult result = contentService.deleteContent(ids);
		return result;
	}
}
