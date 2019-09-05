<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../WEB-INF/views/Header.jsp"%>

<link rel="stylesheet" type="text/css" href="resources/css/VSsReply.css">
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
				<div class="" id="content-title">Title 제목 ex)아이폰 Vs 갤럭시</div>

				<!-- 				모바일 화면에서 바꿀것 @media-->
				<div class="" id="content-info">
					<%-- 					<td>${vo.b_seq }보드시퀀스</td> --%>
					<%-- 					<td>${vo.u_id }유저아이디</td> --%>
					<%-- 					<td>${vo.b_date }보드작성일</td> --%>
					<ul>
						<li>번호_${vo.b_seq}</li>
						<li>별명_${u_id}</li>
						<li>날짜_ <fmt:formatDate value="${vo.b_date}" pattern="MM-dd" />
						</li>
						<li>조회_${vo.b_cnt}</li>
						<li>추천_{}</li>
					</ul>
				</div>




				<div class="col-12" id="content-vs" style="display: none">
					<div class="col-5" id="vs-left">${vo.b_left }</div>
					<div class="col-2" id="vs-vs">
						<img src="resources/css/test/versus.png" alt="" />
					</div>
					<div class="col-5" id="vs-right">${vo.b_right }</div>
				</div>
				<div class="col-12" id="content-vote">
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
				<div id="content-content">${vo.b_content}</div>


			</div>
			<!-- 			댓글입력창 (임시) -->
			

		</div>
	</div>
	
	
	<section class="comments grid" style="overflow: visible;">

					<div class="title buttons icon">
						<button id="button-comment" class="icon text active">
							<svg class="normal"><use xlink:href="#icon-comment"></use></svg>
							<span id="commentCount193_0">
								<span class="count">265</span>
							</span>
							<svg class="normal expand">
								<g class="button-expand-icon icon active">
									<rect class="lef" x="4" y="15" width="12" height="2"></rect>
									<rect class="cen" x="15" y="15" width="2" height="2"></rect>
									<rect class="rig" x="16" y="15" width="12" height="2"></rect>
								</g>
							</svg>
							<svg class="normal fallback"><use xlink:href="#icon-expand"></use></svg>
							<svg class="normal fallback"><use xlink:href="#icon-collapse"></use></svg>
						</button>
					</div>

					<div id="entry193Comment" style="display:block" class="grid">
						<div id="post-comments" class="comments grid full active">

							<form method="post" action="/comment/add/193" onsubmit="return false">
								<div class="textfield grid full">
									
										
											<div class="guest">
												<input type="text" name="name" value="" class="content name" placeholder="이름">
												<input type="password" maxlength="8" name="password" value="" class="content password" placeholder="비밀번호">
											</div>
										
										<div class="buttons icon">
											<div class="checkbox icon">
												<input type="checkbox" name="secret" class="small">
												<button id="button-comment-lock" class="icon enabled on_off">
													<svg class="small"><use xlink:href="#icon-lock-open"></use></svg>
													<svg class="small"><use xlink:href="#icon-lock"></use></svg>
												</button>
											</div>
										</div>
									

									<div class="input">
										<textarea name="comment" id="textarea-comment" class="content autoheight" placeholder="댓글 쓰기…" style="overflow: hidden; overflow-wrap: break-word; height: 28px;"></textarea>
										<div class="buttons icon">
											<div class="icon">
												<svg class="small"></svg>
											</div>
											<button onclick="addComment(this, 193); return false;" id="button-comment-send" class="icon floating disabled"><svg class="normal"><use xlink:href="#icon-send"></use></svg></button>
										</div>
									</div>
								</div>
							</form>

							
								<ul class="comments grid full">
									<li id="ttMorePreviousCommentsFor193" class="tt_more_preview_comments_wrap" onclick="getEntryCommentsByPaging(193); return false;" style="text-align:center;cursor:pointer"><span class="tt_more_preview_comments_text">이전 댓글 더보기</span><input id="ttMorePreviousCommentsFirstWrittenFor193" type="hidden" value="1559148716"><input id="ttMorePreviousCommentsFirstIdFor193" type="hidden" value="15483528"></li>
										<li id="comment15483528" class="comment grid full content">
											<div class="comment grid full">
												<div class="info contents rp_general">
													<h5 class="name">:)</h5>
													<div class="date">19. 5. 30. 01:51</div>
												</div>
												<p>감사합니다 ^^!</p>
												<div class="buttons dropdown icon small right">
													<div class="nav-dropdown-comment dropdown">
														<a class="button-comment-edit icon" href="#" onclick="deleteComment(15483528);return false"><svg class="small"><use xlink:href="#icon-write"></use></svg></a>
														<a class="button-comment-reply icon" href="#" onclick="commentComment(15483528); return false"><svg class="small"><use xlink:href="#icon-comment"></use></svg></a>
													</div>
													<button class="button-comment-more icon small on_off">
														<svg class="small"><use xlink:href="#icon-more"></use></svg>
														<svg class="small"><use xlink:href="#icon-close"></use></svg>
													</button>
													<div class="background-hover"></div>
												</div>
											</div>

											
										</li><li id="comment15483933" class="comment grid full content">
											<div class="comment grid full">
												<div class="info contents rp_general">
													<h5 class="name">뷰븁</h5>
													<div class="date">19. 5. 30. 20:14</div>
												</div>
												<p>최고에요 .̑̈.̑̈</p>
												<div class="buttons dropdown icon small right">
													<div class="nav-dropdown-comment dropdown">
														<a class="button-comment-edit icon" href="#" onclick="deleteComment(15483933);return false"><svg class="small"><use xlink:href="#icon-write"></use></svg></a>
														<a class="button-comment-reply icon" href="#" onclick="commentComment(15483933); return false"><svg class="small"><use xlink:href="#icon-comment"></use></svg></a>
													</div>
													<button class="button-comment-more icon small on_off">
														<svg class="small"><use xlink:href="#icon-more"></use></svg>
														<svg class="small"><use xlink:href="#icon-close"></use></svg>
													</button>
													<div class="background-hover"></div>
												</div>
											</div>

											
										</li><li id="comment15485479" class="comment grid full content">
											<div class="comment grid full">
												<div class="info contents rp_general">
													<h5 class="name">샌즈</h5>
													<div class="date">19. 6. 3. 00:10</div>
												</div>
												<p>ㄹㅇ 사이트 컨셉 잘잡았네요ㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋ 감사합니다!</p>
												<div class="buttons dropdown icon small right">
													<div class="nav-dropdown-comment dropdown">
														<a class="button-comment-edit icon" href="#" onclick="deleteComment(15485479);return false"><svg class="small"><use xlink:href="#icon-write"></use></svg></a>
														<a class="button-comment-reply icon" href="#" onclick="commentComment(15485479); return false"><svg class="small"><use xlink:href="#icon-comment"></use></svg></a>
													</div>
													<button class="button-comment-more icon small on_off">
														<svg class="small"><use xlink:href="#icon-more"></use></svg>
														<svg class="small"><use xlink:href="#icon-close"></use></svg>
													</button>
													<div class="background-hover"></div>
												</div>
											</div>

											
										</li><li id="comment15486002" class="comment grid full content">
											<div class="comment grid full">
												<div class="info contents rp_general">
													<h5 class="name">굿굿</h5>
													<div class="date">19. 6. 3. 23:48</div>
												</div>
												<p>빈티지하고 유니크해요 굿굿</p>
												<div class="buttons dropdown icon small right">
													<div class="nav-dropdown-comment dropdown">
														<a class="button-comment-edit icon" href="#" onclick="deleteComment(15486002);return false"><svg class="small"><use xlink:href="#icon-write"></use></svg></a>
														<a class="button-comment-reply icon" href="#" onclick="commentComment(15486002); return false"><svg class="small"><use xlink:href="#icon-comment"></use></svg></a>
													</div>
													<button class="button-comment-more icon small on_off">
														<svg class="small"><use xlink:href="#icon-more"></use></svg>
														<svg class="small"><use xlink:href="#icon-close"></use></svg>
													</button>
													<div class="background-hover"></div>
												</div>
											</div>

											
										</li><li id="comment15486428" class="comment grid full content">
											<div class="comment grid full">
												<div class="info contents rp_general">
													<h5 class="name">엌</h5>
													<div class="date">19. 6. 4. 23:27</div>
												</div>
												<p>엌</p>
												<div class="buttons dropdown icon small right">
													<div class="nav-dropdown-comment dropdown">
														<a class="button-comment-edit icon" href="#" onclick="deleteComment(15486428);return false"><svg class="small"><use xlink:href="#icon-write"></use></svg></a>
														<a class="button-comment-reply icon" href="#" onclick="commentComment(15486428); return false"><svg class="small"><use xlink:href="#icon-comment"></use></svg></a>
													</div>
													<button class="button-comment-more icon small on_off">
														<svg class="small"><use xlink:href="#icon-more"></use></svg>
														<svg class="small"><use xlink:href="#icon-close"></use></svg>
													</button>
													<div class="background-hover"></div>
												</div>
											</div>

											
										</li><li id="comment15493293" class="comment grid full content">
											<div class="comment grid full">
												<div class="info contents rp_general">
													<h5 class="name">지안</h5>
													<div class="date">19. 6. 16. 08:41</div>
												</div>
												<p>엉엉 폰트 너무 예뻐요♡ 휴대폰에서도 사용할 수 있으면 유료여도 구매하고 사용할 겁니다 ㅠㅠ</p>
												<div class="buttons dropdown icon small right">
													<div class="nav-dropdown-comment dropdown">
														<a class="button-comment-edit icon" href="#" onclick="deleteComment(15493293);return false"><svg class="small"><use xlink:href="#icon-write"></use></svg></a>
														<a class="button-comment-reply icon" href="#" onclick="commentComment(15493293); return false"><svg class="small"><use xlink:href="#icon-comment"></use></svg></a>
													</div>
													<button class="button-comment-more icon small on_off">
														<svg class="small"><use xlink:href="#icon-more"></use></svg>
														<svg class="small"><use xlink:href="#icon-close"></use></svg>
													</button>
													<div class="background-hover"></div>
												</div>
											</div>

											
										</li><li id="comment15493829" class="comment grid full content">
											<div class="comment grid full">
												<div class="info contents rp_general">
													<h5 class="name"><a href="https://blog.rgbplace.com" onclick="return openLinkInNewWindow(this)">Blue_parr0t</a><span class="tistoryProfileLayerTrigger" onclick="TistoryProfile.show(event, this, {&quot;title&quot;:&quot;root story&quot;,&quot;url&quot;:&quot;https:\/\/6lueparr0t.tistory.com&quot;,&quot;nickname&quot;:&quot;Blue_parr0t&quot;,&quot;items&quot;:[]}); return false;"></span></h5>
													<div class="date">19. 6. 17. 16:37</div>
												</div>
												<p>안녕하세요. 잘 쓰고 있는데 TTF 파일이 NEO 둥근모꼴에 비해 좀 큰거같아요. 뭔가 줄일 수 있는 여지는 없을까요? 언제나 감사합니다.</p>
												<div class="buttons dropdown icon small right">
													<div class="nav-dropdown-comment dropdown">
														<a class="button-comment-edit icon" href="#" onclick="deleteComment(15493829);return false"><svg class="small"><use xlink:href="#icon-write"></use></svg></a>
														<a class="button-comment-reply icon" href="#" onclick="commentComment(15493829); return false"><svg class="small"><use xlink:href="#icon-comment"></use></svg></a>
													</div>
													<button class="button-comment-more icon small on_off">
														<svg class="small"><use xlink:href="#icon-more"></use></svg>
														<svg class="small"><use xlink:href="#icon-close"></use></svg>
													</button>
													<div class="background-hover"></div>
												</div>
											</div>

											
												<ul class="comments">
													
														<li id="comment15495973" class="comment">
															<div class="comment">
																<div class="info contents rp_admin">
																	<h5 class="name"><a href="https://cactus.tistory.com" onclick="return openLinkInNewWindow(this)"> 길형진</a><span class="tistoryProfileLayerTrigger" onclick="TistoryProfile.show(event, this, {&quot;title&quot;:&quot;CACTUS&quot;,&quot;url&quot;:&quot;https:\/\/cactus.tistory.com&quot;,&quot;nickname&quot;:&quot;\uae38\ud615\uc9c4&quot;,&quot;items&quot;:[]}); return false;"></span></h5>
																	<div class="date">19. 6. 22. 00:52</div>
																</div>
																<p>답장이 늦어 죄송합니다. 각각의 글자를 컴포넌트화하고 조합하면 TTF의 용량을 많이 줄일 수 있긴 한데, 적은 용량이 필요한 앱이나 웹 환경 같은 경우에는 서브루틴 압축이 적용된 OTF를 쓰거나 웹폰트를 사용하면 문제는 웬만하면 없을 듯해 아직까지는 차순위로 생각하고 있습니다. 나중에 여유가 된다면 시도해보려고 합니다.</p>
																<div class="buttons dropdown icon small right">
																	<div class="nav-dropdown-comment dropdown">
																		<a class="button-comment-edit icon" href="#" onclick="deleteComment(15495973); return false;"><svg class="small"><use xlink:href="#icon-write"></use></svg></a>
																	</div>
																	<button class="button-comment-more icon small on_off">
																		<svg class="small"><use xlink:href="#icon-more"></use></svg>
																		<svg class="small"><use xlink:href="#icon-close"></use></svg>
																	</button>
																	<div class="background-hover"></div>
																</div>
															</div>
														</li>
													
												</ul>
											
										</li><li id="comment15494410" class="comment grid full content">
											<div class="comment grid full">
												<div class="info contents rp_general">
													<h5 class="name">나래</h5>
													<div class="date">19. 6. 18. 18:25</div>
												</div>
												<p>미쳐따 진짜 센스 ㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋ</p>
												<div class="buttons dropdown icon small right">
													<div class="nav-dropdown-comment dropdown">
														<a class="button-comment-edit icon" href="#" onclick="deleteComment(15494410);return false"><svg class="small"><use xlink:href="#icon-write"></use></svg></a>
														<a class="button-comment-reply icon" href="#" onclick="commentComment(15494410); return false"><svg class="small"><use xlink:href="#icon-comment"></use></svg></a>
													</div>
													<button class="button-comment-more icon small on_off">
														<svg class="small"><use xlink:href="#icon-more"></use></svg>
														<svg class="small"><use xlink:href="#icon-close"></use></svg>
													</button>
													<div class="background-hover"></div>
												</div>
											</div>

											
										</li><li id="comment15494934" class="comment grid full content">
											<div class="comment grid full">
												<div class="info contents rp_general">
													<h5 class="name">ㅇㅇ</h5>
													<div class="date">19. 6. 19. 17:57</div>
												</div>
												<p>정말 감사합니다 센스 좋네요 게임 폰트로 쓸게용</p>
												<div class="buttons dropdown icon small right">
													<div class="nav-dropdown-comment dropdown">
														<a class="button-comment-edit icon" href="#" onclick="deleteComment(15494934);return false"><svg class="small"><use xlink:href="#icon-write"></use></svg></a>
														<a class="button-comment-reply icon" href="#" onclick="commentComment(15494934); return false"><svg class="small"><use xlink:href="#icon-comment"></use></svg></a>
													</div>
													<button class="button-comment-more icon small on_off">
														<svg class="small"><use xlink:href="#icon-more"></use></svg>
														<svg class="small"><use xlink:href="#icon-close"></use></svg>
													</button>
													<div class="background-hover"></div>
												</div>
											</div>

											
										</li><li id="comment15496632" class="comment grid full content">
											<div class="comment grid full">
												<div class="info contents rp_general">
													<h5 class="name">현</h5>
													<div class="date">19. 6. 23. 21:36</div>
												</div>
												<p>너무 좋아요 진짜 잘쓸게요 감사합니다익!!!!!</p>
												<div class="buttons dropdown icon small right">
													<div class="nav-dropdown-comment dropdown">
														<a class="button-comment-edit icon" href="#" onclick="deleteComment(15496632);return false"><svg class="small"><use xlink:href="#icon-write"></use></svg></a>
														<a class="button-comment-reply icon" href="#" onclick="commentComment(15496632); return false"><svg class="small"><use xlink:href="#icon-comment"></use></svg></a>
													</div>
													<button class="button-comment-more icon small on_off">
														<svg class="small"><use xlink:href="#icon-more"></use></svg>
														<svg class="small"><use xlink:href="#icon-close"></use></svg>
													</button>
													<div class="background-hover"></div>
												</div>
											</div>

											
										</li><li id="comment15497217" class="comment grid full content">
											<div class="comment grid full">
												<div class="info contents rp_general">
													<h5 class="name"><a href="https://us-able.tistory.com" onclick="return openLinkInNewWindow(this)">박달나무꽃</a></h5>
													<div class="date">19. 6. 25. 01:58</div>
												</div>
												<p>정말 너무 감사드립니다</p>
												<div class="buttons dropdown icon small right">
													<div class="nav-dropdown-comment dropdown">
														<a class="button-comment-edit icon" href="#" onclick="deleteComment(15497217);return false"><svg class="small"><use xlink:href="#icon-write"></use></svg></a>
														<a class="button-comment-reply icon" href="#" onclick="commentComment(15497217); return false"><svg class="small"><use xlink:href="#icon-comment"></use></svg></a>
													</div>
													<button class="button-comment-more icon small on_off">
														<svg class="small"><use xlink:href="#icon-more"></use></svg>
														<svg class="small"><use xlink:href="#icon-close"></use></svg>
													</button>
													<div class="background-hover"></div>
												</div>
											</div>

											
										</li><li id="comment15497478" class="comment grid full content">
											<div class="comment grid full">
												<div class="info contents rp_general">
													<h5 class="name">ㅇㅇ</h5>
													<div class="date">19. 6. 25. 18:27</div>
												</div>
												<p>폰트부터 사이트까지 너무 멋져요... 많이 버세요...</p>
												<div class="buttons dropdown icon small right">
													<div class="nav-dropdown-comment dropdown">
														<a class="button-comment-edit icon" href="#" onclick="deleteComment(15497478);return false"><svg class="small"><use xlink:href="#icon-write"></use></svg></a>
														<a class="button-comment-reply icon" href="#" onclick="commentComment(15497478); return false"><svg class="small"><use xlink:href="#icon-comment"></use></svg></a>
													</div>
													<button class="button-comment-more icon small on_off">
														<svg class="small"><use xlink:href="#icon-more"></use></svg>
														<svg class="small"><use xlink:href="#icon-close"></use></svg>
													</button>
													<div class="background-hover"></div>
												</div>
											</div>

											
										</li><li id="comment15498047" class="comment grid full content">
											<div class="comment grid full">
												<div class="info contents rp_general">
													<h5 class="name">ㄷㄷ</h5>
													<div class="date">19. 6. 27. 03:11</div>
												</div>
												<p>와..진짜 대박이에요 많이 버세요 잘쓰겠습니다 ㅜㅜㅜㅜㅜㅜ</p>
												<div class="buttons dropdown icon small right">
													<div class="nav-dropdown-comment dropdown">
														<a class="button-comment-edit icon" href="#" onclick="deleteComment(15498047);return false"><svg class="small"><use xlink:href="#icon-write"></use></svg></a>
														<a class="button-comment-reply icon" href="#" onclick="commentComment(15498047); return false"><svg class="small"><use xlink:href="#icon-comment"></use></svg></a>
													</div>
													<button class="button-comment-more icon small on_off">
														<svg class="small"><use xlink:href="#icon-more"></use></svg>
														<svg class="small"><use xlink:href="#icon-close"></use></svg>
													</button>
													<div class="background-hover"></div>
												</div>
											</div>

											
										</li><li id="comment15498455" class="comment grid full content">
											<div class="comment grid full">
												<div class="info contents rp_general">
													<h5 class="name">와</h5>
													<div class="date">19. 6. 27. 22:28</div>
												</div>
												<p>이런느낌의도트글씨체를원했습니다감사합니다잘쓰겠습니다</p>
												<div class="buttons dropdown icon small right">
													<div class="nav-dropdown-comment dropdown">
														<a class="button-comment-edit icon" href="#" onclick="deleteComment(15498455);return false"><svg class="small"><use xlink:href="#icon-write"></use></svg></a>
														<a class="button-comment-reply icon" href="#" onclick="commentComment(15498455); return false"><svg class="small"><use xlink:href="#icon-comment"></use></svg></a>
													</div>
													<button class="button-comment-more icon small on_off">
														<svg class="small"><use xlink:href="#icon-more"></use></svg>
														<svg class="small"><use xlink:href="#icon-close"></use></svg>
													</button>
													<div class="background-hover"></div>
												</div>
											</div>

											
										</li><li id="comment15499515" class="comment grid full content">
											<div class="comment grid full">
												<div class="info contents rp_general">
													<h5 class="name">MINE</h5>
													<div class="date">19. 6. 30. 18:22</div>
												</div>
												<p>이 감성 너무 좋아요! 잘 쓸겠습니다 :)</p>
												<div class="buttons dropdown icon small right">
													<div class="nav-dropdown-comment dropdown">
														<a class="button-comment-edit icon" href="#" onclick="deleteComment(15499515);return false"><svg class="small"><use xlink:href="#icon-write"></use></svg></a>
														<a class="button-comment-reply icon" href="#" onclick="commentComment(15499515); return false"><svg class="small"><use xlink:href="#icon-comment"></use></svg></a>
													</div>
													<button class="button-comment-more icon small on_off">
														<svg class="small"><use xlink:href="#icon-more"></use></svg>
														<svg class="small"><use xlink:href="#icon-close"></use></svg>
													</button>
													<div class="background-hover"></div>
												</div>
											</div>

											
										</li><li id="comment15501569" class="comment grid full content">
											<div class="comment grid full">
												<div class="info contents rp_general">
													<h5 class="name"><a href="https://poyton.tistory.com" onclick="return openLinkInNewWindow(this)">unknown...</a></h5>
													<div class="date">19. 7. 4. 12:26</div>
												</div>
												<p>감사합니다! 폰트 개예뻐... 적게 일하고 많이 버십시오. 사는동안 꽃길만 걸으소서.</p>
												<div class="buttons dropdown icon small right">
													<div class="nav-dropdown-comment dropdown">
														<a class="button-comment-edit icon" href="#" onclick="deleteComment(15501569);return false"><svg class="small"><use xlink:href="#icon-write"></use></svg></a>
														<a class="button-comment-reply icon" href="#" onclick="commentComment(15501569); return false"><svg class="small"><use xlink:href="#icon-comment"></use></svg></a>
													</div>
													<button class="button-comment-more icon small on_off">
														<svg class="small"><use xlink:href="#icon-more"></use></svg>
														<svg class="small"><use xlink:href="#icon-close"></use></svg>
													</button>
													<div class="background-hover"></div>
												</div>
											</div>

											
										</li><li id="comment15502460" class="comment grid full content">
											<div class="comment grid full">
												<div class="info contents rp_general">
													<h5 class="name">해협</h5>
													<div class="date">19. 7. 6. 06:42</div>
												</div>
												<p>안녕하세요! 레트로 느낌의 픽셀 폰트를 찾고 있던 중 너무나 운 좋게도 발견한 둥근모꼴로 무척이나 행복합니다. 우선 심심한 감사의 인사 전합니다. 정말 감사합니다!<br>
