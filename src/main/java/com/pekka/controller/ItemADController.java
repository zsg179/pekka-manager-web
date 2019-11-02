package com.pekka.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pekka.common.pojo.EasyUIDataGridResult;
import com.pekka.common.pojo.PekkaResult;
import com.pekka.service.ItemADService;

@Controller
public class ItemADController {
	@Autowired
	private ItemADService itemADService;

	@RequestMapping(value = "/item/ad/list", method = RequestMethod.GET)
	@ResponseBody
	public EasyUIDataGridResult getItemADList(Long adId) {
		EasyUIDataGridResult result = itemADService.getItemADList(adId);
		return result;
	}

	@RequestMapping("/item/ad/save")
	@ResponseBody
	public PekkaResult itemADSave(Long id, Long adId) {
		PekkaResult result = itemADService.add(id, adId);
		return result;
	}

	@RequestMapping("/item/ad/delete")
	@ResponseBody
	public PekkaResult itemADDelete(Long[] ids) {
		PekkaResult result = itemADService.delete(ids);
		return result;
	}
}
