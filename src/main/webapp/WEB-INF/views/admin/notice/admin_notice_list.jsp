<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MYCGV</title>
<link rel="stylesheet" href="http://localhost:9000/css/mycgv.css">
<link rel="stylesheet" href="http://localhost:9000/css/am-pagination.css">
<script src="http://localhost:9000/js/jquery-3.6.4.min.js"></script>
<script src="http://localhost:9000/js/mycgv_jsp_jquery.js"></script>
<script src="http://localhost:9000/js/am-pagination.js"></script>
<script>
	$(document).ready(function(){
		var pager = jQuery('#ampaginationsm').pagination({
		
		    maxSize: '${maxSize}',	    // max page size
		    totals: '${totals}',		// total pages	
		    page: '${page}',			// initial page		
		    pageSize: '${pageSize}',	// max number items per page
		
		    // custom labels		
		    lastText: '&raquo;&raquo;', 		
		    firstText: '&laquo;&laquo;',		
		    prevText: '&laquo;',		
		    nextText: '&raquo;',
				     
		    btnSize:'sm'	// 'sm'  or 'lg'		
		});
		
		jQuery('#ampaginationsm').on('am.pagination.change',function(e){
			   jQuery('.showlabelsm').text('The selected page no: '+e.page);
	           $(location).attr('href', "http://localhost:9000/admin_notice_list/"+e.page+"/");
	    });
 	});
</script> 
</head>
<body>
	<!-- header -->
	<jsp:include page="../../header.jsp"></jsp:include>
	
	<!-- content -->
	<div class="content">
		<section class="board">
			<h1 class="title">관리자 - 공지사항</h1>			
			<table class="board_list">
				<tr>
					<td colspan="4">
						<a href="admin_notice_write">
							<button type="button">등록하기</button>
						</a>
					</td>
				</tr>
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>조회수</th>
					<th>작성일자</th>
				</tr>
				<c:forEach var="notice" items="${list}"> <!-- var : 사용하는 객체이름 --><!-- EL태그에 데이터가 있음  ${name} : 여기서 name은 controller에서 지정한걸 쓰면된다.-->
				<tr>
					<td>${notice.rno}</td>
					<td><a href="/admin_notice_content/${notice.nid}/${page.reqPage}/">${notice.ntitle}</a></td>
					<td>${notice.nhits}</td>
					<td>${notice.ndate}</td>
				</tr>
				</c:forEach>
				<tr>
					<td colspan="4"><div id="ampaginationsm"></div></td>
				</tr>
			</table>
		</section>
	</div>
	
	<!-- footer -->	
	<jsp:include page="../../footer.jsp"></jsp:include>
</body>
</html>
















