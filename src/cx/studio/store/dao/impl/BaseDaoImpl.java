package cx.studio.store.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;

import cx.studio.store.dao.BaseDao;
import cx.studio.store.utils.JdbcUtil;

public class BaseDaoImpl implements BaseDao {
	private QueryRunner queryRunner = new QueryRunner(JdbcUtil.getDataSource());

	public int BaseUpdate(String sql, Object[] param) {
		int result = 0;
		try {
			result = queryRunner.update(sql, param);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	public int DeleteBatch(String sql, String ids) {
		Connection conn = null;
		PreparedStatement ps = null;
		String[] IDarray = ids.split("_");
		try {
			conn = JdbcUtil.getConnection();
			conn.setAutoCommit(false);
			ps = conn.prepareStatement(sql);
			for (int i = 0; i < IDarray.length; i++) {
				int id = Integer.parseInt(IDarray[i]);
				ps.setInt(1, id);
				ps.execute();
			}
			conn.commit();
		} catch (Exception e) {
			try {
				conn.rollback();
				conn.close();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
		}
		return 0;
	}

	public List<List<Object>> BaseQuery(String sql, Object[] param) {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		List<List<Object>> l = new ArrayList<List<Object>>();
		if (param != null)
			try {
				conn = JdbcUtil.getConnection();
				ps = conn.prepareStatement(sql);
				int n = param.length;
				if (n != 0) {
					for (int i = 0; i < n; i++) {
						int j = i + 1;
						ps.setObject(j, param[i]);
					}
				}
				rs = ps.executeQuery();
				ResultSetMetaData rsd = rs.getMetaData();
				int count = rsd.getColumnCount();
				while (rs.next()) {
					List<Object> list = new ArrayList<Object>();
					for (int j = 0; j < count; j++) {
						list.add(rs.getObject(j + 1));
					}
					l.add(list);
				}

			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				try {
					if (rs != null) {
						rs.close();
					}
				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					try {
						if (ps != null) {
							ps.close();
						}
					} catch (Exception e) {
						e.printStackTrace();
					} finally {
						try {
							if (conn != null) {
								conn.close();
							}
						} catch (Exception e) {
							e.printStackTrace();
						}
					}
				}

			}
		return l;
	}
}
