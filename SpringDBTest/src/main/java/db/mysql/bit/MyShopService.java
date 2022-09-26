package db.mysql.bit;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MyShopService {
	@Autowired
	private MyShopDao dao;
	
	public List<MyShopDto> getAllList()
	{
		return dao.getAllList();
	}
}
