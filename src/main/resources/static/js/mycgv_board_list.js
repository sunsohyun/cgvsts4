$(document).ready(function(){
	
	initAjax(1);//1페이지 호출 - 디폴트
	
	function initAjax(page){//ajax를 함수로 만들어서 호출해서 사용가능하도록 한다. / page=페이지 번호
		$.ajax({
			url : "board_list_json_data/"+page+"/" ,
			success : function(result){
				//alert(result[0].btitle);	//String으로 받았기때문에 문자인 상태
				//let jdata = JSON.parse(result);	//넘어온 데이터를 JSON으로 파싱하는 작업
				//alert(jdata.jlist[0].rno);	// Object object = JSON 객체
				
				//dhtml을 활용하여 테이블로 출력
				let output = "<table class='board_list'>";
				output += "<tr><td colspan='5'>";
				output += "<a href='board_write.do'>";
				output += "<button type='button' class='btn_style2'>글쓰기</button>";
				output += "</a></td></tr>";
				output += "<tr><th>번호</th><th>제목</th><th>조회수</th><th>작성자</th><th>작성일자</th></tr>";
				
				for(obj of result.list){
					output += "<tr>";
					output += "<td>"+ obj.rno +"</td>";
					output += "<td class='btitle' id='"+ obj.bid +"'><a>"+ obj.btitle +"</a></td>";
					output += "<td>"+ obj.bhits +"</td>";
					output += "<td>"+ obj.id +"</td>";
					output += "<td>"+ obj.bdate+"</td>";
					output += "</tr>";
				}
				
				output += "<tr>"
				output += "<td colspan='5'><div id='ampaginationsm'></div></td>"
				output += "</tr>"
				output += "</table>"
				
				//output을 화면에 출력 - h1다음에 output출력
				$("table.board_list").remove();
				$("h1").after(output);

				//content 상세보기 이벤트처리 - 이벤트 처리는 출력된 다음에 줘야함!!
				$(".btitle").click(function (){
					//alert($(this).attr("id"));
					contentAjax($(this).attr("id"), page);
				});
				
				//페이징 처리 함수 호출 - success안에서 해야함!
				pager(result.page.dbConut, result.page.pageCount, result.page.pageSize, result.page.reqPage);
				
				//페이지 번호 클릭 이벤트 처리
				jQuery('#ampaginationsm').on('am.pagination.change',function(e){
			  		 jQuery('.showlabelsm').text('The selected page no: '+e.page);
	         		 //$(location).attr('href', "http://localhost:9000/board_list_json.do?page="+e.page); //자기자신이니까 페이지 호출 필요없음 - 함수만 호출하면됨. -> 깜빡이는 현상 없어짐
	         		 initAjax(e.page);         
	    		});
				
			}//success
		
		});//ajax
	}//initAjax
	
	/*페이징 처리 함수 만들기*/
	function pager(totals, maxSize, pageSize, page){
		//alert(totals+","+maxSize+","+pageSize+","+page);
		
		
		var pager = jQuery('#ampaginationsm').pagination({
		
		    maxSize: maxSize,	// max page size
		    totals: totals,		// total pages	
		    page: page,			// initial page		
		    pageSize: pageSize,	// max number items per page
		
		    // custom labels		
		    lastText: '&raquo;&raquo;', 		
		    firstText: '&laquo;&laquo;',		
		    prevText: '&laquo;',		
		    nextText: '&raquo;',	
				     
		    btnSize:'sm'	// 'sm'  or 'lg'		
		    
		});
	}


	/* content 상세보기 함수 */
	function contentAjax(bid, page) {
		$.ajax({
			url: "/board_content_json_data/" + bid + "/",
			success: function (result) {
				//alert(result.btitle);

				//dhtml을 활용하여 상세보기 화면 출력
				let output = "<table class='board_content'>";
				output += "<tr><th>제목</th>";
				output += "<td>result.btitle</td>";
				output += "</tr>";

				output += "<tr><th>내용</th>";
				output += "<td>"+result.bcontent+"<br><br><br>";
				if (result.bsfile != null){
					output += "<img src='http://localhost:9000/upload/"+result.bsfile+"'>";
				}
				output += "</td></tr>";

				output += "<tr><th>조회수</th>";
				output += "<td>" + result.bhits + "</td>";
				output += "</tr>";

				output += "<tr><th>작성자</th>";
				output += "<td>" + result.id + "</td>";
				output += "</tr>";

				output += "<tr><th>작성일자</th>";
				output += "<td>" +result.bdate +"</td>";
				output += "</tr>";

				output += "<tr><td colspan='2'>";
				output += "<button type='button' class='btn_style' >수정하기</button>";
				output += "<button type='button' class='btn_style'>삭제하기</button>";
				output += "<button type='button' class='btn_style' id='list'>리스트</button>";
				output += "<button type='button' class='btn_style' id='home'>홈으로</button>";
				output += "</td></tr></table>";

				//지우고 띄우기
				$("table.board_list").remove();
				$("h1").after(output);

				//리스트 버튼 클릭이벤트
				$("#list").click(function (){
					$("table.board_content").remove();
					initAjax(page);
				})

				//홈으로 버튼 클릭이벤트
				$("#home").click(function (){
					$(location).attr('href','http://localhost:9000/');
				})

				//수정하기 버튼 클릭이벤트


				//삭제하기 버튼 클릭이벤트


			}//success
		});//ajax
	}//contentAjax


});	//ready