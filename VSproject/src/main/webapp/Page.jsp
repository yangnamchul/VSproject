<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>티스토리 css</title>
</head>

<link rel="stylesheet" type="text/css"	href="resources/css/test/t.css" />

	
<body>

 <%@ include file="/t_Header.jsp" %> 



	<section class="post">
		
		<section class="comments grid">


			<!-- ==========왼쪽========= -->
			<div class="title buttons icon">
				<button id="button-comment" class="icon text active">
					<svg class="normal">
						<use xlink:href="#icon-comment"></use></svg>
					<span id="commentCount193_0"> <span class="count">261</span>
					</span>
					<svg class="normal expand">
								<g class="button-expand-icon icon active">
									<rect class="lef" x="4" y="15" width="12" height="2"></rect>
									<rect class="cen" x="15" y="15" width="2" height="2"></rect>
									<rect class="rig" x="16" y="15" width="12" height="2"></rect>
								</g>
							</svg>
					<svg class="normal fallback">
						<use xlink:href="#icon-expand"></use></svg>
					<svg class="normal fallback">
						<use xlink:href="#icon-collapse"></use></svg>
				</button>
			</div>
			<!-- ============우측========== -->
			<div id="entry193Comment" style="display: block" class="grid">
				<div id="post-comments" class="comments grid full active">

					<form method="post" action="/comment/add/193"
						onsubmit="return false">
						<div class="textfield grid full">


							<div class="guest">
								<input type="text" name="name" value="" class="content name"
									placeholder="이름"> <input type="password" maxlength="8"
									name="password" value="" class="content password"
									placeholder="비밀번호">
							</div>

							<div class="buttons icon">
								<div class="checkbox icon">
									<input type="checkbox" name="secret" class="small">
									<button id="button-comment-lock" class="icon enabled on_off">
										<svg class="small">
											<use xlink:href="#icon-lock-open"></use></svg>
										<svg class="small">
											<use xlink:href="#icon-lock"></use></svg>
									</button>
								</div>
							</div>


							<div class="input">
								<textarea name="comment" id="textarea-comment"
									class="content autoheight" placeholder="댓글 쓰기…"
									style="overflow: hidden; overflow-wrap: break-word; height: 28px;"></textarea>
								<div class="buttons icon">
									<div class="icon">
										<svg class="small"></svg>
									</div>
									<button onclick="addComment(this, 193); return false;"
										id="button-comment-send" class="icon floating disabled">
										<svg class="normal">
											<use xlink:href="#icon-send"></use></svg>
									</button>
								</div>
							</div>
						</div>
					</form>


					<ul class="comments grid full">
						<li id="ttMorePreviousCommentsFor193"
							class="tt_more_preview_comments_wrap"
							onclick="getEntryCommentsByPaging(193); return false;"
							style="text-align: center; cursor: pointer"><span
							class="tt_more_preview_comments_text">이전 댓글 더보기</span><input
							id="ttMorePreviousCommentsFirstWrittenFor193" type="hidden"
							value="1562362931"><input
							id="ttMorePreviousCommentsFirstIdFor193" type="hidden"
							value="15502460"></li>

						<!-- ㄹㅇㄹㅇㄴㄹㅇㄴㄹㅇㄹㅇㄴㄹㅇㄴㄹㅇㄴ -->
						<li id="comment15526830" class="comment grid full content">
							<div class="comment grid full">
								<div class="info contents rp_general">
									<h5 class="name">진박사</h5>
									<div class="date">19. 8. 26. 10:26</div>
								</div>
								<p>와! ㅋㅋㅋㅋ 이거 유용하겠aaaaaaaaaaaaaaㅋ 이거 유용하겠aaaaaaaaaaaaaaaㅋ 이거
									유용하겠aaaaaaaaaaaaaaaㅋ 이거 유용하겠aaaaaaaaaaaaaaaㅋ 이거
									유용하겠aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa네요</p>

								<div class="buttons dropdown icon small right">
									<div class="nav-dropdown-comment dropdown">
										<a class="button-comment-edit icon" href="#"
											onclick="deleteComment(15526830);return false"><svg
												class="small">
												<use xlink:href="#icon-write"></use></svg></a> <a
											class="button-comment-reply icon" href="#"
											onclick="commentComment(15526830); return false"><svg
												class="small">
												<use xlink:href="#icon-comment"></use></svg></a>
									</div>
									<button class="button-comment-more icon small on_off">
										<svg class="small">
											<use xlink:href="#icon-more"></use></svg>
										<svg class="small">
											<use xlink:href="#icon-close"></use></svg>
									</button>
									<div class="background-hover"></div>
								</div>
							</div>


						</li>

					</ul>

					<!-- ========리스트 끝 -->

				</div>
			</div>
			<script type="text/javascript">
				loadedComments[193] = true;
				findFragmentAndHighlight(193)
			</script>

		</section>
	</section>
</body>
</html>