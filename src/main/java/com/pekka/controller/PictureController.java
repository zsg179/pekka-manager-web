package com.pekka.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.pekka.common.util.JsonUtils;
import com.pekka.util.FastDFSClient;

/**
 * 图片服务器
 * 
 * @author Lenovo-昱树临风
 *
 */
@Controller
public class PictureController {

	@Value(value = "${PEKKA_IMAGE_SERVER_URL}")
	private String PEKKA_IMAGE_SERVER_URL;

	@RequestMapping("/pic/upload")
	@ResponseBody
	public String picUpload(MultipartFile uploadFile) {
		try {
			// 1.参数接受上传的文件
			// 2.取扩展名
			String originalFilename = uploadFile.getOriginalFilename();
			String extName = originalFilename.substring(originalFilename.lastIndexOf(".") + 1);
			// 上传到图片服务器
			FastDFSClient fastDFSClient = new FastDFSClient("classpath:resource/client.conf");
			String path = fastDFSClient.uploadFile(uploadFile.getBytes(), extName);
			String url = PEKKA_IMAGE_SERVER_URL + path;
			// 响应上传图片的url
			Map result = new HashMap<>();
			result.put("error", 0);
			result.put("url", url);
			return JsonUtils.objectToJson(result);
		} catch (Exception e) {
			e.printStackTrace();
			Map result = new HashMap<>();
			result.put("error", 1);
			result.put("message", "图片上传失败！");
			return JsonUtils.objectToJson(result);
		}
	}
}
