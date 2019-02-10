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
  						<form action="findByName" class = "col-md-5" style="margin:20px 0 10px 0;" id = "form1">
  							<div class = "input-group">
	  							<input type ="text" name ="name" class="form-control" placeholder = "请输入歌名"/>
	  							<span class = "input-group-addon btn" id = "search">搜索</span>
  							</div>
  						</form>
  						<div class = "col-md-2" style ="margin-top:20px">
  							<a class="btn btn-default" href = "toAdd" role = "button">
					    	<span class="glyphicon glyphicon-plus" aria-hidden="true"></span> 新增歌曲
					    	</a>
  						</div>
  					</div>
  				</div>
			    <table align = "center" class = "table table-bordered">
			    	<thead>
				    	<tr>
				    		<td style="width:20px;"><input type="checkbox" id="all" /> </td>
				    		<td>id</td>
				    		<td>曲名</td>
				    		<td>专辑</td>
				    		<td>发行时间</td>
				    		<td>操作</td>
				    		<td>操作</td>
				    	</tr>
			    	</thead>
			    	</tbody>
				    	<c:forEach items="${list }" var = "l" >
				    		<tr>
				    		<td style="width:20px;"><input type="checkbox" class="checkbox_item"/> </td>
				    			<td>${l.id }</td>
				    			<td>${l.name }</td>
				    			<td>${l.album }</td>
				    			<td>${l.time }</td>
				    			<td>                                    <!--  "javascript:return del();" -->
					    			 <a class="btn btn-danger btn-xs" onclick="return del()" href="delete?id=${l.id }" role="button" id="delete">
					    				 <span class="glyphicon glyphicon-trash" aria-hidden="true"></span> 删除
					    			 </a>
					    			<%--  <button class="btn btn-xs btn-danger " onClick="javascript:if(del()) location.href='delete?id=${l.id}'">删除</button> --%>
				    			</td>
				    			<td>
					    			<a class="btn btn-danger btn-xs" href = "toEdit?id=${l.id }" role = "button">
					    				<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span> 编辑
					    			</a>
				    			</td>
				    		</tr>
				    	</c:forEach>
			    	</tbody>
			    </table>
			    
			    <br/>
			    <br/>
			    <div class = "panel-footer">
				    <div class = "row">
				    	<div class = "col-md-8 col-md-offset-4">
					    	<ul class = "pagination">
					    		<li> <a href = "queryAll?page=1">首页</a> </li>
						    	<li <c:if test="${pageInfo.pageNum==1}">class="disabled"</c:if>><a href="queryAll?page=${pageInfo.pageNum-1 }">&laquo;</a></li>
				                <c:forEach begin="${pageInfo.navigateFirstPage }" end="${pageInfo.navigateLastPage}" step="1" var="pageNo">
				                    <li <c:if test="${pageInfo.pageNum==pageNo}">class="active"</c:if>><a href="queryAll?page=${pageNo}">${pageNo}</a></li>
				                </c:forEach>
				                <li <c:if test="${pageInfo.pageNum==pageInfo.pages}">class="disabled"</c:if>><a href="queryAll?page=${pageInfo.pageNum+1}">&raquo;</a></li>
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
 	
 	//删除提示
 	function del(){
 		var message = confirm("您真的确定要删除吗？\n\n请确认！");
 		if (message == true){
			alert("删除成功"); 	
			return true;	
 		}else{
 			return false;
 		}
 	}
 	
 	
 	
 	
 </script>
  
</html>
