package db.mysql.bit;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class HomeController {
	
	@Autowired
	MyShopService service;
	
	@GetMapping("/")
	public String home(Model model)
	{
		List<MyShopDto> list=service.getAllList();
		model.addAttribute("list",list);
		model.addAttribute("count",list.size());
		return "home";	
	}
	
	@GetMapping("/form")
	public String form()
	{
		return "form";
	}
	
	@PostMapping("/insert")
	public String insert(MultipartFile upload,Model model,HttpServletRequest request)
	{
		String path=request.getSession().getServletContext().getRealPath("/resources/image2");
		System.out.println(path);
		String fname=upload.getOriginalFilename();
		try {
			upload.transferTo(new File(path+"/"+fname));
			model.addAttribute("photo",fname);
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "photo";
	}

}
