<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="Header.jsp"%>
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-lite.css"
	rel="stylesheet">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-lite.js"></script>
<script src="resources/js/summernote-ko-KR.js"></script>

</head>

<body>

	<%-- 	<%@ include file="t_Header.jsp"%> --%>

	<div id="content-area">
		<div class="container" id="main">
			<div class="row col-12 col-sm-12 col-lg-12 col-xl-12" id="contentDiv">
				<div class="" id="content-title">${vo.b_title }</div>

				<!-- 				모바일 화면에서 바꿀것 @media-->
				<div class="col-12" id="content-info">
					<%-- 					<td>${vo.b_seq }보드시퀀스</td> --%>
					<%-- 					<td>${vo.u_id }유저아이디</td> --%>
					<%-- 					<td>${vo.b_date }보드작성일</td> --%>
					<ul>
						<li>번호_${vo.b_seq}</li>
						<li>별명_<span id="vss_u_id">${u_id }</span></li>
						<li>날짜_<span id="vss_date"><fmt:formatDate value="${vo.b_date}" pattern="MM-dd HH:mm" /></span>
						<li>조회_${vo.b_cnt}</li>
						<li>추천_<span id="vss_like">${LikeCnt }</span>			</li>
						<li>비추_<span id="vss_dislike">${UnlikeCnt }</span>			</li>
						
					</ul>
				</div>				
				
				<div class=col-12 id="content-info-mb">		
					<span id="vss_u_id">${u_id }</span> |   
					<span>조회_${vo.b_cnt }</span> |					 
					<span id="vss_date"><fmt:formatDate value="${vo.b_date}" pattern="MM-dd" /> </span> | 
					추천_<span id="vss_like">${LikeCnt}</span> | 
					비추_<span id="vss_dislike">${UnlikeCnt}</span>			
				</div>				
				<div col-2></div>

				<!-- 	이 게시물(b_seq)이 vs_seq를 가지고 있는가? -->
				<div class="col-12" id="content-vs" style="display: none">
					<div class="col-5" id="vs-left">${vo.b_left }</div>
					<div class="col-2" id="vs-vs">
						<img src="resources/css/test/versus.png" alt="" />
					</div>
					<div class="col-5" id="vs-right">${vo.b_right }</div>
				</div>
				<div class="col-12" id="content-vote" style="display: none">
					<div id="vote-title">
						<div style="clear: both">
							<ul>
								<li style="float: left;">갤럭시</li>
								<li style="float: right;">아이폰</li>
							</ul>
						</div>
						<div style="clear: both">
							<ul>
								<li style="float: left;"><button type="button" id="vsLeft"
										onclick="vsVote(this.id)">전자</button></li>
								<li style="float: right;"><button type="button"
										id="vsRight" onclick="vsVote(this.id)">후자</button></li>
							</ul>
						</div>
						<div style="clear: both">
							<ul>
								<li style="float: left;">${LeftCnt }</li>
								<li style="float: right;">${RightCnt }</li>
							</ul>
							<!-- 	한개 bar에 style width % 직접 값을 가져오는거 같음 -->
						</div>

					</div>
				</div>


				<div class="col-12" id="content-content">${vo.b_content}</div>
				
				
				<div class="offset-4 col-4 offset-xl-5 col-xl-2" id="content-like"> 
				 <button type="button" id="btn_like" onclick="like(this.id)"> 추천 </button>
				 <button type="button" id="btn_dislike" onclick="like(this.id)"> 비추 </button>
				</div>
				
<!-- 				동언 -->
			<%-- 	<div>
					<button type="button"  id="like" onclick="like(this.id)">추천 ${LikeCnt }</button>
					
					<button type="button"  id="unlike" onclick="like(this.id)">비추천 ${UnlikeCnt }</button>
				</div> --%>
