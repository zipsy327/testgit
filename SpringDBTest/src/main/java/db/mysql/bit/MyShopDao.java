package db.mysql.bit;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MyShopDao {
	@Autowired
	private SqlSession session;
	
	public List<MyShopDto> getAllList()
	{
		return session.selectList("getAllMyShop");
	}
}
