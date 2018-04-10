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

        .tabs dir_tab col3 z-depth-1 clearfix {
            display: block !important;
        }
    </style>
</head>
<script type="text/javascript"
        src="http://webapi.amap.com/maps?v=1.4.4&key=122415937ee5c46b71afac74c72cbfb9&plugin=AMap.Autocomplete,AMap.PlaceSearch,AMap.Driving,AMap.Walking,AMap.Transfer,AMap.CitySearch,AMap.Geolocation"></script>
<script src="//webapi.amap.com/ui/1.0/main.js?v=1.0.11"></script>
<link rel="stylesheet" href="http://cache.amap.com/lbs/static/main1119.css"/>
<link href="${ctx}/resources/statics/css/search.css" rel="stylesheet" type="text/css"/>
<body>
<!--header-->
<jsp:include page="/WEB-INF/common/header.jsp"></jsp:include>

<!--header-->
<div style="background:url(${ctx}/resources/showtemp/background/bg0.jpg);">
    <div class="content" style="margin: 0 auto;width: 80%;box-shadow: 0px 0px 20px #000; ">
        <!--gallery-->
        <div id="container" class="properties" style="position: relative;">
            <section id="dirBox" style="overflow: visible;">
                <div id="dirbox" class="dirbox" style="display: block; transform: translateY(0px);z-index: 9999;">
                    <div id="indexbox" class="real-height-box">
                        <div class="content">
                            <div id="planForm">
                                <ul class="tabs dir_tab col3 z-depth-1 " id="trafficTab">
                                    <li>
                                        <a id="carTab" class="palntype_tab icon-car icondirtip"
                                           href="javascript:void(0)"
                                           data-type="car"></a>
                                    </li>
                                    <li>
                                        <a id="busTab" class="palntype_tab icon-bus icondirtip"
                                           href="javascript:void(0)"
                                           data-type="bus"></a>
                                    </li>
                                    <li>
                                        <a id="walkTab" class="palntype_tab icon-walk icondirtip current"
                                           href="javascript:void(0)" data-type="walk"></a>
                                    </li>
                                </ul>
                                <div class="line-search" data-spm-anchor-id="0.0.0.i3.42e51c4eBTRLpO">
                                    <div class="line-search-form"><p class="line_serch_ipt line-search-from">
                                        <label>起 </label>
                                        <input type="text" class="dir_ipt" id="dir_from_ipt" style="outline: none;"
                                               dirtype="from" placeholder="请输入起点" value="" autocomplete="off"
                                               data-spm-anchor-id="0.0.0.i6.42e51c4eBTRLpO">
                                    </p>
                                        <div class="passList" style="display: none;"></div>
                                        <p class="line_serch_ipt line-search-to"><label>终 </label>
                                            <input type="text" class="dir_ipt" id="dir_to_ipt" style="outline: none;"
                                                   dirtype="to" placeholder="请输入终点" value="" autocomplete="off">
                                        </p>
                                    </div>
                                    <a href="javascript:void(0)" class="line-search-right icon_add" id="via_add"
                                       style="display: none;"></a>
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
                                        <a href="javascript:void(0)"
                                           onclick="pathPlanning.methods.getCurrentLocation();"
                                           id="locsug" style="text-align:left;">我的位置</a>
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
</div>

