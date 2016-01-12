$( document ).on('ready page:load',function(){
	$("#term").autocomplete({
		source: "/search"
	});  
});