<br>
가능하다면 한 가지 여쭤보고 도움을 구하고자 하는데요 . . .<br>
저는 우선 맥북 사용자이고 TTF 파일을 다운 받아 사용 중입니다. 그런데 한글은 웹상에서도 잘 변환되고 타이핑 할 때도 문제가 없는데, 영문의 경우 웹 상에서 폰트가 변하지도 않고 제가 타이핑 할 때도 원래 서체 그대로 작성됩니다.. <br>
영문은 따로 설정을 해야 하는 건가요? 서체 변경이 이번이 처음이라 제가 많이 미숙해서 그런 것인지... 인터넷에 검색해서 여기저기 따라해보고 다시 설치해보고 했으나 여전히 영문에서는 예전 폰트가 그대로 적용되고 있습니다. 어찌 된 걸까요.. 이 폰트 놓치고 싶지 않아요 정말.. <br>
<br>
번거로우시겠지만 간단한 답변이라도 해주신다면 정말 감사하겠습니다. 좋은 하루 되시고 행복하시구 숨만 쉬어도 복이 저절로 굴러오는 삶을 사세요 제발. 당신께서는 그럴 자격 충분하다구요...</p>
												<div class="buttons dropdown icon small right">
													<div class="nav-dropdown-comment dropdown">
														<a class="button-comment-edit icon" href="#" onclick="deleteComment(15502460);return false"><svg class="small"><use xlink:href="#icon-write"></use></svg></a>
														<a class="button-comment-reply icon" href="#" onclick="commentComment(15502460); return false"><svg class="small"><use xlink:href="#icon-comment"></use></svg></a>
													</div>
													<button class="button-comment-more icon small on_off">
														<svg class="small"><use xlink:href="#icon-more"></use></svg>
														<svg class="small"><use xlink:href="#icon-close"></use></svg>
													</button>
													<div class="background-hover"></div>
												</div>
											</div>

											
												<ul class="comments">
													
														<li id="comment15502600" class="comment">
															<div class="comment">
																<div class="info contents rp_admin">
																	<h5 class="name"><a href="https://cactus.tistory.com" onclick="return openLinkInNewWindow(this)"> 길형진</a><span class="tistoryProfileLayerTrigger" onclick="TistoryProfile.show(event, this, {&quot;title&quot;:&quot;CACTUS&quot;,&quot;url&quot;:&quot;https:\/\/cactus.tistory.com&quot;,&quot;nickname&quot;:&quot;\uae38\ud615\uc9c4&quot;,&quot;items&quot;:[]}); return false;"></span></h5>
																	<div class="date">19. 7. 6. 15:25</div>
																</div>
																<p>안녕하세요. Safari에서 사용자 지정 CSS로 둥근모꼴을 사용하고 싶으시다면 둥근모꼴 글꼴을 DungGeunMo라는 이름으로 font-face로 만들어서 불러오고 font-family에 'DungGeunMo'를 넣으셔야 합니다. 사용하시는 브라우저가 Chrome이라면 font-family에서 'DungGeunMo'만 추가하시면 제대로 보이실 거예요. 혹시 답변이 부족하다면 orioncactus@gmail.com으로 메일 보내주시면 다시 답변해드리겠습니다.</p>
																<div class="buttons dropdown icon small right">
																	<div class="nav-dropdown-comment dropdown">
																		<a class="button-comment-edit icon" href="#" onclick="deleteComment(15502600); return false;"><svg class="small"><use xlink:href="#icon-write"></use></svg></a>
																	</div>
																	<button class="button-comment-more icon small on_off">
																		<svg class="small"><use xlink:href="#icon-more"></use></svg>
																		<svg class="small"><use xlink:href="#icon-close"></use></svg>
																	</button>
																	<div class="background-hover"></div>
																</div>
															</div>
														</li>
													
												</ul>
											
										</li><li id="comment15505710" class="comment grid full content">
											<div class="comment grid full">
												<div class="info contents rp_general">
													<h5 class="name">숨니</h5>
													<div class="date">19. 7. 13. 10:37</div>
												</div>
												<p>이쁜 글꼴 감사합니다 ㅎㅎ 프랑스어도 지원되어서 너무 좋네요 ...<br>
