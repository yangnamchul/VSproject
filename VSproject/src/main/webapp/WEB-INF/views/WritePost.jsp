<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

	<div id="content-area">
		<div class="container" id="main">
			<div class="row" id="writeDiv">
				<div class="col-12 col-sm-12 col-lg-12 col-xl-12">
					<div class="frame">
						<div class="col-12 col-sm-12 col-lg-12 col-xl-12" id="write-info">
							<!-- 						최상위 부스러기일시 부모 표시 -->
							<a href="VSSBoard.do?vss_seq=${vss_seq}"><span id="vss" style="float: right">${vssName } </span></a>
							글쓰기
						</div>

						<form action="BoardInsertData.do" method="POST">
							<div id="write-vscheck">
								<input type="checkbox" name="vsCheck" id="vsCheck"
									value="vsCheck">
								<!-- 										vs 유무 -->
								<button type="button" id="btn_vschk">VS!</button>
							</div>
							<div class="col-12 col-sm-8 col-lg-6 col-xl-6" id="write-title">
								<input type="text" name="b_title" id="b_title" maxlength="35"
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
								<input type="hidden" value="${vss_seq }" name="vss_seq"/>
								<input type="hidden" value="${vss_seq }" name="vss_seq_${vss_seq }" />
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
						$.ajax({
							  url: 'getAllVSS.do',
							  async: false ,
							  dataType : 'json'
							}).then(function(data) {
								window.vss1 = data[0];
								window.vss = Object.keys(vss1);
								window.vss2 = data[1]; 
								console.log(vss);
						});
						
						/* 텍스트 에디터 설정 */
						$('#b_content').summernote(
										{
											height : 300,
											minHeight : null,
											maxHeight : null,
											focus : true,
											airmode : false,
											lang : 'ko-KR',
											placeholder : ' 내용을 입력하세요. ',
											toolbar : [['font',['bold','underline','clear' ] ],[ 'fontname',[ 'fontname' ] ],
												[ 'fontsize',[ 'fontsize' ] ],[ 'color', [ 'color' ] ],[ 'para', [ 'paragraph' ] ],
												['insert',[ 'link','picture','video' ] ],
													['view',[ 'fullscreen','codeview','help' ] ], ],
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
											hint: {
											    match: /:([a-z|A-Z|\u3131-\u314e|\u314f-\u3163|\uac00-\ud7a3]*)$/,
											    search: function (keyword, callback) {
											      callback($.grep(vss, function (item) {
											        return item.indexOf(keyword)  === 0;
											      }));
											    },
											    template: function (item) {
											    	var name1 = vss1[item];
											    	var content1 = vss2[item];
											     	return item + ":" + content1;
											    },
											    content: function (item) {
											    	var seq = vss1[item];
											    	alert(seq);
											    	if (seq) {
											    		  $('.note-editable').append($('<a />', {
											    		        id: 'vss',
											    		        href: 'VssBoard.do?vss_seq=?' + seq ,
											    		        text: item
											    		    }));									    													    		
// 											      		$('.note-editable').append('<a id="vss" href="VSSBoard.do?vss_seq=' + seq + '">' + item + '</a>');
// 											      		$('.note-editable').append('<input type="hidden" name="vss_seq_'+ seq + '" value="' + seq + '" />');
											    	}
											    	return '';
											    }
											  }
										});					

						$('#vsleft')
								.summernote(
										{
											height : 300,
											minHeight : null,
											maxHeight : null,
											focus : true,
											airmode : false,
											lang : 'ko-KR',
											placeholder : ' <span id="vss">전자(Left)</span> <br> 내용을 입력하시거나 해당 아이콘을 선택하세요.',
											toolbar : [
													[
															'insert',
															[ 'picture',
																	'video' ] ], ],
											callbacks : {
													onImageUpload : function(file,editor, welEditable) {
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
											airmode : false,
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
						
					});
</script>

<script type="text/javascript">
	$('#vsCheck')
			.change(
					function() {
						if ($('#vsCheck').is(':checked')) {
							$('#write-vs').css('display', 'inline-flex');
							$(
									"#write-vs > div:nth-child(2) > div.note-editing-area > div.note-editable")
									.focus();
							//                         $('#write-msg').css('display', 'block');
						} else {
							$('#write-vs').css('display', 'none');
							//                         $('#write-msg').css('display', 'none');

						}
					});

	$('#btn_vschk').click(function() {
		$('#vsCheck').prop('checked', !$('#vsCheck').prop('checked'));
		$('#vsCheck').trigger('change');
	});
</script>

</html>
