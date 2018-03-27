<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>景点</title>
    <style type="text/css">
        .header-banner {
            background-size: 0 !important;
            /**
            动态面板层级请勿删除
           */
        }
        .amap-sug-result {
            z-index: 9999;
            /**
              动态面板层级请勿删除
             */
        }
        #panel {
            position: absolute;
            background-color: white;
            max-height: 70%;
            overflow-y: auto;
            top: 220px;
            width: 100%;
        }
        .tabs dir_tab col3 z-depth-1 clearfix{
            display: block !important;
        }
    </style>
</head>
<script type="text/javascript"
        src="http://webapi.amap.com/maps?v=1.4.4&key=122415937ee5c46b71afac74c72cbfb9&plugin=AMap.Autocomplete,AMap.PlaceSearch,AMap.Driving,AMap.Walking,AMap.Transfer,AMap.CitySearch,AMap.Geolocation"></script>
<script src="//webapi.amap.com/ui/1.0/main.js?v=1.0.11"></script>
<link rel="stylesheet" href="http://cache.amap.com/lbs/static/main1119.css"/>
<link href="${ctx}/resources/statics/css/search.css" rel="stylesheet" type="text/css"/>
<body class="bg">
<!--header-->
<jsp:include page="/WEB-INF/common/header.jsp"></jsp:include>
<!--header-->
<div class="content"style="margin: 0 auto;width: 80%;box-shadow: 0px 0px 20px #000;">
    <!--gallery-->
    <div id="container" class="properties" style="position: relative;">
        <section id="dirBox" style="overflow: visible;">
            <div id="dirbox" class="dirbox" style="display: block; transform: translateY(0px);z-index: 9999;">
                <div id="indexbox" class="real-height-box">
                    <div class="content">
                        <div id="planForm">
                            <ul class="tabs dir_tab col3 z-depth-1 " id="trafficTab">
                                <li>
                                    <a id="carTab" class="palntype_tab icon-car icondirtip" href="javascript:void(0)" data-type="car"></a>
                                </li>
                                <li>
                                    <a id="busTab" class="palntype_tab icon-bus icondirtip" href="javascript:void(0)" data-type="bus"></a>
                                </li>
                                <li>
                                    <a id="walkTab" class="palntype_tab icon-walk icondirtip current" href="javascript:void(0)" data-type="walk"></a>
                                </li>
                            </ul>
                            <div class="line-search" data-spm-anchor-id="0.0.0.i3.42e51c4eBTRLpO">
                                <div class="line-search-form"><p class="line_serch_ipt line-search-from">
                                    <label>起 </label>
                                    <input type="text" class="dir_ipt" id="dir_from_ipt" style="outline: none;" dirtype="from" placeholder="请输入起点" value="" autocomplete="off" data-spm-anchor-id="0.0.0.i6.42e51c4eBTRLpO">
                                </p>
                                    <div class="passList" style="display: none;"></div>
                                    <p class="line_serch_ipt line-search-to"><label>终 </label>
                                        <input type="text" class="dir_ipt" id="dir_to_ipt" style="outline: none;"  dirtype="to" placeholder="请输入终点" value="" autocomplete="off">
                                    </p>
                                </div>
                                <a href="javascript:void(0)" class="line-search-right icon_add" id="via_add" style="display: none;"></a>
                            </div>
                        </div>
                        <div class="plan_wrap">
                            <div class="plan_wrap_item dirtips">
                                <div class="dirtips_item dirSug">
                                    <div class="autocomplete-suggestions planform-suggestion"
                                         style="position: absolute; display: none; width: 360px; max-height: 550px; z-index: 9999;"></div>
                                    <div class="autocomplete-suggestions planform-suggestion"
                                         style="position: absolute; display: none; width: 360px; max-height: 550px; z-index: 9999;"></div>
                                </div>
                                <div class="dirtips_item dirlocSug" type="from" index="" style="display: block;">
                                    <a href="javascript:void(0)" onclick="pathPlanning.methods.getCurrentLocation();" id="locsug" style="text-align:left;">我的位置</a>
                                </div>
                            </div>
                        </div>
                        <div class="plan_wrap_item choose-poi" id="choosePoi" style="display: none;"><span
                                class="choose_lbl">请选择正确的起点、途经点或终点</span>
                            <div id="fromPoiList" class="choose-poi-list"></div>
                            <div class="viaPoiList choose-poi-list" id="viaPoiList0"></div>
                            <div class="viaPoiList choose-poi-list" id="viaPoiList1"></div>
                            <div class="viaPoiList choose-poi-list" id="viaPoiList2"></div>
                            <div id="toPoiList" class="choose-poi-list"></div>
                        </div>
                        <div class="plan_wrap_item plan_list" id="planList" style="display: none;"></div>
                        <div id="amap_panel_model"></div>
                    </div>
                </div>
            </div>

    <div class="dtrigger dragtop"></div>
    <div class="dtrigger dragleft"></div>
    <div class="dtrigger dragright"></div>
            <div id="panel"></div>
    </section>
</div>

</div>
<!--footer-->
<jsp:include page="/WEB-INF/common/footer.jsp"></jsp:include>
<!--footer-->

</body>
<
<script src="${ctx}/resources/statics/js/sys/path_planning.js"></script>
</html>
