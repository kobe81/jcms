<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>酒店</title>
    <style type="text/css">
        .hotel{
            min-height:1000px;
        }
        .mt{margin-top: 100px;}
        .mt10{margin-top: 10px;}
        .left{
            min-height: 200px;
            max-height: 800px;
            overflow-y: auto;
            float: left;
            width: 30%;
            border: 1px solid #2F79DB;
        }
        .right{
            float: right;
            width: 68%;
        }
        .right .pic{
            height: 165px;
            border: 1px solid #5599dd;
        }
        .hot{
            font-size: 20px;
            border-bottom: 3px solid #5599dd;
        }
        .list{
            min-height: 1000px;
            max-height: 1000px;
            overflow-y: auto;
            border:1px solid #dedede;
        }
        .am-nav>li>a {
            padding: .4em 1em;
            border-radius: 0;
            color: #0e90d2;
            font-size: 20px;
        }
        .info_pic{
            float: left;
            width: 34%;
        }
        .info_text{
            float: right;
            width: 65%;
            padding: 10px;
        }
        .discuss{
            min-height: 300px;
            border: 1px solid #dedede;
            margin-top: 10px;
            margin-bottom: 10px;
        }
        .discuss .tool{
            min-height: 30px;
            margin: 2px;
        }

        .fileInputContainer{
            background:url(${ctx}/resources/statics/img/picture.png) no-repeat;
            position:relative;
            height: 30px;
            width: 35px;
            cursor:pointer;
        }
        .fileInput{
            height: 30px;
            width: 35px;
            position:absolute;
            right:0;
            top:0;
            opacity: 0;
            filter:alpha(opacity=0);
            cursor:pointer;
        }
    </style>

</head>
<body>
<!--header-->
<jsp:include page="/WEB-INF/common/header.jsp"></jsp:include>
<!--header-->
<div class="hotel container">
<div class="mt left am-radius">
    <div class="">
        <ul class="am-nav">
            <li class="am-nav-header">景点</li>
            <c:forEach var="scenic" items="${scenics}">
                <li><a href="javascript:discuss.getInfo(${scenic.id})">${scenic.title}</a></li>
            </c:forEach>
        </ul>
    </div>
