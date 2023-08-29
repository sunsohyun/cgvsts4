<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MYCGV</title>
<link rel="stylesheet" href="http://localhost:9000/css/mycgv_jsp.css">
<link rel="stylesheet" href="http://localhost:9000/css/am-pagination.css">
<script src="http://localhost:9000/js/jquery-3.6.4.min.js"></script>
<script src="http://localhost:9000/js/mycgv_jsp_jquery.js"></script>
<script src="http://localhost:9000/js/am-pagination.js"></script>
<script src="http://localhost:9000/js/mycgv_board_list.js"></script>
<%--<script>
	$(document).ready(function(){
		var pager = jQuery('#ampaginationsm').pagination({

			maxSize: '${page.pageCount}',	    // max page size
			totals: '${page.dbCount}',		// total pages
			page: '${page.reqPage}',			// initial page
			pageSize: '${page.pageSize}',	// max number items per page
		
		    // custom labels		
		    lastText: '&raquo;&raquo;', 		
		    firstText: '&laquo;&laquo;',		
		    prevText: '&laquo;',		
		    nextText: '&raquo;',	
				     
		    btnSize:'sm'	// 'sm'  or 'lg'		
		});
		
		jQuery('#ampaginationsm').on('am.pagination.change',function(e){
			   jQuery('.showlabelsm').text('The selected page no: '+e.page);
	           $(location).attr('href', "http://localhost:9000/board_list_json.do?page="+e.page);
	    });
		
 	});
</script> --%>
</head>
<body>
	<%-- <h1>${name}</h1> --%>
	<!-- header -->
	<jsp:include page="../header.jsp"></jsp:include>
	
	<!-- content -->
	<div class="content">
		<section class="board">
			<h1 class="title">게시판(JSON)</h1>

		</section>
	</div>
	

	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>



















