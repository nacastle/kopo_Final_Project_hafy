<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

   
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="/WEB-INF/jsp/include/lib/topLibs.jsp"></jsp:include>
<title>하피 - 모두를 위한 경매</title>

    <link href="${pageContext.request.contextPath }/resources/bootstrap-4.0.0/docs/4.0/examples/navbar-fixed/navbar-top-fixed.css" rel="stylesheet">
<<<<<<< HEAD
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/wow/css/libs/animate.css">
=======
>>>>>>> 043d81d1783ccd2630b6ac8affdedf057002e7ca
<style type="text/css">
a {
	text-decoration: none !important;
}

body {
	min-height: 0;
 	padding-top: 3rem; 
 	padding-bottom: 4rem; 
	
}

.na-nav {
	position: fixed;
	left: 0;
	top: 2.7rem;
	width: 100%;
	background: #fff;
	box-shadow: 0 0 5px rgba(0, 0, 0, .5);
}

.na-nav div {
	position: relative;
	display: flex;
	width: 100%;
	margin: 0 auto;
}

.na-nav div a {
	flex: 1;
	display: block;
	height: 40px;
	line-height: 40px;
	text-align: center;
	color: #8f8f8f;
	font-weight: bold;
}

.na-nav div a.top-on {
	color: #000;
}

.na-nav div>span {
	position: absolute;
	left: 0;
	bottom: 0;
	width: 50%;
	height: 3px;
	background: #27b2a5;
	opacity: 0;
	transition: all .5s;
}

.na-nav div a:nth-child(1).top-on ~ span {
	left: 0;
	opacity: 1;
}

.na-nav div a:nth-child(2).top-on ~ span {
	left: 50%;
	opacity: 1;
}

.na-nav2 {
	height: 3rem;

}

.na-nav2 a {
	font-size: 0.7rem;
	width: 25%;
	color: black;
	text-align: center;
	padding: .3rem !important;
/* 	height: 3rem; */
}

.na-nav2 a.bottom-on {
	color: white;
}

 
 
 .na-content {
 margin: 0rem 1rem;
/*  text-align: center; */
position: relative;
    margin-top: 0.4rem;
 }
 
 table {
 	margin-top: 0.7rem;
 	font-size: 0.9rem;
 	width: 100%;
/*  	border: 1 solid rgb(158, 158, 158); */
	border-collapse: unset;
 
 }
 
 
 table th {
	width: 35%;
	height: 1.8rem;
/* 	padding-left: 3%; */
	text-align: center;
	vertical-align: middle;
 	padding: 0.1rem;
/*  	border: 0; */
	background: rgb(22, 160, 133);
	color: white;
}
 table td {
	width: 73%;
	height: 1.8rem;
/* 	padding-left: 3%; */
	text-align: left;
	vertical-align: middle;
 	padding: 0.1rem;
 	padding-left: 0.5rem;
/*  	border: 0; */
	background: rgb(224, 224, 224);
}

/* 
table th img {
	max-width: 100%;
	max-height: 100%;
} */

  hr { width: 100%; margin: 0.5rem 0;   }   
 
 label { margin: 0; }

.btn-like {
	padding:0; border: 0; margin-right: 3%; 
}

.btn-dislike {
	padding:0; border: 0; margin-right: 3%; 
}

.bootstrap-select:not([class*=col-]):not([class*=form-control]):not(.input-group-btn) {
    width: 12rem;
}

</style>

</head>
  <body style="    padding-bottom: 0rem;">
  
   <nav class="navbar fixed-top" style="height:3rem; background:white; color:black; padding: .5rem 1rem;border-bottom: 0.1rem solid rgb(224, 224, 224)">
   		<div style="float: left;">
