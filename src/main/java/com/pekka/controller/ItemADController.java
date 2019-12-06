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
	public EasyUIDataGridResult getItemADList(Long categoryName) {
		String cName = "";
		EasyUIDataGridResult result = new EasyUIDataGridResult();
		switch (categoryName.intValue()) {
		case 0:
			result = itemADService.getItemADHotList();
			return result;
		case 1:
			cName = "益智玩具";
			break;
		case 2:
			cName = "遥控电动";
			break;
		case 3:
			cName = "积木拼插";
			break;
		case 4:
			cName = "动漫模型";
			break;
		case 5:
			cName = "健身玩具";
			break;
		case 6:
			cName = "毛绒玩具";
			break;
		case 7:
			cName = "创意DIY";
			break;
		case 8:
			cName = "乐器";
			break;
		}
		result = itemADService.getItemADList(cName);
		return result;
	}

	@RequestMapping("/item/ad/save")
	@ResponseBody
	public PekkaResult itemADSave(Long id, Long categoryName) {
		String cName = "";
		PekkaResult result = new PekkaResult();

		switch (categoryName.intValue()) {
		case 0:
			cName = "当季热卖";
			break;
		case 1:
			cName = "益智玩具";
			break;
		case 2:
			cName = "遥控电动";
			break;
		case 3:
			cName = "积木拼插";
			break;
		case 4:
			cName = "动漫模型";
			break;
		case 5:
			cName = "健身玩具";
			break;
		case 6:
			cName = "毛绒玩具";
			break;
		case 7:
			cName = "创意DIY";
			break;
		case 8:
			cName = "乐器";
			break;
		}
		result = itemADService.add(id, cName);
		return result;
	}

	@RequestMapping("/item/ad/delete")
	@ResponseBody
	public PekkaResult itemADDelete(Long[] ids, Long categoryName) {
		String cName = "";
		PekkaResult result = new PekkaResult();
		switch (categoryName.intValue()) {
		case 0:
			cName = "当季热卖";
			break;
		case 1:
			cName = "益智玩具";
			break;
		case 2:
			cName = "遥控电动";
			break;
		case 3:
			cName = "积木拼插";
			break;
		case 4:
			cName = "动漫模型";
			break;
		case 5:
			cName = "健身玩具";
			break;
		case 6:
			cName = "毛绒玩具";
			break;
		case 7:
			cName = "创意DIY";
			break;
		case 8:
			cName = "乐器";
			break;
		}
		result = itemADService.delete(ids, cName);
		return result;
	}
}
