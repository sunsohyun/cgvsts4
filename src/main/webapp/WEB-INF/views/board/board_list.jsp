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
<script>
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
	           $(location).attr('href', "http://localhost:9000/board_list/"+e.page+"/");
	    });
		
 	});
</script> 
</head>
<body>
	<%-- <h1>${name}</h1> --%>
	<!-- header -->
	<jsp:include page="../header.jsp"></jsp:include>
	
	<!-- content -->
	<div class="content">
		<section class="board">
			<h1 class="title">게시판</h1>
			<table class="board_list">
				<tr>
					<td colspan="5">
						<a href="/board_write">
							<button type="button" class="btn_style2">글쓰기</button>
						</a>
					</td>
				</tr>
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>조회수</th>
					<th>작성자</th>
					<th>작성일자</th>
				</tr>
				<c:forEach var="board" items="${list}"> <!-- EL태그에 데이터가 있음  {name}: 여기서 name은 controller에서 지정한걸 쓰면된다.-->
				<tr>
					<td>${board.rno}</td>
					<td><a href="/board_content/${board.bid}/${page.reqPage}/">${board.btitle}</a></td>
					<td>${board.bhits}</td>
					<td>${board.id}</td>
					<td>${board.bdate}</td>
				</tr>
				</c:forEach>
				<tr>
					<!-- <td colspan="5"><< 1  2  3  4  5 >></td> --> <!-- 페이징 처리는 나중에! -->
					<td colspan="5"><div id="ampaginationsm"></div></td><!-- id는 내가 지정이 아닌 정해져있는거임 변경X , colspan="숫자" : 숫자는 한페이지에 띄울 게시글 수-->
				</tr>
			</table>
		</section>
	</div>
	
	<!-- footer -->
	<!-- <iframe src="http://localhost:9000/footer.jsp"
			scrolling="no" width="100%" height="500px" frameborder=0></iframe> -->	
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>



















