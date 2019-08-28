<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


<link rel="stylesheet" type="text/css"
	href="resources/css/test/login.css" />
<link rel="stylesheet" type="text/css"
	href="resources/css/test/login_g.css" />



</head>
<body>

	<div class="col-xs-4">
		<form action="">
			<ul class="vss-a-menu">
				<li><a href="Board.do"> 게시판 </a></li>
				<li><a href="UserAllData.do">유저정보 전부보기</a></li>
				<li><a href="SignUp.do">회원가입</a></li>
				<li><a href="Login.do">로그인</a></li>
				<li><a href="">메인</a></li>
			</ul>
		</form>


	</div>
	<div id="userLayer" style="display: none;">
		<span class="ico_tail"></span>
		<div id="logOffArea"
			class="xans-element- xans-layout xans-layout-statelogoff ">
			<strong class="title">로그인</strong>

			<form id="member_form_8951661846" name=""
				action="/exec/front/Member/login/" method="post" target="_self"
				enctype="multipart/form-data">

				<div class="xans-element- xans-member xans-member-login loginset ">
					<!--$form.member_id-->
					<!--$form.member_passwd-->
					<span class="wrap-input100 validate-input"> <input
						style="border: none;" class="input100" id="member_id"
						name="member_id" fw-filter="isFill" fw-label="아이디" fw-msg=""
						value="" type="text" placeholder=""> <span
						class="focus-input100"></span><span class="label-input100">ID</span></span>
					<span class="wrap-input100 validate-input"><input
						style="border: none;" class="input100" id="member_passwd"
						name="member_passwd" fw-filter="isFill&amp;isMin[4]&amp;isMax[16]"
						fw-label="패스워드" fw-msg="" value="" type="password" placeholder=""><span
						class="focus-input100"></span><span class="label-input100">Password</span></span>
					<div class="find_account">
						<a class="btn_find_id" href="/member/id/find_id.html">아이디찾기</a> |
						<a class="btn_find_pw" href="/member/passwd/find_passwd_info.html">패스워드찾기</a>
						| <a class="btn_find_id" href="/myshop/order/list.html">주문조회</a>
					</div>


					<button type="button"
						onclick="MemberAction.login('member_form_8951661846'); return false;"
						class="login100-form-btn">로그인하기</button>
				</div>
			</form>
			<ul>
				<li class="bg_gray _inter_goods_ _pad_top"><a
					href="/product/recent_view_product.html">최근 본 제품</a></li>
				<li class="bg_gray _helpdesk_ _pad_btm"><a href="/help.html">고객지원센터</a></li>
			</ul>
			<div class="register_area">
				<div class="inn">
					<p>아직 지모 회원이 아니세요?</p>
					<a class="btn_register" href="/member/join.html">회원가입하기</a>
				</div>
			</div>
		</div>

		<script src="/js/select2.min.js" type="text/javascript"></script>
		<script src="/js/login.js" type="text/javascript"></script>

	</div>

</body>
</html>