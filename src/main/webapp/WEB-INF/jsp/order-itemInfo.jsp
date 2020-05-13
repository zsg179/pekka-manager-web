<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link rel="stylesheet" href="/css/base.css" />
<link href="/css/purchase.2012.css" rel="stylesheet">
<link rel="stylesheet" href="/css/order-commons.css" />
<script type="text/javascript" src="/js/base.js"></script>
<script type="text/javascript" src="/js/order.common.js"></script>
<script type="text/javascript" src="/js/jquery.checkout.js"></script>
<div class="goods-suit goods-last">
	<c:forEach items="${orderItems }" var="orderItem">
		<div class="goods-item goods-item-extra" style="padding: 0 0 10px;">
			<div class="p-img"
				style="float: left; width: 80px; height: 80px; border: 1px solid #ddd; margin-right: 10px;">
				<img src="${orderItem.picPath}" alt="皮卡" />
			</div>
			<div class="goods-msg">
				<div class="p-name">${orderItem.title }</div>
				<div class="p-price">
					<!--增加预售金额显示 begin   预售分阶段支付类型（1：一阶梯全款支付；2：一阶梯定金支付(全款或定金可选)；3：三阶梯仅定金支付） -->
					<strong>￥<fmt:formatNumber groupingUsed="false"
							maxFractionDigits="2" minFractionDigits="2"
							value="${orderItem.price / 100 }" /></strong>
					<!--增加预售金额显示 end-->
					<span class="ml20"> x${orderItem.num} </span> <!-- <span
						class="ml20 p-inventory" skuId="11555193">有货</span> -->
				</div>
				<!-- <i class="p-icon p-icon-w"></i><span class="ftx-04">7天无理由退货</span> -->
			</div>
			<div class="clr"></div>
		</div>
	</c:forEach>
</div>