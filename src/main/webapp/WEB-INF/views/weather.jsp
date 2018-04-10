<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<!-- Head -->
<head>

    <title>婺源一周旅游天气预报</title>

    <!-- For-Mobile-Apps -->
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="keywords"
          content="Monaco Weather Widget Responsive, Login Form Web Template, Flat Pricing Tables, Flat Drop-Downs, Sign-Up Web Templates, Flat Web Templates, Login Sign-up Responsive Web Template, Smartphone Compatible Web Template, Free Web Designs for Nokia, Samsung, LG, Sony Ericsson, Motorola Web Design"/>
    <script type="application/x-javascript"> addEventListener("load", function () {
        setTimeout(hideURLbar, 0);
    }, false);

    function hideURLbar() {
        window.scrollTo(0, 1);
    } </script>
    <!-- //For-Mobile-Apps -->

    <!-- Index-Page-CSS -->
    <link rel="stylesheet" href="${ctx}/jcms/resources/statics/weather/css/style.css" type="text/css" media="all">
    <!-- Owl-Carousel-CSS -->
    <link rel="stylesheet" href="${ctx}/jcms/resources/statics/weather/css/owl.carousel.css" type="text/css" media="all">

    <!-- Fonts -->
    <link rel="stylesheet" href="//fonts.googleapis.com/css?family=Open+Sans:400,600,700" type="text/css" media="all">
    <link rel="stylesheet" href="//fonts.googleapis.com/css?family=Raleway:100,200,300,400,500,600,700,800,900"
          type="text/css" media="all">
    <!-- //Fonts -->

    <!-- Font-Awesome-File-Links -->
    <!-- CSS -->
    <link rel="stylesheet" href="${ctx}/jcms/resources/statics/weather/css/font-awesome.css" type="text/css" media="all">
    <!-- TTF -->
    <link rel="stylesheet" href="${ctx}/jcms/resources/statics/weather/fonts/fontawesome-webfont.ttf" type="text/css"
          media="all">
    <!-- //Font-Awesome-File-Links -->


</head>
<!-- Head -->


<!-- Body -->
<body onload="startTime()">

<!-- Heading -->
<h1>婺源旅游天气</h1>
<!-- //Headng -->


<!-- Container -->
<div class="container">

    <!-- Current-Weather-Widget -->
    <div class="weather-widget agileits w3layouts">
        <div class="place agileits w3layouts">

            <div class="city agileits-w3layouts agileits w3layouts">
                <p>婺源, 江西</p>
            </div>

            <div class="dmy agileits w3-agile w3layouts">
                <script type="text/javascript">
                    var mydate = new Date()
                    var year = mydate.getYear()
                    if (year < 1000)
                        year += 1900
                    var day = mydate.getDay()
                    var month = mydate.getMonth() + 1
                    var daym = mydate.getDate()
                    if (daym < 10)
                        daym = "0" + daym
                    var dayarray = new Array("星期日", "星期一", "星期二", "星期三", "星期四", "星期五", "星期六")
                    var montharray = new Array("January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December")
                    document.write("" + dayarray[day] + ", " + month + "/" + daym + ", " + year + "")
                </script>
            </div>

            <div id="txt"></div>

            <div class="w3temperatureaits agileits w3-agileits">
                <div class="w3temperatureaits-grid w3-agileits wthreetemp">
                    <p></p>
                </div>
                <div class="w3temperatureaits-grid w3tempimg">
                    <figure class="icons agileits w3layouts">
                        <canvas id="today_icon" width="70" class="w3-agileits" height="70"></canvas>
                    </figure>
                </div>
                <div class="w3temperatureaits-grid w3-agile wthreestats">
                    <ul>
                        <li class="agiletemp agiletemppressure">710 mm Hg</li>
                        <li class="agiletemp wthree agiletemphumidity w3-agile">40% Humidity</li>
                        <li class="agiletemp agileits-w3layouts agileinfo agiletempwind">4m/s NE</li>
                    </ul>
                </div>
                <div class="clear"></div>
            </div>

            <div id="owl-demo" class="owl-carousel agileits text-center">
                <div class="item w3threeitem w3threeitem1">
                    <h4 id="future_time0">SUN</h4>
                    <figure class="icons agileits-w3layouts agileits w3layouts">
                        <canvas id="future_weather0" width="50" height="50"></canvas>
                    </figure>
                    <h5 id="future_temperature01">18°C</h5>
                    <h6 id="future_temperature02">12°C</h6>
                </div>
                <div class="item w3threeitem agileinfo w3threeitem2">
                    <h4 id="future_time1">MON</h4>
                    <figure class="icons wthree agileits w3layouts">
                        <canvas id="future_weather1" width="50" class="w3ls" height="50"></canvas>
                    </figure>
                    <h5 id="future_temperature11">17°C</h5>
                    <h6 id="future_temperature12">12°C</h6>
                </div>
                <div class="item w3 w3threeitem w3threeitem3">
                    <h4 id="future_time2">TUE</h4>
                    <figure class="icons agileits w3layouts">
                        <canvas id="future_weather2" width="50" height="50"></canvas>
                    </figure>
                    <h5 id="future_temperature21">17°C</h5>
                    <h6 id="future_temperature22">10°C</h6>
                </div>
                <div class="item w3threeitem w3threeitem4">
                    <h4 id="future_time3">WED</h4>
                    <figure class="icons agileits w3layouts">
                        <canvas id="future_weather3" width="50" class="w3ls" height="50"></canvas>
                    </figure>
                    <h5 id="future_temperature31">17°C</h5>
                    <h6 id="future_temperature32">10°C</h6>
                </div>
                <div class="item w3threeitem wthree agileinfo w3threeitem5">
                    <h4 id="future_time4">THU</h4>
                    <figure class="icons agileits w3layouts">
                        <canvas id="future_weather4" width="50" height="50"></canvas>
                    </figure>
                    <h5 id="future_temperature41">17°C</h5>
                    <h6 id="future_temperature42">10°C</h6>
                </div>
                <div class="item w3 w3threeitem w3threeitem6">
                    <h4 id="future_time5">FRI</h4>
                    <figure class="icons agileits w3layouts">
                        <canvas id="future_weather5" width="50" height="50"></canvas>
                    </figure>
                    <h5 id="future_temperature51">12°C</h5>
                    <h6 id="future_temperature52">10°C</h6>
                </div>
                <div class="item w3l w3threeitem w3threeitem7">
                    <h4 id="future_time6">SAT</h4>
                    <figure class="icons agileits w3layouts">
                        <canvas id="future_weather6" class="agileits-w3layouts" width="50" height="50"></canvas>
                    </figure>
                    <h5 id="future_temperature61">20°C</h5>
                    <h6 id="future_temperature62">15°C</h6>
                </div>
            </div>

        </div>
    </div>
    <!-- //Current-Weather-Widget -->

