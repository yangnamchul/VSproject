<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="t_Header.jsp"%>

<link
	href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-lite.css"
	rel="stylesheet">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-lite.js"></script>
<script src="resources/js/summernote-ko-KR.js"></script>
</head>

<body>

	<div id="content-area">
		<div class="container" id="main">
			<div class="row" id="writeDiv">
				<div class="col-12 col-sm-12 col-lg-12 col-xl-12">
					<div class="frame">
						<div class="col-12 col-sm-12 col-lg-12 col-xl-12" id="write-info">
							<!-- 						최상위 부스러기일시 부모 표시 -->
							<a href=""><span id="vss" style="float: right"> 무엇 </span></a>
							글쓰기
						</div>
						<!-- 										세션보고 비회원일때만 나오게  시작-->
						<div class="col-12 col-sm-6 col-lg-6 col-xl-6" id="write-nickpw">
							<input type="text" name="" id="p_id" maxlength="10"
								placeholder="작성자" /> <input type="password" name="" id="p_pw"
								maxlength="20" placeholder="암호" />
						</div>
						<!-- 						비회원 나오게 끝 -->

						<form action="BoardInsertData.do" method="POST">
							<div id="write-vscheck">
								<input type="checkbox" name="vsCheck" id="vsCheck"
									value="vsCheck">

								<!-- 										vs 유무 -->
								<button type="button" id="btn_vschk">VS!</button>
							</div>

							<div class="col-12 col-sm-8 col-lg-6 col-xl-6" id="write-title">
								<input type="text" name="" id="p_title" maxlength="40"
									placeholder="제목" />

							</div>
							<div class="col-12 col-sm-12 col-lg-12 col-xl-12"
								id="write-content">

								<div id="write-vs" style="display: none;">

									<textarea name="vsleft" id="vsleft"></textarea>
									
						<img src="resources/css/test/versus.png" alt="" id="write-img-vs"/>
				
									<textarea name="vsright" id="vsright"></textarea>

								</div>
								<textarea rows="10" cols="50" name="b_content" id="b_content"
									placeholder="게시판 내용"></textarea>
							</div>

							<div id="write-submit">
								<input type="submit" value="등록하기" id="write-btn-submit">
							</div>
						</form>
					</div>

				</div>
			</div>
		</div>
	</div>

</body>
<script>
	function sendfile(file, el) {
		data = new FormData();
		data.append("file", file);
		$.ajax({
			data : data,
			type : "POST",
			url : 'BoardInsertFile.do',
			cache : false,
			contentType : false,
			processData : false,
			success : function(data) {
				$(el).summernote('editor.insertImage', data.url);
			},
			error : function() {
				alert("실패");
			}
		});
	}

	$(document)
			.ready(
					function() {
						/* 텍스트 에디터 설정 */
						$('#b_content')
								.summernote(
										{
											height : 300,
											minHeight : null,
											maxHeight : null,
											focus : true,
											airmode : true,
											lang : 'ko-KR',
											placeholder : ' 내용을 입력하세요. ',
											toolbar : [
													[
															'font',
															[
																	'bold',
																	'underline',
																	'clear' ] ],
													[ 'fontname',
															[ 'fontname' ] ],
													[ 'fontsize',
															[ 'fontsize' ] ],
													[ 'color', [ 'color' ] ],
													[ 'para', [ 'paragraph' ] ],
													[
															'insert',
															[ 'link',
																	'picture',
																	'video' ] ],
													[
															'view',
															[ 'fullscreen',
																	'codeview',
																	'help' ] ], ],
											fontNames : [ 'DungGeunMo',
													'Arial', 'Arial Black',
													'Comic Sans MS',
													'Courier New' ],
											fontNamesIgnoreCheck : [ 'DungGeunMo' ],
											callbacks : {
												onImageUpload : function(file,
														editor, welEditable) {
													sendfile(file[0], this);
												}
											},
											hint : {
												mentions : [ '사자', '악어', '펭귄',
														'고양이', '강아지', 'COW',
														'RABBIT', 'SNAKE',
														'기만 ㄴ' ],
												match : /\B@([a-z|A-Z|\u3131-\u314e|\u314f-\u3163|\uac00-\ud7a3]*)/,
												search : function(keyword,
														callback) {
													callback($
															.grep(
																	this.mentions,
																	function(
																			item) {
																		return item
																				.indexOf(keyword) === 0;
																	}));
												},
												template : function(item) {
													return item;
												},
												content : function(item) {
													return '@' + item;
												}
											}
										});

						$('#vsCheck').change(function() {
							if ($('#vsCheck').is(':checked')) {
								$('#write-vs').css('display', 'inline-flex');
								$("#write-vs > div:nth-child(2) > div.note-editing-area > div.note-editable").focus();
								// 								$('#write-msg').css('display', 'block');
							} else {
								$('#write-vs').css('display', 'none');
								// 								$('#write-msg').css('display', 'none');

							}
						})

						$('#vsleft')
								.summernote(
										{
											height : 300,
											minHeight : null,
											maxHeight : null,
											focus : true,
											airmode : true,
											lang : 'ko-KR',
											placeholder : ' <span id="vss">전자(Left)</span> <br> 내용을 입력하시거나 해당 아이콘을 선택하세요.',
											toolbar : [
													[
															'insert',
															[ 'picture',
																	'video' ] ], ],
											callbacks : {
												onImageUpload : function(file,
														editor, welEditable) {
													sendfile(file[0], this);
												}
											}
										});

						$('#vsright')
								.summernote(
										{
											height : 300,
											minHeight : null,
											maxHeight : null,
											focus : true,
											airmode : true,
											lang : 'ko-KR',
											placeholder : ' <span id="vss">후자(Right)</span> <br> 내용을 입력하시거나 해당 아이콘을 선택하세요.',
											toolbar : [
													[
															'insert',
															[ 'picture',
																	'video' ] ], ],
											callbacks : {
												onImageUpload : function(file,
														editor, welEditable) {
													sendfile(file[0], this);
												}
											}
										});
						// 						$("#write-vs > div:nth-child(2) > div.note-toolbar").prepend("내용을 추가하려면 해당 아이콘을 선택하세요. ▶ ") ;

					});
</script>
</html>
