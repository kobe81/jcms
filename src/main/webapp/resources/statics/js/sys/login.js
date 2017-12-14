var login={
		doloign:function(){
			$.post("/sys/login",{
				"userName":$("userName").val(),
				"password":$("userName").val()
				},function(data,status){
				
			});
		}
}