잘 쓰겠습니다 ~</p>
												<div class="buttons dropdown icon small right">
													<div class="nav-dropdown-comment dropdown">
														<a class="button-comment-edit icon" href="#" onclick="deleteComment(15505710);return false"><svg class="small"><use xlink:href="#icon-write"></use></svg></a>
														<a class="button-comment-reply icon" href="#" onclick="commentComment(15505710); return false"><svg class="small"><use xlink:href="#icon-comment"></use></svg></a>
													</div>
													<button class="button-comment-more icon small on_off">
														<svg class="small"><use xlink:href="#icon-more"></use></svg>
														<svg class="small"><use xlink:href="#icon-close"></use></svg>
													</button>
													<div class="background-hover"></div>
												</div>
											</div>

											
										</li><li id="comment15506468" class="comment grid full content">
											<div class="comment grid full">
												<div class="info contents rp_general">
													<h5 class="name">오잉또잉</h5>
													<div class="date">19. 7. 15. 09:33</div>
												</div>
												<p>초면에 사랑합니다</p>
												<div class="buttons dropdown icon small right">
													<div class="nav-dropdown-comment dropdown">
														<a class="button-comment-edit icon" href="#" onclick="deleteComment(15506468);return false"><svg class="small"><use xlink:href="#icon-write"></use></svg></a>
														<a class="button-comment-reply icon" href="#" onclick="commentComment(15506468); return false"><svg class="small"><use xlink:href="#icon-comment"></use></svg></a>
													</div>
													<button class="button-comment-more icon small on_off">
														<svg class="small"><use xlink:href="#icon-more"></use></svg>
														<svg class="small"><use xlink:href="#icon-close"></use></svg>
													</button>
													<div class="background-hover"></div>
												</div>
											</div>

											
										</li><li id="comment15512188" class="comment grid full content">
											<div class="comment grid full">
												<div class="info contents rp_general">
													<h5 class="name">의웅</h5>
													<div class="date">19. 7. 26. 11:30</div>
												</div>
												<p>와 미쳐따 진짜 ㅋㅋㅋㅋ</p>
												<div class="buttons dropdown icon small right">
													<div class="nav-dropdown-comment dropdown">
														<a class="button-comment-edit icon" href="#" onclick="deleteComment(15512188);return false"><svg class="small"><use xlink:href="#icon-write"></use></svg></a>
														<a class="button-comment-reply icon" href="#" onclick="commentComment(15512188); return false"><svg class="small"><use xlink:href="#icon-comment"></use></svg></a>
													</div>
													<button class="button-comment-more icon small on_off">
														<svg class="small"><use xlink:href="#icon-more"></use></svg>
														<svg class="small"><use xlink:href="#icon-close"></use></svg>
													</button>
													<div class="background-hover"></div>
												</div>
											</div>

											
										</li><li id="comment15514805" class="comment grid full content">
											<div class="comment grid full">
												<div class="info contents rp_general">
													<h5 class="name"><a href="https://btsfanart94.tistory.com" onclick="return openLinkInNewWindow(this)">RM_래몬</a><span class="tistoryProfileLayerTrigger" onclick="TistoryProfile.show(event, this, {&quot;title&quot;:&quot;NO CROSS NO CROWN&quot;,&quot;url&quot;:&quot;https:\/\/btsfanart94.tistory.com&quot;,&quot;nickname&quot;:&quot;RM_\ub798\ubaac &quot;,&quot;items&quot;:[]}); return false;"></span></h5>
													<div class="date">19. 7. 31. 13:26</div>
												</div>
												<p>정말정말 감사합니다..!!! ♡♡♡♡♡♡♡♡♡♡♡♡</p>
												<div class="buttons dropdown icon small right">
													<div class="nav-dropdown-comment dropdown">
														<a class="button-comment-edit icon" href="#" onclick="deleteComment(15514805);return false"><svg class="small"><use xlink:href="#icon-write"></use></svg></a>
														<a class="button-comment-reply icon" href="#" onclick="commentComment(15514805); return false"><svg class="small"><use xlink:href="#icon-comment"></use></svg></a>
													</div>
													<button class="button-comment-more icon small on_off">
														<svg class="small"><use xlink:href="#icon-more"></use></svg>
														<svg class="small"><use xlink:href="#icon-close"></use></svg>
													</button>
													<div class="background-hover"></div>
												</div>
											</div>

											
										</li>
									
										<li id="comment15516744" class="comment grid full content">
											<div class="comment grid full">
												<div class="info contents rp_general">
													<h5 class="name">jwp</h5>
													<div class="date">19. 8. 4. 13:08</div>
												</div>
												<p>폰트 다운받아가요! 감사합니다~</p>
												<div class="buttons dropdown icon small right">
													<div class="nav-dropdown-comment dropdown">
														<a class="button-comment-edit icon" href="#" onclick="deleteComment(15516744);return false"><svg class="small"><use xlink:href="#icon-write"></use></svg></a>
														<a class="button-comment-reply icon" href="#" onclick="commentComment(15516744); return false"><svg class="small"><use xlink:href="#icon-comment"></use></svg></a>
													</div>
													<button class="button-comment-more icon small on_off">
														<svg class="small"><use xlink:href="#icon-more"></use></svg>
														<svg class="small"><use xlink:href="#icon-close"></use></svg>
													</button>
													<div class="background-hover"></div>
												</div>
											</div>

											
										</li>
									
										<li id="comment15517416" class="comment grid full content">
											<div class="comment grid full">
												<div class="info contents rp_general">
													<h5 class="name">bulgogi</h5>
													<div class="date">19. 8. 5. 20:45</div>
												</div>
												<p>폰트 다ㅜㅇㄴ받아갑니다ㅜㅜ 감사해요ㅜㅜ<br>
