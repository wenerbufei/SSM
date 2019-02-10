<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath()); /*根路径  */
%>
<script type="text/javascript"
	src="${APP_PATH }/static/js/jquery-2.1.1.min.js"></script>
<link rel="stylesheet"
	href="${APP_PATH }/static/bootstrap/css/bootstrap.min.css">
<script src="${APP_PATH }/static/bootstrap/js/bootstrap.min.js"></script>

  <body>
  <br/>
  <br/>
  <div class = "container">
  	<div class = "row">
  		<div class = "col-md-8 col-md-offset-2">
  			<div class = "panel panel-default">
  				<div class = "panel-heading">
  					<div class = "row">
  						<h1 class = "col-md-5">周杰伦歌曲列表</h1>
  						<form action="selectByName" class = "col-md-5" style="margin:20px 0 10px 0;" id = "form1">
  							<div class = "input-group">
	  							<input type ="text" name ="name" class="form-control" placeholder = "请输入歌名"/>
	  							<span class = "input-group-addon btn" id = "search">搜索</span>
  							</div>
  						</form>
  					</div>
  				</div>
			    <table align = "center" class = "table table-bordered">
			    	<thead>
				    	<tr>
				    		<td>id</td>
				    		<td>曲名</td>
				    		<td>专辑</td>
				    		<td>发行时间</td>
				    	
				    	</tr>
			    	</thead>
			    	</tbody>
				    	<c:forEach items="${list }" var = "l" >
				    		<tr>
				    			<td>${l.id }</td>
				    			<td>${l.name }</td>
				    			<td>${l.album }</td>
				    			<td>${l.time }</td>
				    			
				    		</tr>
				    	</c:forEach>
			    	</tbody>
			    </table>
			    
			    <br/>
			    <br/>
			    <div class = "panel-footer">
				    <div class = "row">
				    	<div class = "col-md-6 col-md-offset-6">
					    	<ul class = "pagination">
						    	<li> <a href = "queryAll?page=1">首页</a> </li>
						    	<li <c:if test="${pageInfo.pageNum==1}">class="disabled"</c:if>><a href="visitorQueryAll?page=${pageInfo.pageNum-1 }">&laquo;</a></li>
				                <c:forEach begin="${pageInfo.navigateFirstPage }" end="${pageInfo.navigateLastPage}" step="1" var="pageNo">
				                    <li <c:if test="${pageInfo.pageNum==pageNo}">class="active"</c:if>><a href="visitorQueryAll?page=${pageNo}">${pageNo}</a></li>
				                </c:forEach>
				                <li <c:if test="${pageInfo.pageNum==pageInfo.pages}">class="disabled"</c:if>><a href="visitorQueryAll?page=${pageInfo.pageNum+1}">&raquo;</a></li>
				                <li> <a href = "queryAll?page=${page.pages }">尾页</a> </li>
				                
				                  <li class=""><a href="${APP_PATH }/login"
									style="text-decoration: none;float: right;"><strong>退出</strong></a></li>
				                
					    	</ul>
					    </div>
			    	</div>
		    	</div>
		    </div>
		   </div>
	   </div>
    </div> 
  </body>
 <script type="text/javascript">
 	$("#search").click(function(){
 		$("#form1").submit();
 	})
 </script>
  
</html>
