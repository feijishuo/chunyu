package cx.studio.store.dao;

import java.util.List;

public interface BaseDao {
	// 增删改操作的基础类
	public int BaseUpdate(String sql, Object[] param);

	public int DeleteBatch(String sql, String ids);

	// 查询基础类
	public List<List<Object>> BaseQuery(String sql, Object[] param);

}