</div>
<div class="mt right">
    <div class="pic">
        <div class="info_pic">
            <img src="${ctx}/resources/showtemp/showImg/chq.jpg" class="am-img-thumbnail am-radius">
        </div>
        <div class="info_text">
            <span> 江岭，位于婺源县东北部，距县城45公里，总面积38平方公里，每当春暖花开时，置身于江岭万亩梯田中，黄灿灿的油菜花与远山、近水、粉墙、黛瓦相映成趣，构成一幅天人合一的画卷，在这里您可以尽情的释放，让心灵自由飞翔。</span>
            <a href="#" class="button" style="float: right;margin-top: 50px;">了解更多</a>
        </div>
    </div>
    <div class="mt10">
        <div class="hot">
            全部评论（123）
        </div>
        <%--酒店列表--%>
        <div class="list">
            <ul class="am-comments-list am-comments-list-flip" style="margin-bottom: 10px;">
                <li class="am-comment">
                    <article class="am-comment">
                        <a href="#link-to-user-home">
                            <img src="http://s.amazeui.org/media/i/demos/bw-2014-06-19.jpg?imageView/1/w/96/h/96" class="am-comment-avatar" width="48" height="48"/>
                        </a>

                        <div class="am-comment-main">
                            <header class="am-comment-hd">
                                <!--<h3 class="am-comment-title">评论标题</h3>-->
                                <div class="am-comment-meta">
                                    <a href="#link-to-user" class="am-comment-author">某人</a>
                                    评论于 <time datetime="2013-07-27T04:54:29-07:00" title="2013年7月27日 下午7:54 格林尼治标准时间+0800">2014-7-12 15:30</time>
                                </div>
                            </header>

                            <div class="am-comment-bd">
                                测试说的话
                            </div>
                        </div>
                    </article>
                </li>
                <li class="am-comment  am-comment-flip">
                    <article class="am-comment">
                        <a href="#link-to-user-home">
                            <img src="http://s.amazeui.org/media/i/demos/bw-2014-06-19.jpg?imageView/1/w/96/h/96" class="am-comment-avatar" width="48" height="48"/>
                        </a>

                        <div class="am-comment-main">
                            <header class="am-comment-hd">
                                <!--<h3 class="am-comment-title">评论标题</h3>-->
                                <div class="am-comment-meta">
                                    <a href="#link-to-user" class="am-comment-author">某人</a>
                                    评论于 <time datetime="2013-07-27T04:54:29-07:00" title="2013年7月27日 下午7:54 格林尼治标准时间+0800">2014-7-12 15:30</time>
                                </div>
                            </header>

                            <div class="am-comment-bd">
                                <p>测试说的话测试说的话测试说的话测试说的话测试说的话测试说的话测试说的话测试说的话测试
                                    测试说的话测试说的话测试说的话测试说的话说的话测试说的话测试说的话测试说的话测试说的话测试说的话</p>
                                <img width="150" src="${ctx}/resources/showtemp/showImg/chq.jpg" class="am-img-thumbnail am-radius">
                                <img width="150" src="${ctx}/resources/showtemp/showImg/chq.jpg" class="am-img-thumbnail am-radius">
                                <img width="150" src="${ctx}/resources/showtemp/showImg/chq.jpg" class="am-img-thumbnail am-radius">
                                <img width="150" src="${ctx}/resources/showtemp/showImg/chq.jpg" class="am-img-thumbnail am-radius">
                                <img width="150" src="${ctx}/resources/showtemp/showImg/chq.jpg" class="am-img-thumbnail am-radius">
                            </div>
                        </div>
                    </article>
                </li>
                <li class="am-comment am-comment-flip">
                    <article class="am-comment">
                        <a href="#link-to-user-home">
                            <img src="http://s.amazeui.org/media/i/demos/bw-2014-06-19.jpg?imageView/1/w/96/h/96" class="am-comment-avatar" width="48" height="48"/>
                        </a>

                        <div class="am-comment-main">
                            <header class="am-comment-hd">
                                <!--<h3 class="am-comment-title">评论标题</h3>-->
                                <div class="am-comment-meta">
                                    <a href="#link-to-user" class="am-comment-author">某人</a>
                                    评论于 <time datetime="2013-07-27T04:54:29-07:00" title="2013年7月27日 下午7:54 格林尼治标准时间+0800">2014-7-12 15:30</time>
                                </div>
                            </header>

                            <div class="am-comment-bd">
                                <p>测试说的话测试说的话测试说的话测试说的话测试说的话测试说的话测试说的话测试说的话测试
                                    测试说的话测试说的话测试说的话测试说的话说的话测试说的话测试说的话测试说的话测试说的话测试说的话</p>
                                <img width="150" src="${ctx}/resources/showtemp/showImg/chq.jpg" class="am-img-thumbnail am-radius">
                                <img width="150" src="${ctx}/resources/showtemp/showImg/chq.jpg" class="am-img-thumbnail am-radius">
                                <img width="150" src="${ctx}/resources/showtemp/showImg/chq.jpg" class="am-img-thumbnail am-radius">
                                <img width="150" src="${ctx}/resources/showtemp/showImg/chq.jpg" class="am-img-thumbnail am-radius">
                                <img width="150" src="${ctx}/resources/showtemp/showImg/chq.jpg" class="am-img-thumbnail am-radius">
                            </div>
                        </div>
                    </article>
                </li>
                <li class="am-comment am-comment-highlight">
                    <article class="am-comment">
                        <a href="#link-to-user-home">
                            <img src="http://s.amazeui.org/media/i/demos/bw-2014-06-19.jpg?imageView/1/w/96/h/96" class="am-comment-avatar" width="48" height="48"/>
                        </a>

                        <div class="am-comment-main">
                            <header class="am-comment-hd">
                                <!--<h3 class="am-comment-title">评论标题</h3>-->
                                <div class="am-comment-meta">
                                    <a href="#link-to-user" class="am-comment-author">某人</a>
                                    评论于 <time datetime="2013-07-27T04:54:29-07:00" title="2013年7月27日 下午7:54 格林尼治标准时间+0800">2014-7-12 15:30</time>
                                </div>
                            </header>

                            <div class="am-comment-bd">
                                <p>测试说的话测试说的话测试说的话测试说的话测试说的话测试说的话测试说的话测试说的话测试
                                    测试说的话测试说的话测试说的话测试说的话说的话测试说的话测试说的话测试说的话测试说的话测试说的话</p>
                                <img width="150" src="${ctx}/resources/showtemp/showImg/chq.jpg" class="am-img-thumbnail am-radius">
                                <img width="150" src="${ctx}/resources/showtemp/showImg/chq.jpg" class="am-img-thumbnail am-radius">
                                <img width="150" src="${ctx}/resources/showtemp/showImg/chq.jpg" class="am-img-thumbnail am-radius">
                                <img width="150" src="${ctx}/resources/showtemp/showImg/chq.jpg" class="am-img-thumbnail am-radius">
                                <img width="150" src="${ctx}/resources/showtemp/showImg/chq.jpg" class="am-img-thumbnail am-radius">
                            </div>
                        </div>
                    </article>
                </li>
            </ul>
        </div>
        <div class="discuss">
            <div class="tool">
            <div class="fileInputContainer">
                <input class="fileInput" type="file" id="file"/>
            </div>
            </div>
            <div>
                <textarea style="width: 100%;" rows="10" placeholder="一字千金"></textarea>
            </div>
            <div style="border-bottom: 1px solid #dedede;margin-top: 5px;">
                <img width="150" src="${ctx}/resources/showtemp/showImg/chq.jpg" class="am-img-thumbnail am-radius">
                <img width="150" src="${ctx}/resources/showtemp/showImg/chq.jpg" class="am-img-thumbnail am-radius">
                <img width="150" src="${ctx}/resources/showtemp/showImg/chq.jpg" class="am-img-thumbnail am-radius">
                <img width="150" src="${ctx}/resources/showtemp/showImg/chq.jpg" class="am-img-thumbnail am-radius">
                <img width="150" src="${ctx}/resources/showtemp/showImg/chq.jpg" class="am-img-thumbnail am-radius">
                <img width="150" src="${ctx}/resources/showtemp/showImg/chq.jpg" class="am-img-thumbnail am-radius">
                <img width="150" src="${ctx}/resources/showtemp/showImg/chq.jpg" class="am-img-thumbnail am-radius">
            </div>
            <div style="margin-left: 660px;padding: 5px;">
                <button type="button" class="am-btn am-btn-warning">发表评论</button>
            </div>

        </div>
    </div>
</div>
</div>
<!--footer-->
<jsp:include page="/WEB-INF/common/footer.jsp"></jsp:include>
<!--footer-->
<script src="${ctx}/resources/statics/js/discuss.js"></script>
</body>
</html>