<table class="containerMiddle">
    <tr valign='top'>
        <td id="containerMiddleLeft" class="containerMiddleLeft">


        </td>

        <td class="containerMiddleCenter">
            <div id="containerMiddleCenterTop" class="containerMiddleCenterTop">

            </div>

            <div id="containerForms" class="containerForms">
                <div id="topForms" class="column forms mainForms topForms" style='display:none'>

                </div>

                <table class="containerFormsMiddle" cellpadding='0' cellspacing='0'>
                    <tr>
                        <td valign="top" id="containerFormsLeft" class="containerFormsLeft" style='display:none'>
                            <div class="containerFormsLeftTop">
                            </div>
                            <div id="leftForms" class="column forms sideForms leftForms">

                            </div>
                            <div class="containerFormsLeftBottom">
                            </div>
                        </td>

                        <td valign="top" id="containerFormsCenter" class="containerFormsCenter">

                            <div id="centerTopForms" class="column forms mainForms centerTopForms">
                                <div id='module12' _indexClass='formIndex1' _moduleType='12' _modulestyle='103'
                                     _moduleid='12' class='form form12 formIndex1 formStyle103' title='' _sys='0'
                                     _banId='' style='' _side='0' _inTab='0' _inMulMCol='0' _inFullmeasure='0'
                                     _inpack='0' _inpopupzone='0' _autoHeight='1' _global='false' _independent='false'>
                                    <table class='formTop formTop12' cellpadding='0' cellspacing='0'>
                                        <tr>
                                            <td class='left'></td>
                                            <td class='center'></td>
                                            <td class='right'></td>
                                        </tr>
                                    </table>
                                    <table class=' formMiddle formMiddle12' style='' cellpadding='0' cellspacing='0'>
                                        <tr>
                                            <td class='formMiddleLeft formMiddleLeft12'></td>
                                            <td class='formMiddleCenter formMiddleCenter12 ' valign='top'>
                                                <div class='formMiddleContent formMiddleContent12 fk-formContentOtherPadding'
                                                     tabStyle='0'>
                                                    <div class='newsDetail newsDetailV2' newsid='9'>
                                                        <div class='title'
                                                             style="font-size: 25px;color: #333;text-align: left;margin-top: 40px">
                                                            婺源2日玩法
                                                        </div>
                                                        <div class='newsInfoWrap'>
                                                            <div class='rightInfo'></div>
                                                            <div class='leftInfo'></div>
                                                        </div>
                                                        <div class='line1'></div>
                                                        <div class='richContent  richContent0'>
                                                            <p><br/></p>
                                                            <dl>
                                                                <dt style="margin:0px 0px 5px;padding:0px;list-style:none;font-size:18px;color:#333333;line-height:24px;font-family:Arial, &quot;Lucida Grande&quot;, &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Hiragino Sans GB W3&quot;, SimSun, &quot;PingFang SC&quot;, STHeiti;">
                                                                    路线概览
                                                                </dt>
                                                                <dd style="margin:0px;padding:0px;list-style:none;font-size:14px;line-height:28px;color:#666666;font-family:Arial, &quot;Lucida Grande&quot;, &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Hiragino Sans GB W3&quot;, SimSun, &quot;PingFang SC&quot;, STHeiti;">
                                                                    <div style="margin:0px;padding:0px;word-wrap:break-word;visibility:visible;">
                                                                        <p style="word-wrap:break-word;padding-left:40px;">
                                                                            <span style="float:left;margin-left:-40px;">D1</span><a
                                                                                href="javascript:void(0);"
                                                                                target="_blank"
                                                                                style="color:#666666;text-decoration:none;cursor:pointer;background-color:transparent;">小桥流水人家李坑(3小时)</a>
                                                                            <span style="margin:0px 10px;display:inline-block;width:14px;height:10px;overflow:hidden;line-height:100px;background:url(&quot;/images/mdd/place/line-details-sprites7.png&quot;) -80px 0px no-repeat;">→</span>
                                                                            <a href="javascript:void(0);"
                                                                               target="_blank"
                                                                               style="color:#666666;text-decoration:none;cursor:pointer;background-color:transparent;">伟人故里江湾(1小时0)</a>
                                                                            <span style="margin:0px 10px;display:inline-block;width:14px;height:10px;overflow:hidden;line-height:100px;background:url(&quot;/images/mdd/place/line-details-sprites7.png&quot;) -80px 0px no-repeat;">→</span>
                                                                            <a href="javascript:void(0);"
                                                                               target="_blank"
                                                                               style="color:#666666;text-decoration:none;cursor:pointer;background-color:transparent;">晒秋人家篁岭(2小时)</a>
                                                                            <span style="margin:0px 10px;display:inline-block;width:14px;height:10px;overflow:hidden;line-height:100px;background:url(&quot;/images/mdd/place/line-details-sprites7.png&quot;) -80px 0px no-repeat;">→</span>
                                                                            <a href="javascript:void(0);"
                                                                               target="_blank"
                                                                               style="color:#666666;text-decoration:none;cursor:pointer;background-color:transparent;">四大花海江岭(2小时)</a>
                                                                        </p>
                                                                        <p style="word-wrap:break-word;padding-left:40px;">
                                                                            <span style="float:left;margin-left:-40px;">D2</span><a
                                                                                href="javascript:void(0);"
                                                                                target="_blank"
                                                                                style="color:#666666;text-decoration:none;cursor:pointer;background-color:transparent;">清华彩虹桥(3小时)</a>
                                                                            <span style="margin:0px 10px;display:inline-block;width:14px;height:10px;overflow:hidden;line-height:100px;background:url(&quot;/images/mdd/place/line-details-sprites7.png&quot;) -80px 0px no-repeat;">→</span>
                                                                            <a href="javascript:void(0);"
                                                                               target="_blank"
                                                                               style="color:#666666;text-decoration:none;cursor:pointer;background-color:transparent;">思溪严村(1小时)</a>
                                                                            <span style="margin:0px 10px;display:inline-block;width:14px;height:10px;overflow:hidden;line-height:100px;background:url(&quot;/images/mdd/place/line-details-sprites7.png&quot;) -80px 0px no-repeat;">→</span>
                                                                            <a href="javascript:void(0);"
                                                                               target="_blank"
                                                                               style="color:#666666;text-decoration:none;cursor:pointer;background-color:transparent;">大鄣山卧龙谷(1小时)</a>
                                                                            <span style="margin:0px 10px;display:inline-block;width:14px;height:10px;overflow:hidden;line-height:100px;background:url(&quot;/images/mdd/place/line-details-sprites7.png&quot;) -80px 0px no-repeat;">→</span>
                                                                            <a href="javascript:void(0);"
                                                                               target="_blank"
                                                                               style="color:#666666;text-decoration:none;cursor:pointer;background-color:transparent;">灵岩洞(2小时)</a>
                                                                        </p></div>
                                                                </dd>
                                                            </dl>
                                                            <div style="margin:0px 0px 15px;padding:0px;word-wrap:break-word;height:45px;border-bottom:1px solid #EFEFEE;color:#666666;font-family:Arial, &quot;Lucida Grande&quot;, &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Hiragino Sans GB W3&quot;, SimSun, &quot;PingFang SC&quot;, STHeiti;">
                                                                <span style="display:inline-block;margin:5px 20px 0px 0px;font-size:18px;color:#333333;line-height:24px;vertical-align:top;">第一天：游玩攻略</span>
                                                            </div>
                                                            <div style="margin:0px 0px 25px;padding:0px;word-wrap:break-word;font-size:16px;color:#333333;line-height:24px;font-family:Arial, &quot;Lucida Grande&quot;, &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Hiragino Sans GB W3&quot;, SimSun, &quot;PingFang SC&quot;, STHeiti;">
                                                                今日集中游览婺源东部景点，上午来到李坑体验小桥流水人家文化享用民间午餐，下午游览伟人故里江湾和十分考验驾驶技术的晒秋人家篁岭，欣赏美丽的乡村景色，傍晚来到四大花海江岭伴着夜色欣赏乡村夜景。
                                                            </div>
                                                            <div style="margin:0px;padding:0px;word-wrap:break-word;color:#666666;font-family:Arial, &quot;Lucida Grande&quot;, &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Hiragino Sans GB W3&quot;, SimSun, &quot;PingFang SC&quot;, STHeiti;">
                                                                <div style="margin:0px 0px 25px;padding:0px;word-wrap:break-word;font-size:16px;color:#333333;line-height:24px;"></div>
                                                                <div style="margin:0px 0px 15px;padding:0px;word-wrap:break-word;line-height:30px;font-size:14px;">
                                                                    <ul style="margin:0px -30px 0px 0px;padding:0px;list-style:none;">
                                                                        <li style="margin:0px 30px 0px 0px;padding:0px;list-style:none;display:inline;">
                                                                            <p><span
                                                                                    style="display:inline-block;margin:0px 20px 0px 0px;color:#333333;line-height:24px;vertical-align:top;"><em
                                                                                    style="float:left;margin:5px 5px 0px 0px;width:11px;height:14px;overflow:hidden;background:url(&quot;/images/mdd/place/line-details-sprites7.png&quot;) -100px -145px no-repeat;"></em><a
                                                                                    target="_blank"
                                                                                    href="javascript:void(0);"
                                                                                    data-time="3小时"
                                                                                    style="color:#FF9D00;text-decoration:none;cursor:pointer;display:inline-block;background-color:transparent;">小桥流水人家李坑</a><span
                                                                                    style="color:#999999;font-size:12px;margin-left:8px;">(3小时)</span></span>
                                                                                <span style="display:inline-block;margin:0px 20px 0px 0px;padding:0px 16px 0px 15px;border-bottom:2px solid #EFEFEE;line-height:24px;font-size:12px;position:relative;vertical-align:top;">驾车10分钟<em
                                                                                        style="position:absolute;right:0px;bottom:0px;width:10px;height:7px;overflow:hidden;background:url(&quot;/images/mdd/place/line-details-sprites7.png&quot;) -100px 0px no-repeat;"></em></span>
                                                                                <span style="display:inline-block;margin:0px 20px 0px 0px;color:#333333;line-height:24px;vertical-align:top;"><em
                                                                                        style="float:left;margin:5px 5px 0px 0px;width:11px;height:14px;overflow:hidden;background:url(&quot;/images/mdd/place/line-details-sprites7.png&quot;) -100px -145px no-repeat;"></em><a
                                                                                        target="_blank"
                                                                                        href="javascript:void(0);"
                                                                                        data-time="1小时0"
                                                                                        style="color:#FF9D00;text-decoration:none;cursor:pointer;display:inline-block;background-color:transparent;">伟人故里江湾</a><span
                                                                                        style="color:#999999;font-size:12px;margin-left:8px;">(1小时0)</span></span>
                                                                                <span style="display:inline-block;margin:0px 20px 0px 0px;padding:0px 16px 0px 15px;border-bottom:2px solid #EFEFEE;line-height:24px;font-size:12px;position:relative;vertical-align:top;">驾车10分钟<em
                                                                                        style="position:absolute;right:0px;bottom:0px;width:10px;height:7px;overflow:hidden;background:url(&quot;/images/mdd/place/line-details-sprites7.png&quot;) -100px 0px no-repeat;"></em></span>
                                                                                <span style="display:inline-block;margin:0px 20px 0px 0px;color:#333333;line-height:24px;vertical-align:top;"><em
                                                                                        style="float:left;margin:5px 5px 0px 0px;width:11px;height:14px;overflow:hidden;background:url(&quot;/images/mdd/place/line-details-sprites7.png&quot;) -100px -145px no-repeat;"></em><a
                                                                                        target="_blank"
                                                                                        href="javascript:void(0);"
                                                                                        data-time="2小时"
                                                                                        style="color:#FF9D00;text-decoration:none;cursor:pointer;display:inline-block;background-color:transparent;">晒秋人家篁岭</a><span
                                                                                        style="color:#999999;font-size:12px;margin-left:8px;">(2小时)</span></span>
                                                                                <span style="display:inline-block;margin:0px 20px 0px 0px;padding:0px 16px 0px 15px;border-bottom:2px solid #EFEFEE;line-height:24px;font-size:12px;position:relative;vertical-align:top;">驾车8分钟<em
                                                                                        style="position:absolute;right:0px;bottom:0px;width:10px;height:7px;overflow:hidden;background:url(&quot;/images/mdd/place/line-details-sprites7.png&quot;) -100px 0px no-repeat;"></em></span><span
                                                                                        style="display:inline-block;margin:0px 20px 0px 0px;color:#333333;line-height:24px;vertical-align:top;"><em
                                                                                        style="float:left;margin:5px 5px 0px 0px;width:11px;height:14px;overflow:hidden;background:url(&quot;/images/mdd/place/line-details-sprites7.png&quot;) -100px -145px no-repeat;"></em><a
                                                                                        target="_blank"
                                                                                        href="javascript:void(0);"
                                                                                        data-time="2小时"
                                                                                        style="color:#FF9D00;text-decoration:none;cursor:pointer;display:inline-block;background-color:transparent;">四大花海江岭</a><span
                                                                                        style="color:#999999;font-size:12px;margin-left:8px;">(2小时)</span></span>
                                                                            </p></li>
                                                                    </ul>
                                                                </div>
                                                            </div>
                                                            <div style="margin:0px 0px 15px;padding:0px;word-wrap:break-word;height:45px;border-bottom:1px solid #EFEFEE;color:#666666;font-family:Arial, &quot;Lucida Grande&quot;, &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Hiragino Sans GB W3&quot;, SimSun, &quot;PingFang SC&quot;, STHeiti;">
                                                                <span style="display:inline-block;margin:5px 20px 0px 0px;font-size:18px;color:#333333;line-height:24px;vertical-align:top;">第二天：游玩攻略</span>
                                                            </div>
                                                            <div style="margin:0px 0px 25px;padding:0px;word-wrap:break-word;font-size:16px;color:#333333;line-height:24px;font-family:Arial, &quot;Lucida Grande&quot;, &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Hiragino Sans GB W3&quot;, SimSun, &quot;PingFang SC&quot;, STHeiti;">
                                                                上午来到婺源的被誉为中国最美的廊桥的彩虹桥体感受中国古代劳动人民的智慧，下午来到思溪严村体验当地的风土人情、游览森林氧吧的大鄣山卧龙谷，晚上灵岩洞感受大自然的鬼斧神工。
                                                            </div>
                                                            <div style="margin:0px;padding:0px;word-wrap:break-word;color:#666666;font-family:Arial, &quot;Lucida Grande&quot;, &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Hiragino Sans GB W3&quot;, SimSun, &quot;PingFang SC&quot;, STHeiti;">
                                                                <div style="margin:0px 0px 25px;padding:0px;word-wrap:break-word;font-size:16px;color:#333333;line-height:24px;"></div>
                                                                <div style="margin:0px 0px 15px;padding:0px;word-wrap:break-word;line-height:30px;font-size:14px;">
                                                                    <ul style="margin:0px -30px 0px 0px;padding:0px;list-style:none;">
                                                                        <li style="margin:0px 30px 0px 0px;padding:0px;list-style:none;display:inline;">
                                                                            <p><span
                                                                                    style="display:inline-block;margin:0px 20px 0px 0px;color:#333333;line-height:24px;vertical-align:top;"><em
                                                                                    style="float:left;margin:5px 5px 0px 0px;width:11px;height:14px;overflow:hidden;background:url(&quot;/images/mdd/place/line-details-sprites7.png&quot;) -100px -145px no-repeat;"></em><a
                                                                                    target="_blank"
                                                                                    href="javascript:void(0);"
                                                                                    data-time="3小时"
                                                                                    style="color:#FF9D00;text-decoration:none;cursor:pointer;display:inline-block;background-color:transparent;">清华彩虹桥</a><span
                                                                                    style="color:#999999;font-size:12px;margin-left:8px;">(3小时)</span></span>
                                                                                <span style="display:inline-block;margin:0px 20px 0px 0px;padding:0px 16px 0px 15px;border-bottom:2px solid #EFEFEE;line-height:24px;font-size:12px;position:relative;vertical-align:top;">驾车4分钟<em
                                                                                        style="position:absolute;right:0px;bottom:0px;width:10px;height:7px;overflow:hidden;background:url(&quot;/images/mdd/place/line-details-sprites7.png&quot;) -100px 0px no-repeat;"></em></span>
                                                                                <span style="display:inline-block;margin:0px 20px 0px 0px;color:#333333;line-height:24px;vertical-align:top;"><em
                                                                                        style="float:left;margin:5px 5px 0px 0px;width:11px;height:14px;overflow:hidden;background:url(&quot;/images/mdd/place/line-details-sprites7.png&quot;) -100px -145px no-repeat;"></em><a
                                                                                        target="_blank"
                                                                                        href="javascript:void(0);"
                                                                                        data-time="1小时"
                                                                                        style="color:#FF9D00;text-decoration:none;cursor:pointer;display:inline-block;background-color:transparent;">思溪严村</a><span
                                                                                        style="color:#999999;font-size:12px;margin-left:8px;">(1小时)</span></span>
                                                                                <span style="display:inline-block;margin:0px 20px 0px 0px;padding:0px 16px 0px 15px;border-bottom:2px solid #EFEFEE;line-height:24px;font-size:12px;position:relative;vertical-align:top;">驾车7钟<em
                                                                                        style="position:absolute;right:0px;bottom:0px;width:10px;height:7px;overflow:hidden;background:url(&quot;/images/mdd/place/line-details-sprites7.png&quot;) -100px 0px no-repeat;"></em></span>
                                                                                <span style="display:inline-block;margin:0px 20px 0px 0px;color:#333333;line-height:24px;vertical-align:top;"><em
                                                                                        style="float:left;margin:5px 5px 0px 0px;width:11px;height:14px;overflow:hidden;background:url(&quot;/images/mdd/place/line-details-sprites7.png&quot;) -100px -145px no-repeat;"></em><a
                                                                                        target="_blank"
                                                                                        href="javascript:void(0);"
                                                                                        data-time="1小时"
                                                                                        style="color:#FF9D00;text-decoration:none;cursor:pointer;display:inline-block;background-color:transparent;">大鄣山卧龙谷</a><span
                                                                                        style="color:#999999;font-size:12px;margin-left:8px;">(1小时)</span></span>
                                                                                <span style="display:inline-block;margin:0px 20px 0px 0px;padding:0px 16px 0px 15px;border-bottom:2px solid #EFEFEE;line-height:24px;font-size:12px;position:relative;vertical-align:top;">驾车13分钟<em
                                                                                        style="position:absolute;right:0px;bottom:0px;width:10px;height:7px;overflow:hidden;background:url(&quot;/images/mdd/place/line-details-sprites7.png&quot;) -100px 0px no-repeat;"></em></span>
                                                                                <span style="display:inline-block;margin:0px 20px 0px 0px;color:#333333;line-height:24px;vertical-align:top;"><em
                                                                                        style="float:left;margin:5px 5px 0px 0px;width:11px;height:14px;overflow:hidden;background:url(&quot;/images/mdd/place/line-details-sprites7.png&quot;) -100px -145px no-repeat;"></em><a
                                                                                        target="_blank"
                                                                                        href="javascript:void(0);"
                                                                                        data-time="2小时"
                                                                                        style="color:#FF9D00;text-decoration:none;cursor:pointer;display:inline-block;background-color:transparent;">灵岩洞</a><span
                                                                                        style="color:#999999;font-size:12px;margin-left:8px;">(2小时)</span></span>
                                                                            </p></li>
                                                                    </ul>
                                                                </div>
                                                            </div>
                                                            <p><br/></p></div>
                                                        <div class='line2'></div>
                                                    </div>
                                                </div>
                                            </td>
                                            <td class='formMiddleRight formMiddleRight12'></td>
                                        </tr>
                                    </table>
                                    <table class='formBottom formBottom12' cellpadding='0' cellspacing='0'>
                                        <tr>
                                            <td class='left left12'></td>
                                            <td class='center center12'></td>
                                            <td class='right right12'></td>
                                        </tr>
                                    </table>
                                    <div class='clearfloat clearfloat12'></div>
                                </div>


                            </div>
                            <div class="containerFormsCenterMiddle J_containerFormsCenterMiddle">
                                <div id="middleLeftForms" class="column forms mainForms middleLeftForms"
                                     style='display:none'

                                >

                                </div>
                                <div id="middleRightForms" class="column forms mainForms middleRightForms"
                                     style='display:none'

                                >

                                </div>
                                <div class="clearfloat"></div>
                            </div>
                            <div id="centerBottomForms" class="column forms mainForms centerBottomForms"
                                 style='display:none'>

                            </div>
                        </td>

                        <td valign="top" id="containerFormsRight" class="containerFormsRight" style='display:none'>
                            <div class="containerFormsRightTop">
                            </div>
                            <div id="rightForms" class="column forms sideForms rightForms">

                            </div>
                            <div class="containerFormsRightBottom">
                            </div>
                        </td>
                    </tr>
                </table>

                <div id="bottomForms" class="column forms mainForms bottomForms" style='display:none'>

                </div>

                <div id="containerPlaceholder" class="containerPlaceholder"></div>

            </div>

            <div id="containerMiddleCenterBottom" class="containerMiddleCenterBottom">
            </div>

        </td>

        <td id="containerMiddleRight" class="containerMiddleRight"></td>
    </tr>
</table>


<!--footer-->
<jsp:include page="/WEB-INF/common/footer.jsp"></jsp:include>
<!--footer-->

</body>
<
<script src="${ctx}/resources/statics/js/sys/path_planning.js"></script>
</html>
