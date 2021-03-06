<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.test.Builder.dto.User" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- bootstrap CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

<!-- web-font -->
<!-- Jua --> 
<link href="https://fonts.googleapis.com/css?family=Do+Hyeon|Gugi|Jua|Song+Myung|Sunflower:300" rel="stylesheet">

<!-- custom CSS -->
<link rel="stylesheet" href="css/font.css?ver=1">
<link rel="stylesheet" href="css/sidebar.css?ver=1">
<link rel="stylesheet" href="css/common.css?ver=1">
<link rel="stylesheet" href="css/look.css?ver=1">

<title>Insert title here</title>
</head>
<body>
<jsp:include page="/template/header.jsp" flush="false" >
	<jsp:param name="title" value="구경하기"/>
	<jsp:param name="bg" value="top_1.jpg"/>
</jsp:include>
<jsp:include page="/template/sidebar.jsp" flush="false" />

<article class="center col-8 text-center">
	<!--Search-->
	<h1 style="font-weight: bold; margin-top: 10px;">검색</h1>
	<form action="lookListSearch.do" method="post" class="d-flex col-12 form-inline p-2 my-2 my-lg-0"
		style="background: #f2f2f2;">
		<h6 class="col-2" style="font-weight: bold;">태그검색</h6>
		<div class="tag-search col-10">
			<a class="tooltips">
				<input class="col-8 form-control mr-sm-2" type="search" name="query"
					data-toggle="tooltip" data-placement="top" placeholder="태그를 입력하세요..."
					aria-label="Search" style="width: 780px;">
				<span> , 와 Spacebar 로<br>중복 검색 가능합니다.</span>
			</a>
			<button class="col-2 btn" type="submit" style="background-color: #333333; color: white;">Search</button>
		</div>
	</form>
	<!--Search-->
	<!--태그 예시 -->
	<div class="extag mt-2 p-2">
		<span class="exbadge">#봄</span> <span class="exbadge">#개나리</span> <span
			class="exbadge">#노란색</span> <span class="exbadge">#운동회</span> <span
			class="exbadge">#분홍색</span>
	</div>
	<div class="extag mt-2 p-1">
		<span class="exbadge">#졸업작품연주회</span> <span class="exbadge">#장미</span>
		<span class="exbadge">#빼빼로데이</span> <span class="exbadge">#생일파티</span>
	</div>
	<div class="extag m-1">
		<span class="exbadge">#빨간색</span> <span class="exbadge">#대학축제</span>
		<span class="exbadge">#어린이날</span> <span class="exbadge">#연말</span>
	</div>
	<!--행사종류-->
	<nav class="navbar navbar-light" style="background-color: #333333;">
		<nav>
			<div class="nav nav-tabs justify-content-center" id="nav-tab"
				role="tablist">
				<a class="nav-item nav-link active font-weight-bold"
					data-toggle="tab" id="tab-1" href="#content-1" role="tab"
					aria-controls="content-0" aria-selected="true">전체</a>
				<a class="nav-item nav-link font-weight-bold"
					data-toggle="tab" href="#content-2" role="tab" id="tab-2"
					aria-controls="nav-tab-2" aria-selected="true">모임</a>
				<a class="nav-item nav-link font-weight-bold" id="tab-3"
					data-toggle="tab" href="#content-3" role="tab"
					aria-controls="nav-tab-3" aria-selected="false">발표회</a>
				<a class="nav-item nav-link font-weight-bold" id="tab-4"
					data-toggle="tab" href="#content-4" role="tab"
					aria-controls="nav-tab-4" aria-selected="false">종교 행사</a>
			</div>
		</nav>
		<div class="text-right">
			<% if(session.getAttribute("user") != null) { %>
				<a href="lookWriting.do"><button type="button" class="btn" style="background: #3244ca; color: white;">글 올리기</button></a>
			<% } %>	 
		</div>
	</nav>
	<!--***필수(모임/발표회/종교행사)***-->
	<div class="tab-content" id="nav-tabContent">
		<!--전체-->
		<div class="tab-pane fade show active" id="content-1" role="tabpanel" aria-labelledby="tab-1">
			<div class="col-12 text-right my-2">
				<div class="btn-group p-1" role="group">
					<button type="button" class="btn btn-light d-flex"
						style="box-shadow: 1px 1px 0.1px 0.01px gray;">
						<img src="./img/info/look/like_2.png" width="18" height="18" />
						<div class="px-1" style="margin-top: -3px;">인기순</div>
					</button>
					<button type="button" class="btn btn-light d-flex"
						style="box-shadow: 1px 1px 0.1px 0.01px gray;">
						<img src="./img/info/look/wall-clock.png" width="18"
							height="18" />
						<div class="px-1" style="margin-top: -3px;">최신순</div>
					</button>
				</div>
			</div>
			<!--첫째줄-->
			<div class="col mt-4 mx-0 row">
			<!--ex_1-->
			<c:if test="${select != -1}">
			<c:forEach var="look" items="${looks}">
				<div class="ex1 col-md-4" style="height: 320px;">
					<div class="container px-0"
						style="border: 1px solid #dcd9d9; border-radius: 5% 5% 5% 5%;">
						<img class="card-img-top" style="width:280px; height:300px;" src="
							<c:if test="${look.lookImg != ''}">https://s3.ap-northeast-2.amazonaws.com/invitecontent/edit/topImgFile/${look.lookImg}</c:if>
			                <c:if test="${look.lookImg == ''}">https://via.placeholder.com/150x150</c:if>
						">
						<div class="check-mark" data-toggle="modal" data-target="#look-modal-${look.lookId}"
							data-src="holder.js/100px225?theme=thumb&amp;bg=55595c&amp;fg=eceeef&amp;text=Thumbnail" style="padding:50% 30%;">
							<img src="./img/info/look/check-mark_2.png" width="45" height="45"/>
						</div>
						<div class="overlay ico_invite invite_view">
							<div class="pt-2">
								<div class="invite-name col-12 mt-4" style="font-size:20px;">${look.lookTitle}</div>
								<!--하트 수/댓글 수/조회 수-->
								<div class="invite-name col-12 d-flex pt-3" role="group" style="font-size:13px;">
									<div class="like-number p-1"><!--하트수-->
										<img src="./img/info/look/like.png" width="15"
											height="15" /><span class="m-1">${look.lookHeart}</span>
									</div>
									<div class="comment-number p-1"><!--댓글수-->
										<img src="./img/info/look/comment.png" width="15"
											height="15" /><span class="m-1">0</span>
									</div>
									<div class="hits-number p-1" role="group">
										<div>조회수<span class="">${look.lookHit}<span></div>
									</div>
								</div>
								<!--하트 수/댓글 수/조회 수_end-->
							</div>
						</div>
						<!--click-->
						<div class="modal modal-center" id="look-modal-${look.lookId}" tabindex="-1"
									role="dialog" aria-labelledby="myModalLabel">
							<div class="modal-dialog modal-center modal-fullsize modal-lg"
										role="document" style="height:100vh;">
								<div class="modal-content modal-fullsize" style="height:100%;">
									<div class="modal-header" style="background: #333333;">
										<button type="button" class="close" data-dismiss="modal"
											aria-label="Close">
											<span style="color: white;" aria-hidden="true">&times;</span>
										</button>
										<h4 class="modal-title" id="myModalLabel"></h4>
									</div>
									<div class="modal-body d-flex">
										<div class="col-6 p-0" style="border: 1px solid #dcd9d9;">
											<div style="width: 100%; height: 100%; overflow-y: scroll;">
												<iframe src="http://localhost:8080/ex0417Builder/${look.lookUrlName}.page" width="100%" height="100%" frameborder="0" scroll="auto" id="preview_iframe"></iframe>
											</div>
										</div>
										<div class="col-6 p-0" style="border: 1px solid #dcd9d9;">
											<div style="width: 100%; height: 100%;">
												<div class="d-flex pt-1" style="height:10%;">
													<div class="col-2 pl-3 pt-1">
														<div class="profile" style="margin-top: 2px;"></div>
													</div>
													<div class="col-10 mt-2">
														<div class="mainname">${look.lookTitle}</div>
														<div class="sidename">${look.userName}</div>
														<div class="sidename d-flex justify-content-end">
															 <div class="mx-1">
																	조회수&nbsp;<span>${look.lookHit}</span>
																</div>
																<div class="mx-1">
																	등록&nbsp;<span>${look.lookRegTime}</span>
																</div>
														</div>
													</div>
												</div>
												<hr>
												<div class="pl-2" style="height: 25%;">
													<span class="popup-badge badge">${look.lookHashTag}</span>
													<div>${look.lookTitle}</div>
												</div>
												
												<HR>
												 <!--하트-->
												 <div class="d-flex px-2 mb-3" style="height: 3%;">
															<fieldset class="likeCheck pr-2">
																	<input type="checkbox" name="frontend" value="likeCheck" id="likeCheck">
																		    <label class="m-0" for="likeCheck"></label><span>${look.lookHit}</span>
															</fieldset>
															<fieldset class="likeCheck">
																	<input type="checkbox" name="frontend" value="commentCheck" id="commentCheck">
																	<label class="m-0" for="commentCheck"></label><span>${look.lookHeart}</span>
															</fieldset>
													</div>
												<!--댓글폼-->
												 <div class="d-flex comment-box" style="background: #F2F2F2; height:15%;">
														<div class="col-2 pl-2 pt-2 mt-1">
																<div class="profile" style="margin-top: 2px;">
																</div>
															</div>
													<div class="col-10 mt-3 px-1">
																
																	<% if(session.getAttribute("user") == null) { %>
	 																<div class="d-flex">
	 																	<input readonly type="text" name="look-cmt-comment" id="look-cmt-comment-${look.lookId}" class="mr-1"
	  																		style="width: 270px; border-radius: 5px; background: #d6d6d6;"
	  																		placeholder="로그인 후, 댓글 작성이 가능합니다.">
	  																	<button disabled type="button" onclick="commentInsert(${look.lookId})" class="btn btn-sm btn-danger">등 록</button>
	  																</div>
	 																	<p style="font-size:12px;">댓글을 게시하려면 로그인을 해주세요.</p>
																	<% }else { %>
	 																<div class="d-flex">
	 																	<input type="text" name="look-cmt-comment" id="look-cmt-comment-${look.lookId}" class="mr-1" 
	 																		style="width: 270px; border-radius: 5px;"
	  																		placeholder="댓글을 작성하세요.">
	  																	<button type="button" onclick="commentInsert(${look.lookId})" class="btn btn-sm btn-danger">등 록</button>
	  																</div>
	  																<p style="font-size:12px;">댓글을 게시하려면 등록 버튼을 눌러주세요.</p>
																	<% } %>
													</div>
												  </div>
												<!--댓글리스트-->
												<div style="height: 34%; border: 1px solid #b0afaf; overflow:scroll;">
													 <!--*댓글이 없을 때-->
													 <!--
													 <div class="m-5 text-center">
													   <img class="" src="./img/info/look/none_comment.png" style="width:200px; height:120px;">
													 </div>
													 -->
													 <!--*댓글이 있을 때-->
													 <div class="px-2" style="color:#727272;">
													    이전 댓글 보기
													 </div>
													 <div id="look-${look.lookId}" class="p-2 look-comment-wrap" style="border: 1px solid #b0afaf;">
													 </div>
													 <!--댓글_end-->
												 </div>
											</div>
										</div>
									</div>
									<div class="modal-footer" style="background: #333333;">
										<button type="button" class="btn btn-default"
											data-dismiss="modal">Close</button>
									</div>
								</div>
							</div>
						</div>
						<!--click_end-->
					</div>
					
					<div class="tag d-flex" style="border: 1px solid #dcd9d9; height: 18%; background:rgba(52,52,52,0.8); border-radius: 0% 0% 10px 10px; position: absolute; top: 76%; left: 5%; right: 5%;">
						<div class="col-12 px-0">
							<span class="badge">${look.lookHashTag}</span>
						</div>
					</div>
				</div>
			</c:forEach>
			</c:if>
			</div>
			<!--첫째줄_end-->
		</div>
		<!--모임-->
		<div class="tab-pane fade" id="content-2" role="tabpanel" aria-labelledby="tab-2">
			<div class="col-12 text-right my-2">
				<div class="btn-group p-1" role="group">
					<button type="button" class="btn btn-light d-flex"
						style="box-shadow: 1px 1px 0.1px 0.01px gray;">
						<img src="./img/info/look/like_2.png" width="18" height="18" />
						<div class="px-1" style="margin-top: -3px;">인기순</div>
					</button>
					<button type="button" class="btn btn-light d-flex"
						style="box-shadow: 1px 1px 0.1px 0.01px gray;">
						<img src="./img/info/look/wall-clock.png" width="18"
							height="18" />
						<div class="px-1" style="margin-top: -3px;">최신순</div>
					</button>
				</div>
			</div>
			<!--첫째줄-->
			<div class="col mt-4 mx-0 row">
			<!--ex_1-->
			<c:if test="${select != -1}">
			<c:forEach var="look" items="${looksType1}">
				<div class="ex1 col-md-4" style="height: 320px;">
					<div class="container px-0"
						style="border: 1px solid #dcd9d9; border-radius: 5% 5% 5% 5%;">
						<img class="card-img-top" style="width:280px; height:300px;" src="
							<c:if test="${look.lookImg != ''}">https://s3.ap-northeast-2.amazonaws.com/invitecontent/edit/topImgFile/${look.lookImg}</c:if>
			                <c:if test="${look.lookImg == ''}">https://via.placeholder.com/150x150</c:if>
						">
						<div class="check-mark" data-toggle="modal" data-target="#look-modal-${look.lookId}"
							data-src="holder.js/100px225?theme=thumb&amp;bg=55595c&amp;fg=eceeef&amp;text=Thumbnail" style="padding:50% 30%;">
							<img src="./img/info/look/check-mark_2.png" width="45" height="45"/>
						</div>
						<div class="overlay ico_invite invite_view">
							<div class="pt-2">
								<div class="invite-name col-12 mt-4" style="font-size:20px;">${look.lookTitle}</div>
								<!--하트 수/댓글 수/조회 수-->
								<div class="invite-name col-12 d-flex pt-3" role="group" style="font-size:13px;">
									<div class="like-number p-1"><!--하트수-->
										<img src="./img/info/look/like.png" width="15"
											height="15" /><span class="m-1">${look.lookHeart}</span>
									</div>
									<div class="comment-number p-1"><!--댓글수-->
										<img src="./img/info/look/comment.png" width="15"
											height="15" /><span class="m-1">0</span>
									</div>
									<div class="hits-number p-1" role="group">
										<div>조회수<span class="">${look.lookHit}<span></div>
									</div>
								</div>
								<!--하트 수/댓글 수/조회 수_end-->
							</div>
						</div>
						<!--click-->
						
						<!--click_end-->
					</div>
					
					<div class="tag d-flex" style="border: 1px solid #dcd9d9; height: 18%; background:rgba(52,52,52,0.8); border-radius: 0% 0% 10px 10px; position: absolute; top: 76%; left: 5%; right: 5%;">
						<div class="col-12 px-0">
							<span class="badge">${look.lookHashTag}</span>
						</div>
					</div>
				</div>
			</c:forEach>
			</c:if>
			</div>
			<!--첫째줄_end-->
		</div>
		<!--발표회-->
		<!--모임-->
		<div class="tab-pane fade" id="content-3" role="tabpanel" aria-labelledby="tab-3">
			<div class="col-12 text-right my-2">
				<div class="btn-group p-1" role="group">
					<button type="button" class="btn btn-light d-flex"
						style="box-shadow: 1px 1px 0.1px 0.01px gray;">
						<img src="./img/info/look/like_2.png" width="18" height="18" />
						<div class="px-1" style="margin-top: -3px;">인기순</div>
					</button>
					<button type="button" class="btn btn-light d-flex"
						style="box-shadow: 1px 1px 0.1px 0.01px gray;">
						<img src="./img/info/look/wall-clock.png" width="18"
							height="18" />
						<div class="px-1" style="margin-top: -3px;">최신순</div>
					</button>
				</div>
			</div>
			<!--첫째줄-->
			<div class="col mt-4 mx-0 row">
			<!--ex_1-->
			<c:if test="${select != -1}">
			<c:forEach var="look" items="${looksType2}">
				<div class="ex1 col-md-4" style="height: 320px;">
					<div class="container px-0"
						style="border: 1px solid #dcd9d9; border-radius: 5% 5% 5% 5%;">
						<img class="card-img-top" style="width:280px; height:300px;" src="
							<c:if test="${look.lookImg != ''}">https://s3.ap-northeast-2.amazonaws.com/invitecontent/edit/topImgFile/${look.lookImg}</c:if>
			                <c:if test="${look.lookImg == ''}">https://via.placeholder.com/150x150</c:if>
						">
						<div class="check-mark" data-toggle="modal" data-target="#look-modal-${look.lookId}"
							data-src="holder.js/100px225?theme=thumb&amp;bg=55595c&amp;fg=eceeef&amp;text=Thumbnail" style="padding:50% 30%;">
							<img src="./img/info/look/check-mark_2.png" width="45" height="45"/>
						</div>
						<div class="overlay ico_invite invite_view">
							<div class="pt-2">
								<div class="invite-name col-12 mt-4" style="font-size:20px;">${look.lookTitle}</div>
								<!--하트 수/댓글 수/조회 수-->
								<div class="invite-name col-12 d-flex pt-3" role="group" style="font-size:13px;">
									<div class="like-number p-1"><!--하트수-->
										<img src="./img/info/look/like.png" width="15"
											height="15" /><span class="m-1">${look.lookHeart}</span>
									</div>
									<div class="comment-number p-1"><!--댓글수-->
										<img src="./img/info/look/comment.png" width="15"
											height="15" /><span class="m-1">0</span>
									</div>
									<div class="hits-number p-1" role="group">
										<div>조회수<span class="">${look.lookHit}<span></div>
									</div>
								</div>
								<!--하트 수/댓글 수/조회 수_end-->
							</div>
						</div>
						<!--click-->
						
						<!--click_end-->
					</div>
					
					<div class="tag d-flex" style="border: 1px solid #dcd9d9; height: 18%; background:rgba(52,52,52,0.8); border-radius: 0% 0% 10px 10px; position: absolute; top: 76%; left: 5%; right: 5%;">
						<div class="col-12 px-0">
							<span class="badge">${look.lookHashTag}</span>
						</div>
					</div>
				</div>
			</c:forEach>
			</c:if>
			</div>
			<!--첫째줄_end-->
		</div>		
		<!--종교행사-->
		<div class="tab-pane fade" id="content-4" role="tabpanel" aria-labelledby="tab-3">
			<div class="col-12 text-right my-2">
				<div class="btn-group p-1" role="group">
					<button type="button" class="btn btn-light d-flex"
						style="box-shadow: 1px 1px 0.1px 0.01px gray;">
						<img src="./img/info/look/like_2.png" width="18" height="18" />
						<div class="px-1" style="margin-top: -3px;">인기순</div>
					</button>
					<button type="button" class="btn btn-light d-flex"
						style="box-shadow: 1px 1px 0.1px 0.01px gray;">
						<img src="./img/info/look/wall-clock.png" width="18"
							height="18" />
						<div class="px-1" style="margin-top: -3px;">최신순</div>
					</button>
				</div>
			</div>
			<!--첫째줄-->
			<div class="col mt-4 mx-0 row">
			<!--ex_1-->
			<c:if test="${select != -1}">
			<c:forEach var="look" items="${looksType3}">
				<div class="ex1 col-md-4" style="height: 320px;">
					<div class="container px-0"
						style="border: 1px solid #dcd9d9; border-radius: 5% 5% 5% 5%;">
						<img class="card-img-top" style="width:280px; height:300px;" src="
							<c:if test="${look.lookImg != ''}">https://s3.ap-northeast-2.amazonaws.com/invitecontent/edit/topImgFile/${look.lookImg}</c:if>
			                <c:if test="${look.lookImg == ''}">https://via.placeholder.com/150x150</c:if>
						">
						<div class="check-mark" data-toggle="modal" data-target="#look-modal-${look.lookId}"
							data-src="holder.js/100px225?theme=thumb&amp;bg=55595c&amp;fg=eceeef&amp;text=Thumbnail" style="padding:50% 30%;">
							<img src="./img/info/look/check-mark_2.png" width="45" height="45"/>
						</div>
						<div class="overlay ico_invite invite_view">
							<div class="pt-2">
								<div class="invite-name col-12 mt-4" style="font-size:20px;">${look.lookTitle}</div>
								<!--하트 수/댓글 수/조회 수-->
								<div class="invite-name col-12 d-flex pt-3" role="group" style="font-size:13px;">
									<div class="like-number p-1"><!--하트수-->
										<img src="./img/info/look/like.png" width="15"
											height="15" /><span class="m-1">${look.lookHeart}</span>
									</div>
									<div class="comment-number p-1"><!--댓글수-->
										<img src="./img/info/look/comment.png" width="15"
											height="15" /><span class="m-1">0</span>
									</div>
									<div class="hits-number p-1" role="group">
										<div>조회수<span class="">${look.lookHit}<span></div>
									</div>
								</div>
								<!--하트 수/댓글 수/조회 수_end-->
							</div>
						</div>
					</div>
					
					<div class="tag d-flex" style="border: 1px solid #dcd9d9; height: 18%; background:rgba(52,52,52,0.8); border-radius: 0% 0% 10px 10px; position: absolute; top: 76%; left: 5%; right: 5%;">
						<div class="col-12 px-0">
							<span class="badge">${look.lookHashTag}</span>
						</div>
					</div>
				</div>
			</c:forEach>
			</c:if>
			</div>
			<!--첫째줄_end-->
		</div>				
	</div>
</article>






<jsp:include page="/template/footer.jsp" flush="false" />

<!-- bootstrap javascript -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<!-- top js -->
<script type="text/javascript" src="js/top.js?v=<%=System.currentTimeMillis()%>"></script>
<!-- side bar js -->
<script type="text/javascript" src="js/sidebar.js?v=<%=System.currentTimeMillis()%>"></script>
<!-- custom js -->
<script type="text/javascript" src="js/look.js?v=<%=System.currentTimeMillis()%>"></script>
</body>
</html>