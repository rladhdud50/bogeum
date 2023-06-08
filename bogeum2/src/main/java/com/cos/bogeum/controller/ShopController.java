package com.cos.bogeum.controller;

import com.cos.bogeum.model.items;
import com.cos.bogeum.repository.ShopRepository;
import com.cos.bogeum.service.ShopService;
import org.apache.commons.io.FilenameUtils;
import org.apache.commons.lang3.RandomStringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.repository.query.Param;
import org.springframework.data.web.PageableDefault;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

@Controller
public class ShopController {	
	@Autowired
	private ShopService shopService;
	@Autowired
	private ShopRepository shopRepository;
	
	/*쇼핑몰 메인페이지*/
	@GetMapping("/auth/shop")
	public String Shoppingmall(Model model, @PageableDefault(size=9, sort = "id", 
			direction = Sort.Direction.DESC)Pageable pageable) {
		model.addAttribute("shop", shopService.상품목록(pageable));		
		return "shop/Shoppingmall";
	}
	/*쇼핑몰 상세페이지*/
	@GetMapping("/auth/shop/{id}")
	public String shoppingmallDetail(@PathVariable int id, Model model) {
		model.addAttribute("item", shopService.상품아이디조회(id));
		return "shop/ShoppingmallDetail";
	}
		
	/*관리자페이지 상품등록*/
	@RequestMapping(value="/saveitem", method= {RequestMethod.POST})
	public String save(items item, MultipartFile file) throws Exception{
		String sourFileName = file.getOriginalFilename();
		String sourFileNameExtension = FilenameUtils.getExtension(sourFileName).toLowerCase();
		File destinationFile;
	    String destinationFileName;
	    String fileUrl = "C:\\images\\";
	    do { 
 		destinationFileName = RandomStringUtils.randomAlphanumeric(32) + "." + sourFileNameExtension; 
 		destinationFile = new File(fileUrl + destinationFileName); 
		} while (destinationFile.exists());
	    destinationFile.getParentFile().mkdirs();
	    file.transferTo(destinationFile);
	    item.setFilename(destinationFileName);
	    item.setFileOriName(sourFileName);
	    item.setFileurl(fileUrl);
	    shopService.상품등록(item);
	    return "redirect:/admin";
	}
	/*이미지경로설정*/
	@GetMapping(value="/auth/images")
	public ResponseEntity<Resource> display(@Param("filename") String filename){
		String path="C:\\images\\";
		Resource resource = new FileSystemResource(path+filename);
		if(!resource.exists()) {
			return new ResponseEntity<Resource>(HttpStatus.NOT_FOUND);
		}
		HttpHeaders header = new HttpHeaders();
		Path filePath = null;
		try {
			filePath=Paths.get(path+filename);
			header.add("Content-Type", Files.probeContentType(filePath));
		}catch(IOException e){
			e.printStackTrace();
		}
		return new ResponseEntity<Resource>(resource, header, HttpStatus.OK);
	}
	/*관리자페이지 상품 수정*/
	@RequestMapping(value="/updateItem/{id}", method= {RequestMethod.POST})
	public String update(items item, MultipartFile file) throws Exception{
		String sourFileName = file.getOriginalFilename();
		String sourFileNameExtension = FilenameUtils.getExtension(sourFileName).toLowerCase();
		File destinationFile;
	    String destinationFileName;
	    String fileUrl = "C:\\images\\";
	    do { 
 		destinationFileName = RandomStringUtils.randomAlphanumeric(32) + "." + sourFileNameExtension; 
 		destinationFile = new File(fileUrl + destinationFileName); 
		} while (destinationFile.exists());
	    destinationFile.getParentFile().mkdirs();
	    file.transferTo(destinationFile);
	    item.setFilename(destinationFileName);
	    item.setFileOriName(sourFileName);
	    item.setFileurl(fileUrl);
	    shopService.상품수정(item, item.getId());
	    return "redirect:/admin";
	}
	
}