<%--     	  <a href="${pageContext.request.contextPath}/goodsDetail/${aucGoodsVO.no}" style="color: black; margin-right: -3rem;"><i class="fa fa-arrow-left fa-lg" aria-hidden="true"></i></a> --%>
    	  <a href="javascript:history.go(-1)" style="color: black; margin-right: -3rem;"><i class="fa fa-arrow-left fa-lg" aria-hidden="true"></i></a>
    	  <span style="font-size: 1.25rem; position:relative; top:0.2rem; left: 4rem; font-weight: bold; color:black;">입찰하기</span>
  	 	</div>

		<div class="col-4 d-flex justify-content-end align-items-right"
			style="margin-top: 0.5rem; margin-right: -1rem;">
			<%-- 				<a class="p-2 bottom-on" href="${pageContext.request.contextPath}/hot"><div><i class="fa fa-home fa-lg"></i></div> 홈</a>  --%>
			<a href="${pageContext.request.contextPath}/hot"
				style="float: right; color: black;"><i class="fa fa-home fa-lg"
				aria-hidden="true"></i></a>
			<!--       			&nbsp;&nbsp;&nbsp; -->
			<!--       			<a href="#" style="float: right; color:black;" ><i class="fa fa-bell-o fa-lg" aria-hidden="true"></i></a> -->
		</div>


	</nav>
  
              <div class="na-content">
              	입찰 상품
              	<form action="${pageContext.request.contextPath}/bidConfirm/${aucGoodsVO.no}" 
              	name ="bForm" method="post" onsubmit="return checkBidMoney(${aucGoodsVO.winningBid},${aucGoodsVO.startPrice})">
              	<table>
              		<tr>
              			<th>경매번호</th>
<<<<<<< HEAD
						<td >${aucGoodsVO.no }</td>
=======
						<td>${aucGoodsVO.no }</td>
>>>>>>> 043d81d1783ccd2630b6ac8affdedf057002e7ca
					</tr>
              		<tr>
              			<th>상품명</th>
						<td> ${aucGoodsVO.name }</td>
					</tr>	              		
              		<tr>
              			<th>경매 마감일자</th>
						<td> ${aucGoodsVO.endDate }
						</td>
					</tr>	              		
              		<tr>
              			<th>시작가 </th>
						<td> <fmt:formatNumber value="${aucGoodsVO.startPrice}" pattern="#,###"/> 원&nbsp;
						</td>
					</tr>	              		
              		<tr>
              			<th> 입찰방식	</th>
						<td>${aucGoodsVO.method }</td>
					</tr>	              		
              			              		
              	</table>
              	<br>
              	
              	입찰하기
		<table>
<<<<<<< HEAD
			<tr id="highestBidTag">
				<th>현 최고입찰가</th>
				<td style="font-weight: bold;">
					<span id="highestBid" style="display: none ;"><fmt:formatNumber value="${aucGoodsVO.winningBid}" pattern="#,###"/> 원</span>
					<i id="noBidMsg" style="display: none;">아직 입찰된 내역이 없습니다.</i>
<%-- 					<c:choose> --%>
<%-- 						<c:when test="${aucGoodsVO.winningBid != 0 }"> --%>
<%-- 							<span id="highestBid"><fmt:formatNumber value="${aucGoodsVO.winningBid}" pattern="#,###"/></span> 원 --%>
<%-- 						</c:when> --%>
<%-- 						<c:otherwise> --%>
<!-- 							<i>아직 입찰된 내역이 없습니다.</i> -->
<%-- 						</c:otherwise> --%>
<%-- 					</c:choose> --%>
=======
			<tr>
				<th>현 최고입찰가</th>
				<td style="font-weight: bold;">
					<c:choose>
						<c:when test="${aucGoodsVO.winningBid != 0 }">
							<fmt:formatNumber value="${aucGoodsVO.winningBid}" pattern="#,###"/> 원
						</c:when>
						<c:otherwise>
							<i>아직 입찰된 내역이 없습니다.</i>
						</c:otherwise>
					</c:choose>
>>>>>>> 043d81d1783ccd2630b6ac8affdedf057002e7ca
				</td>
			</tr>
			
			<tr>
				<th>입찰금액</th>
				<td style="padding: 0.6rem">
				
				<c:choose>	
					<c:when test="${pastBidMoney != 0 }">			
				현재까지 입찰하신 금액은<br>
				<strong><fmt:formatNumber value="${pastBidMoney}" pattern="#,###"/></strong> 원 입니다.
					</c:when>
					<c:otherwise>
