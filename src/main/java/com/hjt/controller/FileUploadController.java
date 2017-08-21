package com.hjt.controller;

import java.io.File;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.hjt.config.Config;
import com.hjt.util.LogUtils;
import com.hjt.util.ResponseUtils;

@Controller
public class FileUploadController {
	
	@RequestMapping("upload")
	public void upload(@RequestParam("file")MultipartFile file,
			HttpServletRequest request, HttpServletResponse response){
		// 文件名及文件存储位置,保存到 ../resources/upload/ 目录下
		String fileName = file.getOriginalFilename();
		String filePath = request.getServletContext().getContextPath();
		
		LogUtils.info("文件名：{}，文件存储路径：{}", fileName, filePath);
		
		//上传文件到服务器
		try {
			file.transferTo(new File(filePath + File.separator + fileName));
		} catch (Exception e) {
			LogUtils.info("文件上传失败！" + e);
			e.printStackTrace();
		}
		
		ResponseUtils.write(response, request.getContextPath()
				+ Config.DEFAULT_UPLOAD_ADDRESS + fileName);
	}
	
}
