<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MYCGV</title>
<link rel="stylesheet" href="http://localhost:9000/css/mycgv_jsp.css">
<script src="http://localhost:9000/js/jquery-3.6.4.min.js"></script>
<script src="http://localhost:9000/js/mycgv_jsp_jquery.js"></script>
</head>
<body>
	<!-- header -->
	<jsp:include page="../header.jsp"></jsp:include>
	
	<!-- content -->
	<div class="content">
		<section class="board">
			<h1 class="title">게시판</h1>
			<form name="writeForm" action="/board_write" method="post" enctype="multipart/form-data">
				<table>
					<tr>
						<th class="test">제목</th>
						<td>
							<input type="text" name="btitle" id="btitle"
								placeholder="*제목은 반드시 입력해주세요" >
						</td>
					</tr>
					<tr>
						<th>내용</th>
						<td>
							<textarea rows="5" cols="30" name="bcontent"></textarea>
						</td>
					</tr>
					<tr>
						<th>작성자</th>
						<td>
							<input type="text" name="id" value="hong" disabled><!-- disabled : form넘어갈때 disabled있는건 넘어가지 않는다 따라서 오류남. -> 근데 뺴면 수정이 가능해짐 -->
							<input type="hidden" name="id" value="hong"><!-- hidden타입으로 안보이지만 데이터 넘어감! -->
						</td>
					</tr>
					<tr>
						<th>파일업로드</th>
						<td>
							<input type="file" name="file1">
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<button type="button" class="btn_style" id="btnBoardWrite">등록완료</button>
							<button type="reset" class="btn_style">다시쓰기</button>
							<a href="/board_list/1/">
								<button type="button" class="btn_style">리스트</button></a>
							<a href="http://localhost:9000/">
								<button type="button" class="btn_style">홈으로</button></a>
						</td>
					</tr>
				</table>
			</form>
		</section>
	</div>
	
	<!-- footer -->	
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>

















