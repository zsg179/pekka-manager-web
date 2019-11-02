package com.pekka.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pekka.common.pojo.EasyUITreeNote;
import com.pekka.service.ItemCatService;

@Controller
public class ItemCatControllerr {

	@Autowired
	private ItemCatService itemCatService;

	@RequestMapping("/item/cat/list")
	@ResponseBody
	public List<EasyUITreeNote> getItemCatList(@RequestParam(value = "id", defaultValue = "0") Long parentId) {
		List<EasyUITreeNote> list = itemCatService.getItemCatList(parentId);
		return list;
	}
}
