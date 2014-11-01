package cx.studio.store.utils;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.beanutils.ConvertUtils;
import org.apache.commons.beanutils.Converter;

public class WebUtil {

	/**
	 * ʵ�ֱ����ݵ�JavaBean����֮��ķ�װ
	 */
	public static <T> T request2Bean(HttpServletRequest request,
			Class<T> beanClass) {

		try {
			/** �õ�Ҫת��Bean������ */
			T bean = beanClass.newInstance();
			/** ��ȡ������ */
			Map map = request.getParameterMap();
			/** ע������ת���� */
			ConvertUtils.register(new Converter() {

				/** ʵ��convert���� */
				public Object convert(Class type, Object value) {
					if (value == null) {
						return null;
					}
					String str = (String) value;
					if ("".equals(str.trim())) {
						return null;
					}
					SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
					try {
						return sdf.parse(str);
					} catch (ParseException e) {
						throw new RuntimeException(e);
					}
				}

			}, Date.class);
			/** ����Bean */
			BeanUtils.populate(bean, map);
			return bean;
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}
}