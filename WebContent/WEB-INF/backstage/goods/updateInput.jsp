<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>修改商品总览</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
    <script type="text/javascript" src="<%=basePath%>js/jquery.js"></script>
    <script type="text/javascript" src="<%=basePath%>js/backstage/common/common.js"></script>
<style type="text/css">
table { margin-top:10px;background-color:#eef4ea; 
}
td {
border:1px solid #cbd8ac; border-collapse:collapse; font-size:14px; text-align:left; padding:10px; }
.finput input{ background:#f1fbb4;}
table img{ float:left;}
table .floatLeft{float:left; }
</style>
  </head>
  
  <body>
  <form action="<%=basePath %>course/course_update" method="post" enctype="multipart/form-data">
    <input type="hidden" name="course.id" value="${course.id}">
    <input type="hidden" name="course.imgurl" value="${course.imgurl}">
    <input type="hidden" name="flag" value="${flag}">
     <table align="center" width="820px;">
       <tr>
         <td>
          <table>
           <tr>
             <td colspan="2">
               <img alt="图片展现区域" src="<%=basePath%>${course.imgurl}" height="300px" width="300px">
             </td>
           
           </tr>
           <tr>
  	         <td> 上传图片:</td>
  		     <td> 
		       <input type="file"  name="image"  size="30" class="selectinput" onchange="uploadImg();"> 
             </td>
  	      </tr>
         </table>
         </td>
       
         <td>
         <table>
  	   <tr>
  		<td> 商品</td>
  		<td><input type="text"  name="course.coursename"  size="30" value="${course.coursename}"/></td>
   	   </tr>
   	   <tr>
  		<td> 商品</td>
  		<td>
  		   <select name="course.standard">
  		    <option value="1">是</option>
  		    <option value="0">否</option>
  		   </select>
  		</td>
   	   </tr>
   	   <tr>
  		<td> 商品 </td>
  		<td><input type="text"  name="course.time"  size="30"  value="${course.time}"/></td>
   	   </tr>
   	   <tr>
   	    <td>商品</td>
   	    <td>
   	      <input type="text" name="course.fee" size="30" value="${course.fee}">
   	    </td>
   	   </tr>
  	   <tr>
  		<td>商品</td>
  		<td>
  		    <textarea rows="3" cols="30" name="course.intro" id="intro">${course.intro}</textarea>
  		</td>
   	  </tr>
   	  <tr>
   	    <td>商品</td>
  		<td>
  		      <textarea rows="3" cols="30" name="course.dest" id="dest">${course.dest}</textarea>
  		</td>
   	  </tr>
   	</table>
   	</td>
   	</tr>
  </table>
  
	<div style="text-align: center;">
	  <input type="submit"  value="提交内容"  onclick="return checking()">
	  <input type="button"  onclick="goback('<%=basePath%>course/course_index');" value="返回" >
	</div>
</form>
  </body>
</html>