</div>
<!-- //Container -->


<!-- Footer -->
<div class="footer">

    <<%--!-- Copyright -->
    <div class="copyright ">
        <p> &copy; 2017 Wuyuan Weather Widget. All Rights Reserved | Design by <a href="javascript:void(0);">Hong
            Tong</a></p>
    </div>--%>
    <!-- //Copyright -->

</div>
<!-- //Footer -->


<!-- Custom-JavaScript-File-Links -->

<!-- Default-JavaScript -->
<script type="text/javascript" src="${ctx}/jcms/resources/statics/weather/js/jquery-3.1.1.js"></script>

<!-- Time-JavaScript -->
<script>
    function startTime() {
        var today = new Date();
        var h = today.getHours();
        var m = today.getMinutes();
        var s = today.getSeconds();
        m = checkTime(m);
        s = checkTime(s);
        document.getElementById('txt').innerHTML = h + ":" + m + ":" + s;
        var t = setTimeout(startTime, 500);
    }

    function checkTime(i) {
        if (i < 10) {
            i = "0" + i
        }
        ;
        return i;
    }
</script>
<!-- //Time-JavaScript -->

<!-- Weather-Widget-JavaScript -->
<script src="${ctx}/jcms/resources/statics/weather/js/skycons.js"></script>
<script>
    var icons = new Skycons({"color": "#FFFFFF"}),
        list = [
            "clear-day"
        ],
        i;
    for (i = list.length; i--;)
        icons.set(list[i], list[i]);
    icons.play();