</p>
												<div class="buttons dropdown icon small right">
													<div class="nav-dropdown-comment dropdown">
														<a class="button-comment-edit icon" href="#" onclick="deleteComment(15517416);return false"><svg class="small"><use xlink:href="#icon-write"></use></svg></a>
														<a class="button-comment-reply icon" href="#" onclick="commentComment(15517416); return false"><svg class="small"><use xlink:href="#icon-comment"></use></svg></a>
													</div>
													<button class="button-comment-more icon small on_off">
														<svg class="small"><use xlink:href="#icon-more"></use></svg>
														<svg class="small"><use xlink:href="#icon-close"></use></svg>
													</button>
													<div class="background-hover"></div>
												</div>
											</div>

											
										</li>
									
										<li id="comment15518464" class="comment grid full content">
											<div class="comment grid full">
												<div class="info contents rp_general">
													<h5 class="name">ㅋㅋㅋ</h5>
													<div class="date">19. 8. 7. 17:25</div>
												</div>
												<p>정겨운 폰트ㅋㅋㅋㅋ 잘쓸게요~</p>
												<div class="buttons dropdown icon small right">
													<div class="nav-dropdown-comment dropdown">
														<a class="button-comment-edit icon" href="#" onclick="deleteComment(15518464);return false"><svg class="small"><use xlink:href="#icon-write"></use></svg></a>
														<a class="button-comment-reply icon" href="#" onclick="commentComment(15518464); return false"><svg class="small"><use xlink:href="#icon-comment"></use></svg></a>
													</div>
													<button class="button-comment-more icon small on_off">
														<svg class="small"><use xlink:href="#icon-more"></use></svg>
														<svg class="small"><use xlink:href="#icon-close"></use></svg>
													</button>
													<div class="background-hover"></div>
												</div>
											</div>

											
										</li>
									
										<li id="comment15519595" class="comment grid full content">
											<div class="comment grid full">
												<div class="info contents rp_general">
													<h5 class="name">우와</h5>
													<div class="date">19. 8. 9. 19:18</div>
												</div>
												<p>이런 폰트 찾고있었는데 너무너무 감사합니다 ㅠㅠㅠ저작권까지 ㅠㅠ제작자님 복받으세요!!!</p>
												<div class="buttons dropdown icon small right">
													<div class="nav-dropdown-comment dropdown">
														<a class="button-comment-edit icon" href="#" onclick="deleteComment(15519595);return false"><svg class="small"><use xlink:href="#icon-write"></use></svg></a>
														<a class="button-comment-reply icon" href="#" onclick="commentComment(15519595); return false"><svg class="small"><use xlink:href="#icon-comment"></use></svg></a>
													</div>
													<button class="button-comment-more icon small on_off">
														<svg class="small"><use xlink:href="#icon-more"></use></svg>
														<svg class="small"><use xlink:href="#icon-close"></use></svg>
													</button>
													<div class="background-hover"></div>
												</div>
											</div>

											
										</li>
									
										<li id="comment15519864" class="comment grid full content">
											<div class="comment grid full">
												<div class="info contents rp_general">
													<h5 class="name">흑흑</h5>
													<div class="date">19. 8. 10. 14:47</div>
												</div>
												<p>감사합니다 사랑해요</p>
												<div class="buttons dropdown icon small right">
													<div class="nav-dropdown-comment dropdown">
														<a class="button-comment-edit icon" href="#" onclick="deleteComment(15519864);return false"><svg class="small"><use xlink:href="#icon-write"></use></svg></a>
														<a class="button-comment-reply icon" href="#" onclick="commentComment(15519864); return false"><svg class="small"><use xlink:href="#icon-comment"></use></svg></a>
													</div>
													<button class="button-comment-more icon small on_off">
														<svg class="small"><use xlink:href="#icon-more"></use></svg>
														<svg class="small"><use xlink:href="#icon-close"></use></svg>
													</button>
													<div class="background-hover"></div>
												</div>
											</div>

											
										</li>
									
										<li id="comment15522201" class="comment grid full content">
											<div class="comment grid full">
												<div class="info contents rp_general">
													<h5 class="name">짱</h5>
													<div class="date">19. 8. 15. 18:06</div>
												</div>
												<p>적게 일하고 많이 버세요!!!</p>
												<div class="buttons dropdown icon small right">
													<div class="nav-dropdown-comment dropdown">
														<a class="button-comment-edit icon" href="#" onclick="deleteComment(15522201);return false"><svg class="small"><use xlink:href="#icon-write"></use></svg></a>
														<a class="button-comment-reply icon" href="#" onclick="commentComment(15522201); return false"><svg class="small"><use xlink:href="#icon-comment"></use></svg></a>
													</div>
													<button class="button-comment-more icon small on_off">
														<svg class="small"><use xlink:href="#icon-more"></use></svg>
														<svg class="small"><use xlink:href="#icon-close"></use></svg>
													</button>
													<div class="background-hover"></div>
												</div>
											</div>

											
										</li>
									
										<li id="comment15522234" class="comment grid full content">
											<div class="comment grid full">
												<div class="info contents rp_general">
													<h5 class="name"><a href="https://flowerroadwithyou.tistory.com" onclick="return openLinkInNewWindow(this)">씨리얼 팩토리</a><span class="tistoryProfileLayerTrigger" onclick="TistoryProfile.show(event, this, {&quot;title&quot;:&quot;See-Real Factory&quot;,&quot;url&quot;:&quot;https:\/\/flowerroadwithyou.tistory.com&quot;,&quot;nickname&quot;:&quot;\uc528\ub9ac\uc5bc \ud329\ud1a0\ub9ac&quot;,&quot;items&quot;:[]}); return false;"></span></h5>
													<div class="date">19. 8. 15. 19:46</div>
												</div>
												<p>사이트까지 이렇게 되어 있어서 너무 웃겨요... 잘 받아갑니다 감사해요!!</p>
												<div class="buttons dropdown icon small right">
													<div class="nav-dropdown-comment dropdown">
														<a class="button-comment-edit icon" href="#" onclick="deleteComment(15522234);return false"><svg class="small"><use xlink:href="#icon-write"></use></svg></a>
														<a class="button-comment-reply icon" href="#" onclick="commentComment(15522234); return false"><svg class="small"><use xlink:href="#icon-comment"></use></svg></a>
													</div>
													<button class="button-comment-more icon small on_off">
														<svg class="small"><use xlink:href="#icon-more"></use></svg>
														<svg class="small"><use xlink:href="#icon-close"></use></svg>
													</button>
													<div class="background-hover"></div>
												</div>
											</div>

											
										</li>
									
										<li id="comment15522307" class="comment grid full content">
											<div class="comment grid full">
												<div class="info contents rp_general">
													<h5 class="name">새우</h5>
													<div class="date">19. 8. 15. 23:59</div>
												</div>
												<p>ㅋㅋㅋㅋ폰트도 센스있고 사이트도 너무 센스있어서 좋아요 ㅜㅜ!!</p>
												<div class="buttons dropdown icon small right">
													<div class="nav-dropdown-comment dropdown">
														<a class="button-comment-edit icon" href="#" onclick="deleteComment(15522307);return false"><svg class="small"><use xlink:href="#icon-write"></use></svg></a>
														<a class="button-comment-reply icon" href="#" onclick="commentComment(15522307); return false"><svg class="small"><use xlink:href="#icon-comment"></use></svg></a>
													</div>
													<button class="button-comment-more icon small on_off">
														<svg class="small"><use xlink:href="#icon-more"></use></svg>
														<svg class="small"><use xlink:href="#icon-close"></use></svg>
													</button>
													<div class="background-hover"></div>
												</div>
											</div>

											
										</li>
									
										<li id="comment15522802" class="comment grid full content">
											<div class="comment grid full">
												<div class="info contents rp_general">
													<h5 class="name">N</h5>
													<div class="date">19. 8. 17. 11:38</div>
												</div>
												<p>감사합니다 잘쓸께요ㅠㅠ</p>
												<div class="buttons dropdown icon small right">
													<div class="nav-dropdown-comment dropdown">
														<a class="button-comment-edit icon" href="#" onclick="deleteComment(15522802);return false"><svg class="small"><use xlink:href="#icon-write"></use></svg></a>
														<a class="button-comment-reply icon" href="#" onclick="commentComment(15522802); return false"><svg class="small"><use xlink:href="#icon-comment"></use></svg></a>
													</div>
													<button class="button-comment-more icon small on_off">
														<svg class="small"><use xlink:href="#icon-more"></use></svg>
														<svg class="small"><use xlink:href="#icon-close"></use></svg>
													</button>
													<div class="background-hover"></div>
												</div>
											</div>

											
										</li>
									
										<li id="comment15523482" class="comment grid full content">
											<div class="comment grid full">
												<div class="info contents rp_general">
													<h5 class="name">안녕?</h5>
													<div class="date">19. 8. 19. 11:34</div>
												</div>
												<p>너무 예뻐서 썼는데 걱정이 되어 여쭈어 봐요...유트브 상업적 용도로 기울기 굵기변형해서 가능한가요?</p>
												<div class="buttons dropdown icon small right">
													<div class="nav-dropdown-comment dropdown">
														<a class="button-comment-edit icon" href="#" onclick="deleteComment(15523482);return false"><svg class="small"><use xlink:href="#icon-write"></use></svg></a>
														<a class="button-comment-reply icon" href="#" onclick="commentComment(15523482); return false"><svg class="small"><use xlink:href="#icon-comment"></use></svg></a>
													</div>
													<button class="button-comment-more icon small on_off">
														<svg class="small"><use xlink:href="#icon-more"></use></svg>
														<svg class="small"><use xlink:href="#icon-close"></use></svg>
													</button>
													<div class="background-hover"></div>
												</div>
											</div>

											
												<ul class="comments">
													
														<li id="comment15523730" class="comment">
															<div class="comment">
																<div class="info contents rp_admin">
																	<h5 class="name"><a href="https://cactus.tistory.com" onclick="return openLinkInNewWindow(this)"> 길형진</a><span class="tistoryProfileLayerTrigger" onclick="TistoryProfile.show(event, this, {&quot;title&quot;:&quot;CACTUS&quot;,&quot;url&quot;:&quot;https:\/\/cactus.tistory.com&quot;,&quot;nickname&quot;:&quot;\uae38\ud615\uc9c4&quot;,&quot;items&quot;:[]}); return false;"></span></h5>
																	<div class="date">19. 8. 19. 23:27</div>
																</div>
																<p>원작자인 김중태 선생님의 뜻과 같이 상업적 이용은 물론 어떠한 목적으로 사용하셔도 괜찮습니다.</p>
																<div class="buttons dropdown icon small right">
																	<div class="nav-dropdown-comment dropdown">
																		<a class="button-comment-edit icon" href="#" onclick="deleteComment(15523730); return false;"><svg class="small"><use xlink:href="#icon-write"></use></svg></a>
																	</div>
																	<button class="button-comment-more icon small on_off">
																		<svg class="small"><use xlink:href="#icon-more"></use></svg>
																		<svg class="small"><use xlink:href="#icon-close"></use></svg>
																	</button>
																	<div class="background-hover"></div>
																</div>
															</div>
														</li>
													
												</ul>
											
										</li>
									
										<li id="comment15523805" class="comment grid full content">
											<div class="comment grid full">
												<div class="info contents rp_general">
													<h5 class="name">김한남</h5>
													<div class="date">19. 8. 20. 03:51</div>
												</div>
												<p>노무노무 이뻐용 오홍홍</p>
												<div class="buttons dropdown icon small right">
													<div class="nav-dropdown-comment dropdown">
														<a class="button-comment-edit icon" href="#" onclick="deleteComment(15523805);return false"><svg class="small"><use xlink:href="#icon-write"></use></svg></a>
														<a class="button-comment-reply icon" href="#" onclick="commentComment(15523805); return false"><svg class="small"><use xlink:href="#icon-comment"></use></svg></a>
													</div>
													<button class="button-comment-more icon small on_off">
														<svg class="small"><use xlink:href="#icon-more"></use></svg>
														<svg class="small"><use xlink:href="#icon-close"></use></svg>
													</button>
													<div class="background-hover"></div>
												</div>
											</div>

											
										</li>
									
										<li id="comment15524279" class="comment grid full content">
											<div class="comment grid full">
												<div class="info contents rp_general">
													<h5 class="name">재은</h5>
													<div class="date">19. 8. 20. 21:46</div>
												</div>
												<p>와 진짜로 엄청 찾았는데 ㅠㅠ 너무너무 감사합니다!!!!! </p>
												<div class="buttons dropdown icon small right">
													<div class="nav-dropdown-comment dropdown">
														<a class="button-comment-edit icon" href="#" onclick="deleteComment(15524279);return false"><svg class="small"><use xlink:href="#icon-write"></use></svg></a>
														<a class="button-comment-reply icon" href="#" onclick="commentComment(15524279); return false"><svg class="small"><use xlink:href="#icon-comment"></use></svg></a>
													</div>
													<button class="button-comment-more icon small on_off">
														<svg class="small"><use xlink:href="#icon-more"></use></svg>
														<svg class="small"><use xlink:href="#icon-close"></use></svg>
													</button>
													<div class="background-hover"></div>
												</div>
											</div>

											
										</li>
									
										<li id="comment15526402" class="comment grid full content">
											<div class="comment grid full">
												<div class="info contents rp_general">
													<h5 class="name">스뤀</h5>
													<div class="date">19. 8. 25. 05:44</div>
												</div>
												<p>폰트에 이어 페이지까지 감탄하고 가요ㅋㅋㅋㅋ 진짜 감사합니다!!!!!</p>
												<div class="buttons dropdown icon small right">
													<div class="nav-dropdown-comment dropdown">
														<a class="button-comment-edit icon" href="#" onclick="deleteComment(15526402);return false"><svg class="small"><use xlink:href="#icon-write"></use></svg></a>
														<a class="button-comment-reply icon" href="#" onclick="commentComment(15526402); return false"><svg class="small"><use xlink:href="#icon-comment"></use></svg></a>
													</div>
													<button class="button-comment-more icon small on_off">
														<svg class="small"><use xlink:href="#icon-more"></use></svg>
														<svg class="small"><use xlink:href="#icon-close"></use></svg>
													</button>
													<div class="background-hover"></div>
												</div>
											</div>

											
										</li>
									
										<li id="comment15526594" class="comment grid full content">
											<div class="comment grid full">
												<div class="info contents rp_general">
													<h5 class="name">새셥</h5>
													<div class="date">19. 8. 25. 19:33</div>
												</div>
												<p>어머나!!! 정말 고맙습니다. 잘 사용하겠습니다!<br>