<!-- 				ㅇㅇ -->

			</div>
			<!-- 			댓글입력창 (임시) -->

			<div class="row">
				<div class="col-12" id="replyDiv">
					<div class=replyTitle>
						전체 댓글 <span id="reply-cnt">${ReplyCnt}</span>개
					</div>


					<ul class="replyUlist">
						<!-- 						list 반복 -->
						<c:forEach var="vo" items="${ReplyList}">
							<li id="" class="comment_li">
								<div class="reply-grid">
									<div class="reply-info">
										<span class="reply-writer"> <span id="vss_u_id">${vo.u_id}</span></span>
										<span class="reply-date"><fmt:formatDate
												value="${vo.re_date}" pattern="MM-dd HH:mm" /></span> <span
											class="reply-vss"> <span id="vss">부스럭</span> 
											<!--이 댓글이 내가쓴글이면  hidden  or inline-->
											<span id="reply_hidden" style="display: none;">
												<button type="button" id="reply_del">
													<span> 삭제 </span>
												</button>
												<button type="button" id="reply_edit" onclick="edit()"
													data-toggle="button">
													<span>수정</span>
												</button>
										</span>
										</span>

									</div>
									<div id="reply_content_1">${vo.re_content}</div>
								</div>
							</li>

						</c:forEach>

						<!-- 						<li id="" class="commnet_li"> -->
						<!-- 							<div class="reply-grid"> -->
						<!-- 								<div class="reply-info"> -->
						<!-- 									<span class="reply-writer"> <span id="vss_u_id">작성자2222</span></span> -->
						<!-- 									<span class="reply-date">19.08.20 21:52</span> <span -->
						<!-- 										class="reply-vss"> <span id="vss">부스러기</span> -->
						<!-- 									</span> -->

						<!-- 								</div> -->
						<!-- 								<div>댓글내용 아무말 아무말아무말 아무말아무말 아무말아무말 아무말아무말 아무말아무말 아무말아무말 -->
						<!-- 									아무말아무말 아무말아무말 아무말?</div> -->
						<!-- 							</div> -->
						<!-- 						</li> -->


					</ul>
					<div id="reply-form">
						<form id="replyform">
							<textarea id="r_reply" name="re_content" maxlength="250"></textarea>
							<div id="reply-submit">
								<button type="button" onclick="reply()" id="reply-btn">등록</button>
							</div>

						</form>
					</div>
				</div>
			</div>
		</div>
	</div>


	<!-- ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
내 용 : 투표 하기
작성자 : 동언
■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ -->
	<script>
		function vsVote(button_id) {
			var vdata = {
				"button_id" : button_id
			//전자를 선택할경우 voteleft가 옴
			};
			jQuery
					.ajax({
						type : "POST",
						url : "Vote.do?b_seq=${vo.b_seq}",
						data : vdata,
						async : false,
						success : function(data) {
							if (data == "a") {
								alertify.error("투표 실패");
							} else if (data == "c") {
								alertify.error("이미 투표하셨습니다.");
							} else {
								alertify.success('투표 하셨습니다.');
								location.reload();
							}
						},
						error : function(req, status, error) {
							alertify.alert(req.status + "\nmessege"
									+ req.responseTest);
						}
					});
		}
	</script>
<!-- ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
내 용 : 추천 하기
작성자 : 동언
■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ -->
	<script>
		function like(button_id) {
			var vdata = {
					"button_id" : button_id			
				};
				jQuery
						.ajax({
							type : "POST",
							url : "Like.do?b_seq=${vo.b_seq}",
							data : vdata,
							async : false,
							success : function(data) {
								if (data == 0) {
									alertify.error("추천 실패");
								} else if (data == 1) {
									alertify.error("이미 추천하셨습니다.");
								} else {
									alertify.success('추천 하셨습니다.');
									location.reload();
								}
							},
							error : function(req, status, error) {
								alertify.alert(req.status + "\nmessege"
										+ req.responseTest);
							}
						});
		}
	</script>
	
		<!-- ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
내 용 : 댓글 작성
작성자 : 남철
■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ -->
	<script>
		$(document).ready(function() {
			$('#r_reply').summernote({
				height : 100,
				minHeight : 100,
				maxHeight : 100,
				airmode : false,
				toolbar : false,
				disableDragAndDrop : true,
				shortcuts : false,

				placeholder : ' 댓글 쓰기.. ',
				lang : 'ko-KR'

			});
		});

		var edit = function() {
			$('#reply_content_1').summernote({
				height : 100,
				minHeight : 100,
				maxHeight : 100,				
				focus : true,
				airmode : false,
				toolbar : false,
				disableDragAndDrop : true,
				shortcuts : false,
				lang : 'ko-KR'

			});
		};

		function reply() {
			if ($("#r_reply").val() == "") {
				alertify.error("내용을 입력해주세요");
				return;
			}
			;
			$.ajax({
				type : 'GET',
				url : 'Reply.do?b_seq=${vo.b_seq}',
				async : false,
				data : $("#replyform").serialize(),
				dataType : 'json',//동기 비동기 설정
				error : function() {
					alertify.error('먼저 로그인 하세요.');
				},
				success : function(data) {
					location.reload();
				}
			});

		}
	</script>

</body>

</html>