<<<<<<< HEAD
						<span id="noBidMsg2" style="display: none;">현재 시작가인 <strong><fmt:formatNumber value="${aucGoodsVO.startPrice}" pattern="#,###"/></strong> 원부터 <br>	입찰하실 수 있습니다.</span>
						<div id="bidMsg" style="display: none;"><strong id="bidCons"><fmt:formatNumber value="${aucGoodsVO.winningBid}" pattern="#,###"/> 원</strong>을 초과하는 금액부터 <br>입찰이 가능합니다.</div>
<%-- 						<c:choose> --%>
<%-- 							<c:when test="${aucGoodsVO.winningBid == 0}"> --%>
<%-- 								현재 시작가인 <strong><fmt:formatNumber value="${aucGoodsVO.startPrice}" pattern="#,###"/></strong> 원부터 <br>	입찰하실 수 있습니다. --%>
<%-- 							</c:when> --%>
<%-- 							<c:otherwise> --%>
<%-- 								<span id="bidMsg"><strong><fmt:formatNumber value="${aucGoodsVO.winningBid}" pattern="#,###"/></strong></span> 원을 초과하는 금액부터 <br>입찰이 가능합니다. --%>
<%-- 							</c:otherwise> --%>
<%-- 						</c:choose> --%>
=======
						<c:choose>
							<c:when test="${aucGoodsVO.winningBid == 0}">
								현재 시작가인 <strong><fmt:formatNumber value="${aucGoodsVO.startPrice}" pattern="#,###"/></strong> 원부터 <br>	입찰하실 수 있습니다.
							</c:when>
							<c:otherwise>
								<strong><fmt:formatNumber value="${aucGoodsVO.winningBid}" pattern="#,###"/></strong> 원을 초과하는 금액부터 <br>입찰이 가능합니다.
							</c:otherwise>
						</c:choose>
>>>>>>> 043d81d1783ccd2630b6ac8affdedf057002e7ca
					</c:otherwise>
				</c:choose>
					
						<div class="input-group" style="padding-top: 0.6rem;">
							<!-- 				<span class="input-group-addon">\</span>  -->
<<<<<<< HEAD
							<input type="number" id="bidMoney" name="bidMoney" class="form-control" style="width: 80%; "
=======
							<input type="number" name="bidMoney" class="form-control" style="width: 80%; "
>>>>>>> 043d81d1783ccd2630b6ac8affdedf057002e7ca
								placeholder="입찰가" onkeypress="modifyBid()"> &nbsp;&nbsp; 
								<span style="margin-top: 1rem;">원</span>
						</div>
					
				</td>
			</tr>
		</table>
		
<<<<<<< HEAD
		<div id="typeBidMoney" style="color: orange; display: none; text-align: right;">입찰할 금액을<br> 입력하셔야합니다.</div>
=======
>>>>>>> 043d81d1783ccd2630b6ac8affdedf057002e7ca
		<div id="startBidError" style="color: orange; display: none; text-align: right;">시작가 이상의 금액을<br> 입찰하셔야합니다.</div>
		<div id="bidError" style="color: orange; display: none; text-align: right;">최고입찰가를 초과하는 금액을<br> 입찰하셔야합니다.</div>
		
		<div style="margin-top:1.5rem; text-align: center;">
			<select style=" margin-bottom: 2%;" name="bidAccount" class="selectpicker">
			<c:forEach items="${mAccountList }" var="mAccount"> 
				<option>${mAccount.bank }은행 | ${mAccount.accountNo }</option>
			</c:forEach>	
			</select> &nbsp;에서 출금
		</div>

		<div style="width: 100%; text-align:center; ">
			<button type="submit" class="btn btn-outline-success " style="width:35%; margin-top:1rem; margin-bottom: 1rem;">입찰하기</button>
		</div>
		</form>


	</div>


    <jsp:include page="/WEB-INF/jsp/include/lib/botLibs.jsp"></jsp:include>
<<<<<<< HEAD
	<script src="${pageContext.request.contextPath }/resources/wow/dist/wow.min.js"></script>
    
    <script type="text/javascript">
    
    new WOW().init();
    

