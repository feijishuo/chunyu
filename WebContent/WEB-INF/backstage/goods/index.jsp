<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="pg" uri="http://jsptags.com/tags/navigation/pager" %>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>商品总览</title>
<link rel="stylesheet" type="text/css" href="<%=basePath %>css/backstage/base.css">
<script type="text/javascript" src="<%=basePath%>js/jquery.js"></script>
<script type="text/javascript" src="<%=basePath%>js/backstage/common/common.js"></script>
</head>

<body style="margin-left: 8 ;margin-top:  8">
<!--  快速转换位置按钮  -->
<table width="98%" border="0" cellpadding="0" cellspacing="1" bgcolor="#D1DDAA" align="center">
<tr>
 <td height="26">
  <table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
  <td align="center" background="<%=basePath %>imgs/backstage/wbg.gif">
     <a href="javascript:openWin('<%=basePath %>backstage/goods/addInput');" class="coolbg np">添加商品</a>
 </td>
 </tr>
</table>
</td>
</tr>
</table>

<table width="98%" border="0" cellpadding="2" cellspacing="1" bgcolor="#D1DDAA" align="center" style="margin-top:8px">
<tr bgcolor="#E7E7E7">
	<td height="24" colspan="9" background="<%=basePath %>imgs/backstage/wbg.gif">&nbsp;商品列表</td>
</tr>
<tr align="center" bgcolor="#FAFAF1" height="22">
	<td width="6%">ID</td>
	<td width="6%">选择</td>
	<td width="10%">商品名称</td>
	<td width="10%">商品原价</td>
	<td width="24">商品现价</td>
	<td width="10%">计价单位</td>
	<td width="10%">起订数量</td>
	<td width="10%">销售数量</td>
	<td width="24%">操作</td>
</tr>
<tr id="ID" align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='#FCFDEE';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22" >
	<td>ID</td>
	<td><input name="id" type="checkbox" id="ID" class="np" value="ID"></td>
	<td>商品名称</td>
	<td>商品原价</td>
	<td>
	 商品现价
	</td>
	<td>计价单位</td>
	<td>起订数量</td>
	<td>销售数量</td>
	<td>
	<a href="<%=basePath %>course/course_updateInput?id=${course.id}">编辑</a> |
	<a href="javascript:del('<%=basePath %>course/course_del?id=${course.id}');">删除</a> | 
	<a href="<%=basePath %>course/course_searchther?id=${course.id }">关键字</a> |
	<a href="<%=basePath %>course/course_searchther?id=${course.id }">备注</a> 
	</td>
	</tr>

   
<tr bgcolor="#FAFAF1">
<td height="28" colspan="3" align="left">
	&nbsp;
	<a href="javascript:selAll()" class="coolbg">全选</a>
	<a href="javascript:noSelAll()" class="coolbg">取消</a>
	<a href="javascript:bulkdel('<%=basePath %>course/course_bulkdel')" class="coolbg">&nbsp;删除&nbsp;</a>
</td>
<td colspan="6" valign="top">
  <!--  搜索表单  -->
<form name='from1' action='<%=basePath %>course/course_search' method='post'>
<table width='98%'  border='0' cellpadding='1' cellspacing='1' bgcolor='#CBD8AC' align="center" style="margin-top:8px">
  <tr bgcolor='#EEF4EA'>
    <td background='<%=basePath %>imgs/backstage/wbg.gif' align='center'>
      <table border='0' cellpadding='0' cellspacing='0'>
        <tr>
          <td width='90' align='center'>搜索条件：</td>
          <td width='160'>
          <select name='colName' style='width:150'>
            <option value='coursename'>选择类型...</option>
          	<option value='coursename'>课程名</option>
          </select>
        </td>
        <td width='70'>
          关键字：
        </td>
        <td width='160'>
          	<input type='text' name='keyword' size="40" />
        </td>
        <td align="center">
          <input type="image" src="<%=basePath %>imgs/backstage/search.gif" width="45" height="20" border="0" class="np" />
        </td>
       </tr>
      </table>
    </td>
  </tr>
</table>
</form>
</td>
</tr>
</table>

</body>
</html>