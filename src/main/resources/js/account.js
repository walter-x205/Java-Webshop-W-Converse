function editUser(baseUrl){
	let data = {
		id: jQuery("#id").val(),
		avatar: null,
		name: jQuery("#name").val(),
		username: jQuery("#username").val(),
		password: jQuery("#password").val(),
		email: jQuery("#email").val(),
		phone: jQuery("#phone").val(),
	}
	
	jQuery.ajax({
		url: baseUrl + "/ajax/edit-user",
		type: "post",
		contentType: "application/json",
		data: JSON.stringify(data),
		
		dataType: "json",
		success: function(jsonResult){
			alert("Sua thanh cong user: "+jsonResult.message.username);
		},
		error: function(jqXhr, textStatus, errorMessage){
			alert("Sua that bai ");
		}
	});
}

function addAdmin(baseUrl){
	let imgPath = jQuery("#imgInp").val().split('\\').pop().split('/').pop();
	let data = {
		avatar: imgPath,
		name: jQuery("#name").val(),
		username: jQuery("#username").val(),
		password: jQuery("#password").val(),
		email: jQuery("#email").val(),
		phone: jQuery("#phone").val(),
		owner: jQuery("#owner").val()
	}
	
	jQuery.ajax({
		url: baseUrl + "/ajax/add-admin",
		type: "post",
		contentType: "application/json",
		data: JSON.stringify(data),
		
		dataType: "json",
		success: function(jsonResult){
			alert("Them thanh cong "+jsonResult.message.username);
		},
		error: function(jqXhr, textStatus, errorMessage){
			alert("Them that bai");
		}
	});
}