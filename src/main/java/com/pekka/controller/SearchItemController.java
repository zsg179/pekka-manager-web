package com.pekka.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pekka.common.pojo.PekkaResult;
import com.pekka.search.service.SearchItemService;

@Controller
public class SearchItemController {
	@Autowired
	private SearchItemService searchItemService;

	@RequestMapping("/index/import")
	@ResponseBody
	public PekkaResult importIndex() {
		PekkaResult result = searchItemService.importItemsToIndex();
		return result;
	}

}