지하철에서 흔히 보던 폰트가 이 폰트인줄은 몰랐어요!</p>
												<div class="buttons dropdown icon small right">
													<div class="nav-dropdown-comment dropdown">
														<a class="button-comment-edit icon" href="#" onclick="deleteComment(15526594);return false"><svg class="small"><use xlink:href="#icon-write"></use></svg></a>
														<a class="button-comment-reply icon" href="#" onclick="commentComment(15526594); return false"><svg class="small"><use xlink:href="#icon-comment"></use></svg></a>
													</div>
													<button class="button-comment-more icon small on_off">
														<svg class="small"><use xlink:href="#icon-more"></use></svg>
														<svg class="small"><use xlink:href="#icon-close"></use></svg>
													</button>
													<div class="background-hover"></div>
												</div>
											</div>

											
										</li>
									
										<li id="comment15526830" class="comment grid full content">
											<div class="comment grid full">
												<div class="info contents rp_general">
													<h5 class="name">진박사</h5>
													<div class="date">19. 8. 26. 10:26</div>
												</div>
												<p>와! ㅋㅋㅋㅋ 이거 유용하겠네요</p>
												<div class="buttons dropdown icon small right">
													<div class="nav-dropdown-comment dropdown">
														<a class="button-comment-edit icon" href="#" onclick="deleteComment(15526830);return false"><svg class="small"><use xlink:href="#icon-write"></use></svg></a>
														<a class="button-comment-reply icon" href="#" onclick="commentComment(15526830); return false"><svg class="small"><use xlink:href="#icon-comment"></use></svg></a>
													</div>
													<button class="button-comment-more icon small on_off">
														<svg class="small"><use xlink:href="#icon-more"></use></svg>
														<svg class="small"><use xlink:href="#icon-close"></use></svg>
													</button>
													<div class="background-hover"></div>
												</div>
											</div>

											
										</li>
									
										<li id="comment15530756" class="comment grid full content">
											<div class="comment grid full">
												<div class="info contents rp_general">
													<h5 class="name">왘ㅋㅋㅋ</h5>
													<div class="date">19. 9. 3. 13:17</div>
												</div>
												<p>댓글 쓰고 싶게 만들었네요ㅋㅋㅋㅋㅋ 좋은 폰트 너무 감사합니다!!</p>
												<div class="buttons dropdown icon small right">
													<div class="nav-dropdown-comment dropdown">
														<a class="button-comment-edit icon" href="#" onclick="deleteComment(15530756);return false"><svg class="small"><use xlink:href="#icon-write"></use></svg></a>
														<a class="button-comment-reply icon" href="#" onclick="commentComment(15530756); return false"><svg class="small"><use xlink:href="#icon-comment"></use></svg></a>
													</div>
													<button class="button-comment-more icon small on_off">
														<svg class="small"><use xlink:href="#icon-more"></use></svg>
														<svg class="small"><use xlink:href="#icon-close"></use></svg>
													</button>
													<div class="background-hover"></div>
												</div>
											</div>

											
										</li>
									
										<li id="comment15531129" class="comment grid full content">
											<div class="comment grid full">
												<div class="info contents rp_general">
													<h5 class="name">양</h5>
													<div class="date">19. 9. 4. 00:58</div>
												</div>
												<p>진짜 댓글 쓰고 싶게 만드는 사이트 ,, 폰트도 너무 귀여운데 사이트까지 완벽 ! 감사합니다 :)</p>
												<div class="buttons dropdown icon small right">
													<div class="nav-dropdown-comment dropdown">
														<a class="button-comment-edit icon" href="#" onclick="deleteComment(15531129);return false"><svg class="small"><use xlink:href="#icon-write"></use></svg></a>
														<a class="button-comment-reply icon" href="#" onclick="commentComment(15531129); return false"><svg class="small"><use xlink:href="#icon-comment"></use></svg></a>
													</div>
													<button class="button-comment-more icon small on_off">
														<svg class="small"><use xlink:href="#icon-more"></use></svg>
														<svg class="small"><use xlink:href="#icon-close"></use></svg>
													</button>
													<div class="background-hover"></div>
												</div>
											</div>

											
										</li>
									
										<li id="comment15531549" class="comment grid full content">
											<div class="comment grid full">
												<div class="info contents rp_general">
													<h5 class="name">심바</h5>
													<div class="date">19. 9. 4. 18:00</div>
												</div>
												<p>너무 감사합니다.. 하 블로그 취향 저격이네요</p>
												<div class="buttons dropdown icon small right">
													<div class="nav-dropdown-comment dropdown">
														<a class="button-comment-edit icon" href="#" onclick="deleteComment(15531549);return false"><svg class="small"><use xlink:href="#icon-write"></use></svg></a>
														<a class="button-comment-reply icon" href="#" onclick="commentComment(15531549); return false"><svg class="small"><use xlink:href="#icon-comment"></use></svg></a>
													</div>
													<button class="button-comment-more icon small on_off">
														<svg class="small"><use xlink:href="#icon-more"></use></svg>
														<svg class="small"><use xlink:href="#icon-close"></use></svg>
													</button>
													<div class="background-hover"></div>
												</div>
											</div>

											
										</li>
									
										<li id="comment15532137" class="comment grid full content">
											<div class="comment grid full">
												<div class="info contents rp_general">
													<h5 class="name">나무</h5>
													<div class="date">19. 9. 5. 15:01</div>
												</div>
												<p>정말 감사해요! 폰트 너무 귀엽고 멋져요!!!</p>
												<div class="buttons dropdown icon small right">
													<div class="nav-dropdown-comment dropdown">
														<a class="button-comment-edit icon" href="#" onclick="deleteComment(15532137);return false"><svg class="small"><use xlink:href="#icon-write"></use></svg></a>
														<a class="button-comment-reply icon" href="#" onclick="commentComment(15532137); return false"><svg class="small"><use xlink:href="#icon-comment"></use></svg></a>
													</div>
													<button class="button-comment-more icon small on_off">
														<svg class="small"><use xlink:href="#icon-more"></use></svg>
														<svg class="small"><use xlink:href="#icon-close"></use></svg>
													</button>
													<div class="background-hover"></div>
												</div>
											</div>

											
										</li>
									
								</ul>
							

						</div>
					</div><script type="text/javascript">loadedComments[193]=true;findFragmentAndHighlight(193)</script>

				</section>
	
	
	
	
	
	<script>
		$(document).ready(function() {
			$('#r_reply').summernote({
				height : 100,
				minHeight : 100,
				maxHeight : 100,
				focus : true,
				airmode : true,
				lang : 'ko-KR',
				toolbar : false
			});
		});

		function reply() {
			if ($("#r_reply").val() == "") {
				alertify.alert("내용을 입력해주세요");
				return;
			}
			;
			$
					.ajax({
						type : 'GET',
						url : 'Reply.do?b_seq=${vo.b_seq}',
						async : false,
						data : $("#replyform").serialize(),
						dataType : 'json',//동기 비동기 설정
						error : function() {
							alert("통신실패!!!!");
						},
						success : function(data) {
							var objRow = $("#reply_list").clone(); // 복사
							objRow
									.html('<td>'
											+ data['re_content']
											+ '</td><td>'
											+ data['re_seq']
											+ '</td><td><button type="button" onclick="re_create()">대댓달기</button></td>');
							$("#replytable").append(objRow);

						}
					});

		}
	</script>

	<script>
		function vsVote(button_id) {
			var vdata = {
				"button_id" : button_id
			};
			jQuery
					.ajax({
						type : "POST",
						url : "Vote.do?b_seq=${vo.b_seq}",
						data : vdata,
						async : false,
						success : function(data) {
							if (data == 0) {
								alertify.alert("투표 실패");
							} else {
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
</body>

</html>