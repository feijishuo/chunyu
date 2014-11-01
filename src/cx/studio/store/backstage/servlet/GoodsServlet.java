package cx.studio.store.backstage.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class GoodsServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		 String url=request.getRequestURI();
		 int index=url.indexOf("goods");
		 String str=url.substring(index+6);
	System.out.println(str);
		 if(str!=null) {
			 if("index".equals(str)) {
				 request.getRequestDispatcher("/WEB-INF/backstage/goods/index.jsp").forward(request, response);	
			 }else if("addInput".equals(str)) {
				 request.getRequestDispatcher("/WEB-INF/backstage/goods/addInput.jsp").forward(request, response);	 
			 }
		 }
	}
}
