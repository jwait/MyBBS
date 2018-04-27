package com.hjt.controller;

import java.io.File;
import java.io.IOException;
import java.util.Arrays;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.hjt.config.Config;
import com.hjt.util.LogUtils;
import com.hjt.util.ResponseUtils;

@Controller
public class FileUploadController {
	
	@RequestMapping(value="upload", method=RequestMethod.POST)
	public void upload(@RequestParam("file")MultipartFile file,
			HttpServletRequest request, HttpServletResponse response) throws IOException{
		// 文件名及文件存储位置,保存到 ../resources/upload/ 目录下
		
		String[] allowedType = { "image/bmp", "image/gif", "image/jpeg", "image/png" };
        boolean allowed = Arrays.asList(allowedType).contains(file.getContentType());
        if (!allowed) {
            response.getWriter().write("error|不支持的类型");
            return;
        }
        
        if (file.getSize() > 5 * 1024 * 1024) {
            response.getWriter().write("error|图片大小不能超过5M");
            return;
        }
        
        // 提取文件原名
        String originalFilename = file.getOriginalFilename();
        // 生成实际存储的真实文件名
        String realName = UUID.randomUUID()+originalFilename.substring(originalFilename.lastIndexOf("."));
		String filePath = request.getServletContext().getRealPath(Config.DEFAULT_UPLOAD_ADDRESS);
		
		LogUtils.info("文件名：{}，文件存储路径：{}", realName, filePath);
		
		//上传文件到服务器
		try {
			file.transferTo(new File(filePath + File.separator + realName));
		} catch (Exception e) {
			LogUtils.info("文件上传失败！" + e);
			e.printStackTrace();
		}
		
		ResponseUtils.write(response, request.getContextPath()
				+ Config.DEFAULT_UPLOAD_ADDRESS + realName);
	}
	
}