</script>
<script>

    $.ajax({
        type: "GET",
        url: "http://v.juhe.cn/weather/index?cityname=%E5%A9%BA%E6%BA%90&dtype=&format=&key=371f8c087423fdbb97e69ee4826e32c9",
        contentType: "application/json",
        dataType: "JSONP",
        success: function (obj) {

            //当前温度
            $(".w3temperatureaits-grid.w3-agileits.wthreetemp>p").html(obj.result.sk.temp + "℃");

            //今日温度
            $(".agiletemp.agiletemppressure").html(obj.result.today.temperature);

            //湿度
            $(".agiletemp.wthree.agiletemphumidity.w3-agile").html("湿度   " + obj.result.sk.humidity);

            //风向风力
            $(".agiletemp.agileits-w3layouts.agileinfo.agiletempwind").html(obj.result.sk.wind_direction + "   " + obj.result.sk.wind_strength);

            var icons = new Skycons({"color": "#FFFFFF"});
            //未来七天天气
            for (var i = 0; i <= 6; i++) {

                //获取年月日
                function getDay(day) {
                    var today = new Date();
                    var targetday_milliseconds = today.getTime() + 1000 * 60 * 60 * 24 * day;
                    today.setTime(targetday_milliseconds); //注意，这行是关键代码
                    var tYear = today.getFullYear();
                    var tMonth = today.getMonth();
                    var tDate = today.getDate();
                    tMonth = doHandleMonth(tMonth + 1);
                    tDate = doHandleMonth(tDate);
                    return "day_" + tYear + "" + tMonth + "" + tDate;
                }

                function doHandleMonth(month) {
                    var m = month;
                    if (month.toString().length == 1) {
                        m = "0" + month;
                    }
                    return m;
                }

                var future_day = getDay(i);
                //未来的温度
                var funture_temperature = obj.result.future[future_day].temperature;
                var str = funture_temperature.split('~');
                $("#future_temperature" + i + "1").html(str[0]);
                $("#future_temperature" + i + "2").html(str[1]);
                //未来的星期几
                var future_time = obj.result.future[future_day].week;
                $("#future_time" + i).html(future_time);
                //未来天气的图标
                var first_c = obj.result.future[future_day].weather_id.fa;
                //设置天气图标
                switch (first_c) {
                    case "00":
                        icons.set("future_weather" + i, "clear-day");
                        icons.play();
                        if (i == 0) {
                            icons.set("today_icon", "clear-day");
                            icons.play();
                        }
                        break;
                    case "01":
                        icons.set("future_weather" + i, "partly-cloudy-day");
                        icons.play();
                        if (i == 0) {
                            icons.set("today_icon", "partly-cloudy-day");
                            icons.play();
                        }
                        break;
                    case "02":
                        icons.set("future_weather" + i, "cloudy");
                        icons.play();
                        if (i == 0) {
                            icons.set("today_icon", "cloudy");
                            icons.play();
                        }
                        break;
                    case "03":
                    case "04":
                        icons.set("future_weather" + i, "rain");
                        icons.play();
                        if (i == 0) {
                            icons.set("today_icon", "rain");
                            icons.play();
                        }
                        break;
                    case "05":
                    case "06":
                    case "19":
                        icons.set("future_weather" + i, "sleet");
                        icons.play();
                        if (i == 0) {
                            icons.set("today_icon", "sleet");
                            icons.play();
                        }
                        break;
                    case "07":
                    case "08":
                    case "09":
                    case "10":
                    case "11":
                    case "12":
                    case "21":
                    case "22":
                    case "23":
                    case "24":
                    case "25":
                        icons.set("future_weather" + i, "rain");
                        icons.play();
                        if (i == 0) {
                            icons.set("today_icon", "rain");
                            icons.play();
                        }
                        break;
                    case "13":
                    case "14":
                    case "15":
                    case "16":
                    case "17":
                    case "26":
                    case "27":
                    case "28":
                        icons.set("future_weather" + i, "snow");
                        icons.play();
                        if (i == 0) {
                            icons.set("today_icon", "snow");
                            icons.play();
                        }
                        break;
                    case "18":
                    case "53":
                        icons.set("future_weather" + i, "fog");
                        icons.play();
                        if (i == 0) {
                            icons.set("today_icon", "fog");
                            icons.play();
                        }
                        break;
                    case "20":
                    case "29":
                    case "30":
                    case "31":
                        icons.set("future_weather" + i, "wind");
                        icons.play();
                        if (i == 0) {
                            icons.set("today_icon", "wind");
                            icons.play();
                        }
                        break;
                    default:
                        icons.set("future_weather" + i, "clear-day");
                        icons.play();
                        if (i == 0) {
                            icons.set("today_icon", "clear-day");
                            icons.play();
                        }
                }
            }
        }
    });


</script>
<!--//Weather-Widget-JavaScript -->

<!-- Owl-Carousel-JavaScript -->
<script src="${ctx}/jcms/resources/statics/weather/js/owl.carousel.js"></script>
<script>
    $(document).ready(function () {
        $("#owl-demo").owlCarousel({
            autoPlay: 3000,
            items: 5,
            itemsDesktop: [1024, 4],
            itemsDesktopSmall: [640, 3]
        });
    });
</script>
<!-- //Owl-Carousel-JavaScript -->

<!-- //Custom-JavaScript-File-Links -->


</body>
<!-- //Body -->


</html>