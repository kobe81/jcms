<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>婺源旅游</title>

</head>
<body>
			<!--header-->
			<jsp:include page="/WEB-INF/common/header.jsp"></jsp:include>
			<!--header-->
				<!--bannerslider-->
				<div class="header-banner">
					<div class="slider">
						<div class="container">
							<div class="callbacks_container">
								<ul class="rslides" id="slider">
									<li>	
										<div class="caption">
											<h3>婺源</h3>
											<p>婺源，位于赣东北，是一颗镶嵌在皖、浙、赣三省交界处的绿色明珠。婺源历史悠久，唐开元二十八年（公元740年）置县，在历史上曾隶属安徽管辖，是古徽州一府六县之一，素有书乡、茶乡之称。</p>
										</div>
									</li>
									<%--<li>
										<div class="caption">
											<h3>Middle Loup River Property-NEW!</h3>
											<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Praesent vestibulum molestie lacus. Aenean nonummy hendrerit mauris. Phasellus porta. Fusce suscipit varius mi. Lorem ipsum dolor sit amet, </p>
										</div>
									</li>
									<li>
										<div class="caption">
											<h3>Western Heartlands - Wayoming</h3>
											<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Praesent vestibulum molestie lacus. Aenean nonummy hendrerit mauris. Phasellus porta. Fusce suscipit varius mi. Lorem ipsum dolor sit amet, </p>
										</div>
									</li>--%>
								</ul>
							</div>
						</div>
					</div>
				</div>
				<!--bannerslider-->
				<!--welcome-->
				<div class="content">
					<div class="welcome">
						<div class="container">
							<h2>欢迎来到 江西<span>·</span>婺源</h2>
							<div class="wel-grids">
								<div class="col-md-4 wel-grid">
									<img src="resources/showtemp/background/index3.jpg" class="img-responsive" alt=""/>
									<h4>打糍粑</h4>
									<p>婺源人遇上好事或喜事都有打糍粑的风俗，比如生日、高榜提名、红白喜事等都要打糍粑。糍粑虽然好吃，但它的制做过程很繁琐，我这里给大家介紹一下打糍粑的流程，给喜欢婺源风俗的朋友了解了解。</p>
								</div>
								<div class="col-md-4 wel-grid">
									<img src="resources/showtemp/background/index2.jpg" class="img-responsive" alt=""/>
									<h4>串堂班</h4>
									<p>婺源民间每有婚嫁寿诞等喜事，都会请串堂班在宴席间演奏，场面十分热闹。客人边吃喝边听奏乐，别有一番趣味。串堂班是一种民间音乐组织，成员一般六到八人，有的是以此为生的乐队，有的是农闲时临时邀集而成，如今基本上是后一种。串堂班有大锣、云锣、小锣、鼓、钹、唢呐、笛子、二胡、京胡、三弦等乐器。每人擅长二三种乐器，班主由文..</p>
								</div>
								<div class="col-md-4 wel-grid">
									<img src="resources/showtemp/background/index4.jpg" class="img-responsive" alt=""/>
									<h4>礼仪待客的习俗</h4>
									<p>自古以来，婺源就是礼仪之邦，民风俭朴，讲究坐不争上，食不争多，行不争先的“三不”礼节；与人交往，诚售为上；与人交谈，书往往来，对人尊呼，对已谦称；入私塾学馆，尊师为父。对长辈按辈份称呼，平辈间称哥称嫂或直呼其名；对店主称老板、老板嫂（娘），对雇员、工匠称师傅；对有学识的人称先生；对老人称婆称公。</p>
								</div>
								<div class="clearfix"></div>
							</div>
						</div>
					</div>
				<!--welcome-->
				<div class="copyrights">Collect from <a href="http://www.cssmoban.com/"  title="网站模板">网站模板</a></div>
				<!--feature-->
					<div class="feature">
						<div class="container">
							<h3>婺源景色</h3>
								<div class="feature-grids">
									<div class="col-md-3 feature-grid">
									<a href="#" class="mask">
									<img src="resources/showtemp/images/p4.jpg" class="img-responsive zoom-img" alt=""></a>
									</div>
									<div class="col-md-3 feature-grid1">
										<h4>江岭:</h4>
										<p>江岭，位于婺源县东北部，距县城45公里，总面积38平方公里，每当春暖花开时，置身于江岭万亩梯田中，黄灿灿的油菜花与远山、近水、粉墙、黛瓦相映成趣，构成一幅天人合一的画卷，在这里您可以尽情的释放，让心灵自由飞翔。 </p>
										<a href="${ctx}/scenic/jump/scenicInfo?id=1" class="button">了解更多</a>
									</div>
									<div class="col-md-3 feature-grid">
										<a href="#" class="mask">
									<img src="resources/showtemp/images/p5.jpg" class="img-responsive zoom-img" alt=""></a>
									</div>
									<div class="col-md-3 feature-grid">
										<a href="#" class="mask">
									<img src="resources/showtemp/images/p6.jpg" class="img-responsive zoom-img" alt=""></a>
									</div>
									<div class="clearfix"></div>
								</div>
								<div class="feature-grids1">
									<div class="col-md-6 feat-grid">
										<a href="#" class="mask">
									<img src="resources/showtemp/images/p7.jpg" class="img-responsive zoom-img" alt=""></a>
									</div>
									<div class="col-md-6 feat-grid">
										<div class="feat-grids">
											<div class="featu-grid">
												<a href="#" class="mask">
												<img src="resources/showtemp/images/p8.jpg" class="img-responsive zoom-img" alt=""></a>
											</div>
											<div class="featu-grid1">
												<h4>卧龙谷:</h4>
												<p>大鄣山卧龙谷是国家AAAA级景区，地处皖赣边界，是婺源的北部屏障，属黄山余脉。 清代诗人汪循《登大鄣山》诗云：“清风岭上豁双眸，擂鼓峰前数九州，蟠踞徽饶三百里，平分吴楚两源头”。这里也是“吴楚分源”的屋脊，是鄱阳湖水系乐安江与钱塘江水系新安江的分水岭。</p>
												<a href="${ctx}/scenic/jump/scenicInfo?id=1" class="button">了解更多</a>
											</div>
											<div class="clearfix"></div>
										</div>
									</div>
									<div class="clearfix"></div>
								</div>
								<div class="feature-grids2">
									<div class="col-md-3 feature-grid">
										<a href="#" class="mask">
									<img src="resources/showtemp/images/p9.jpg" class="img-responsive zoom-img" alt=""></a>
									</div>
									<div class="col-md-3 feature-grid">
										<a href="#" class="mask">
									<img src="resources/showtemp/images/p10.jpg" class="img-responsive zoom-img" alt=""></a>
									</div>
									<div class="col-md-3 feature-grid1">
										<h4>石城:</h4>
										<p>石城位于婺源县西北的大鄣山乡境内，村头有石壁，岩如古城，危耸的城“墙”内外有许多古树名木，其中最让人惊叹的就是这里的百来棵枫树，每棵树高都在35米以上，远远超过村里的高矮屋顶，和巨大且笔直向上的树冠相比，粉墙黛瓦简直就是玩具魔方搭建起的屋子。</p>
										<a href="${ctx}/scenic/jump/scenicInfo?id=1" class="button">了解更多</a>
									</div>
									<div class="col-md-3 feature-grid">
										<a href="#" class="mask">
									<img src="resources/showtemp/images/p11.jpg" class="img-responsive zoom-img" alt=""></a>
									</div>
									<div class="clearfix"></div>
								</div>
						</div>
					</div>
				<!--feature-->
				</div>
			<!--footer-->
			<jsp:include page="/WEB-INF/common/footer.jsp"></jsp:include>
			<!--footer-->
			<script>
                $(function () {
                    $("#slider").responsiveSlides({
                        auto: true,
                        nav: true,
                        speed: 500,
                        namespace: "callbacks",
                        pager: true,
                    });
                });
			</script>
</body>
</html>