function comma(num){
    	    var len, point, str; 
    	       
    	    num = num + ""; 
    	    point = num.length % 3 ;
    	    len = num.length; 
    	   
    	    str = num.substring(0, point); 
    	    while (point < len) { 
    	        if (str != "") str += ","; 
    	        str += num.substring(point, point + 3); 
    	        point += 3; 
    	    } 
    	     
    	    return str;
      }
      
      if(${aucGoodsVO.winningBid} == 0) {
    	  console.log("확인")
    	  $("#noBidMsg").show()
    	  $("#noBidMsg2").show()
    	  $("#highestBid").hide()
    	  $("#bidMsg").hide()
      } else {
    	  $("#highestBid").show()
    	  $("#noBidMsg").hide()
    	  $("#noBidMsg2").hide()
    	  $("#bidMsg").show()
      }
    
      let hBid = 0;
    function getHighestBid() {
    	$.get({
    		url: "${pageContext.request.contextPath}/getHighestBid/" + ${aucGoodsVO.no},
    		success: function(highestBid) {
    			hBid = highestBid;
    			
    			if (highestBid != 0) {
    				console.log("확인?")
				let oriHighestBid =$("#highestBid").text();
				let newHighestBid = comma(highestBid) + " 원";

    			$("#highestBid").show()
    			
    			$("#noBidMsg").hide()
    			$("#noBidMsg2").hide()
    			
    			$("#bidMsg").addClass("wow flipInX")
    			$("#bidCons").text(newHighestBid )
    	  		$("#bidMsg").show("wow flipInX")
				
		if (newHighestBid != oriHighestBid ) {
// 			console.log("최고입찰가 갱신됨")
			$("#highestBidTag").hide()
			$("#highestBidTag").addClass("wow flipInX")
			$("#highestBidTag").show("wow flipInX")
			$("#highestBid").text(newHighestBid);
			
		} else {
// 			console.log("입찰갱신내역 없음")
		}
    			}
    },
			error: function() {
				console.log("최고입찰가 받아오기 실패")
			}
    	
    	})
    }
    
    
    getHighestBid()
	setHighestBid = setInterval(function() {
		getHighestBid()
		console.log("hBid : " + hBid)
		}, 3000);
    
    
=======
    
    <script type="text/javascript">
>>>>>>> 043d81d1783ccd2630b6ac8affdedf057002e7ca
  
	function checkBidMoney(winningBid, startPrice) {
		
		let bidMoney = document.bForm.bidMoney.value
		
<<<<<<< HEAD
		if (bidMoney == '') {
			$("#typeBidMoney").show()
			return false;
		} else {
		
		
		if (hBid == 0) {
=======
		if (winningBid == 0) {
>>>>>>> 043d81d1783ccd2630b6ac8affdedf057002e7ca
			if (parseInt(bidMoney) < startPrice) {
				$("#startBidError").show();
				return false;
			}	
		} else {
<<<<<<< HEAD
			if (parseInt(bidMoney) <= hBid) {
=======
			if (parseInt(bidMoney) <= winningBid) {
>>>>>>> 043d81d1783ccd2630b6ac8affdedf057002e7ca
// 			if (parseInt(bidMoney) + ${pastBidMoney} <= winningBid) { (과거버전)
				$("#bidError").show();
				return false;
			}
<<<<<<< HEAD
			}
=======
>>>>>>> 043d81d1783ccd2630b6ac8affdedf057002e7ca
	}
	return true;
}
	
	function modifyBid() {
		$("#startBidError").hide();
		$("#bidError").hide();
<<<<<<< HEAD
		$("#typeBidMoney").hide()
=======
>>>>>>> 043d81d1783ccd2630b6ac8affdedf057002e7ca
	}

	  
	  $('.na-nav a').on('click',function(){
		 $(this).addClass('top-on');
		 $(this).siblings().removeClass('top-on');
		});
	  $('.na-nav2 a').on('click',function(){
		 $(this).addClass('bottom-on');
		 $(this).siblings().removeClass('bottom-on');
		});
  
  
  </script>    
</body>
</html>