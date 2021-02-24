<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
	<script src="https://code.jquery.com/jquery-1.11.3.js"></script>
	<script src="/resources/tui-grid.js"></script>
	<link rel="stylesheet" href="/resources/tui-grid.css">
</head>
<script>
window.onload = function () {
	var grid = new tui.Grid({
	    el: document.getElementById('grid'),
//	    data: gridData,
	    scrollX: false,
	    scrollY: false,
	    columns: [
	      {
	        header: 'Name',
	        name: 'name'
	      },
	      {
	        header: 'Artist',
	        name: 'artist'
	      },
	      {
	        header: 'Type',
	        name: 'type'
	      },
	      {
	        header: 'Release',
	        name: 'release'
	      },
	      {
	        header: 'Genre',
	        name: 'genre'
	      }
	    ]
	  });
	
	$.ajax({
		url: "ajax/toastList", //toastList, toastDataList
		method: "POST",
		dataType: "JSON",
		success: function (result) {
			console.dir(result);
			grid.resetData(result);
		}
	});
};

</script>
<body>
<h1>
	Hello world!  
</h1>

<P>  The time on the server is ${serverTime}. </P>
<div id="grid"></div>
</body>
</html>
