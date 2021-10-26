function increase(id){
	let data = {
		id: id
	}
	
	jQuery.ajax({
		url: "/ajax/increase",
		type: "post",
		contentType: "application/json",
		data: JSON.stringify(data),
		
		dataType: "json",
		success: function(jsonResult){
			window.location.reload();
		},
		error: function(jqXhr, textStatus, errorMessage){
			alert("Them that bai");
		}
	});
}

function decrease(id){
	let data = {
		id: id
	}
	
	jQuery.ajax({
		url: "/ajax/decrease",
		type: "post",
		contentType: "application/json",
		data: JSON.stringify(data),
		
		dataType: "json",
		success: function(jsonResult){
			window.location.reload();
		},
		error: function(jqXhr, textStatus, errorMessage){
			alert("Them that bai");
		}
	});
}

function deleteCart(id){
	let data = {
		id: id
	}
	
	jQuery.ajax({
		url: "/ajax/delete-cart",
		type: "post",
		contentType: "application/json",
		data: JSON.stringify(data),
		
		dataType: "json",
		success: function(jsonResult){
			window.location.reload();
		},
		error: function(jqXhr, textStatus, errorMessage){
			alert("Them that bai");
		}
	});
}




