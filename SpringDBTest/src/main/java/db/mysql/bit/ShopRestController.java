package db.mysql.bit;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class ShopRestController {
	
	@Autowired
	MyShopService service;
	
	@GetMapping("/list")
	public List<MyShopDto> list()
	{
		return service.getAllList();
	}
}
