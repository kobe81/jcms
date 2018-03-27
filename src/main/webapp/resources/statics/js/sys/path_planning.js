/**
 * 路线规划
 */
$(function(){
    //初始化地图组件
    pathPlanning.init.initMap();
    //初始化搜索面板效果
    pathPlanning.init.initClassChangeEvent("click","palntype_tab","current",true);
    pathPlanning.init.initClassChangeEvent("click","line_serch_ipt","active",false);
    //初始化搜索选择监听
    pathPlanning.init.initSearchListener( {input: "dir_from_ipt"},"select",pathPlanning.methods.receiveFromPointChange);
    pathPlanning.init.initSearchListener( {input: "dir_to_ipt"},"select",pathPlanning.methods.receiveToPointChange);
    //初始化地图UI组件
    pathPlanning.init.initMapUi();
    //初始化定位组件
    pathPlanning.init.initLocation();
});


var pathPlanning = {
    init:{
        initClassChangeEvent:function (event,elmClass,modClass,isListenerSearch) {
            $("."+elmClass).on(event,function(){
                $("."+modClass).removeClass(modClass);
                $(this).addClass(modClass);
                if(isListenerSearch){
                    if(pathPlanning.methods.isCanSearch()){
                        pathPlanning.methods.search();
                    }
                }
            });
        },
        initSearchListener:function(defaultOption,event,method){
            AMap.event.addListener(new AMap.Autocomplete(defaultOption), event, method);//注册监听，当选中某条记录时会触发
        },
        initMap:function(){
            pathPlanning.global.map = new AMap.Map(pathPlanning.constant.mapContainerId);
        },
        initMapUi:function () {
            AMapUI.loadUI(['control/BasicControl'], function (BasicControl) {
                //图层切换控件
                pathPlanning.global.map.addControl(new BasicControl.LayerSwitcher({
                    position: 'rt'
                }));
            });
        },
        initLocation:function(){
           pathPlanning.global.geolocation =  new AMap.Geolocation({
                enableHighAccuracy: true,//是否使用高精度定位，默认:true
                timeout: 10000,          //超过10秒后停止定位，默认：无穷大
                maximumAge: 0,           //定位结果缓存0毫秒，默认：0
                convert: true,           //自动偏移坐标，偏移后的坐标为高德坐标，默认：true
                showButton: false,        //显示定位按钮，默认：true
                buttonOffset: new AMap.Pixel(10, 20),//定位按钮与设置的停靠位置的偏移量，默认：Pixel(10, 20)
                showMarker: true,        //定位成功后在定位到的位置显示点标记，默认：true
                showCircle: true,        //定位成功后用圆圈表示定位精度范围，默认：true
                panToLocation: true,     //定位成功后将定位到的位置作为地图中心点，默认：true
                zoomToAccuracy:true      //定位成功后调整地图视野范围使定位位置及精度范围视野内可见，默认：false
            });
            pathPlanning.global.map.addControl(pathPlanning.global.geolocation);
        }
    },
    methods:{
        getCurrentLocation:function(){
            pathPlanning.global.geolocation.getCurrentPosition(function(status,result){
                if(status === "complete"){
                    var inputObj = $(".active").find("input");
                    if($(".active").find("input").length > 0){
                        var dirtTye = $(inputObj).attr("dirtype");
                        pathPlanning.global.localPoi.poi.name = result.addressComponent.city;
                        pathPlanning.global.localPoi.poi.district = result.formattedAddress;
                        $(inputObj).val(result.formattedAddress);
                        if(dirtTye === "from"){
                            pathPlanning.methods.receiveFromPointChange(pathPlanning.global.localPoi)
                        }else if(dirtTye === "to"){
                            pathPlanning.methods.receiveToPointChange(pathPlanning.global.localPoi)
                        }
                    }
                }
            })
        },
        isCanSearch:function(){
             if(pathPlanning.global.formAndTo.form.city!="" && pathPlanning.global.formAndTo.to.city!="") {
                 return true;
             }
             return false;
        },
        getNewInstanceDriver:function(name){
           switch (name){
               case "car": {
                   if(!pathPlanning.global.carDriver){
                       pathPlanning.global.carDriver =  new AMap.Driving({map:  pathPlanning.global.map, panel: pathPlanning.constant.panelId, policy: AMap.DrivingPolicy.LEAST_TIME})
                   }
                   return pathPlanning.global.carDriver;
               }
               case "walk": {
                   if(!pathPlanning.global.walkDriver){
                       pathPlanning.global.walkDriver =  new AMap.Walking({map:  pathPlanning.global.map, panel: pathPlanning.constant.panelId})
                   }
                   return  pathPlanning.global.walkDriver;
               }
               case "bus": {
                   if(!pathPlanning.global.busDriver){
                       pathPlanning.global.busDriver =  new AMap.Transfer({map:  pathPlanning.global.map, panel: pathPlanning.constant.panelId, policy: AMap.TransferPolicy.LEAST_TIME})
                   }
                   return pathPlanning.global.busDriver;
               }
           }
        }
        ,
        search:function () {
            var dataType = $(".current").attr("data-type");
            $("#panel").empty();
            pathPlanning.methods.getNewInstanceDriver(dataType).search([pathPlanning.global.formAndTo.form,pathPlanning.global.formAndTo.to]);
        },
        receiveFromPointChange:function(e){
            console.log(e);
            pathPlanning.global.formAndTo.form.keyword = e.poi.name;
            pathPlanning.global.formAndTo.form.city = e.poi.district
            if(pathPlanning.methods.isCanSearch()){
                pathPlanning.methods.search();
            }
        },
        receiveToPointChange:function(e){
            pathPlanning.global.formAndTo.to.keyword = e.poi.name;
            pathPlanning.global.formAndTo.to.city = e.poi.district
            if(pathPlanning.methods.isCanSearch()){
                pathPlanning.methods.search();
            }
        }

    },
    constant:{
        panelId:"panel",
        mapContainerId:"container"
    }
    ,
    global:{
        formAndTo:{
            form:{
                keyword:"",
                city:""
            },
            to:{
                keyword:"",
                city:""
            }
        },
        localPoi: {
            poi: {
                name: "",
                district: ""
            }
        },
        map:"",
        geolocation:"",
        carDriver:"",
        busDriver:"",
        walkDriver:""
    }
}

