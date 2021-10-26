 function readURL(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();
            
            reader.onload = function (e) {
                $('#blah').attr('src', e.target.result);
            }
            
            reader.readAsDataURL(input.files[0]);
        }
    }
    
    $("#imgInp").change(function(){
        readURL(this);
    });

function addItem(baseUrl){
	let imgPath = jQuery("#imgInp").val().split('\\').pop().split('/').pop();
	let data = {
		imgIcon: imgPath,
		name: jQuery("#name").val(),
		sku: jQuery("#sku").val(),
		material: jQuery("#material").val(),
		price: jQuery("#price").val(),
		category: jQuery("#category").val(),
		number: jQuery("#number").val()
	}
	
	jQuery.ajax({
		url: baseUrl + "/ajax/add-item",
		type: "post",
		contentType: "application/json",
		data: JSON.stringify(data),
		
		dataType: "json",
		success: function(jsonResult){
			alert("Them thanh cong mat hang: "+jsonResult.message.sku);
		},
		error: function(jqXhr, textStatus, errorMessage){
			alert("Them that bai");
		}
	});
}

function editItem(baseUrl){
	let imgPath = jQuery("#imgInp").val().split('\\').pop().split('/').pop();
	let data = {
		id: jQuery("#id").val(),
		imgIcon: imgPath,
		name: jQuery("#name").val(),
		sku: jQuery("#sku").val(),
		material: jQuery("#material").val(),
		price: jQuery("#price").val(),
		category: jQuery("#category").val(),
		number: jQuery("#number").val()
	}
	
	jQuery.ajax({
		url: baseUrl + "/ajax/edit-product",
		type: "post",
		contentType: "application/json",
		data: JSON.stringify(data),
		
		dataType: "json",
		success: function(jsonResult){
			alert("Sua thanh cong san pham co id= "+jsonResult.message.id);
		},
		error: function(jqXhr, textStatus, errorMessage){
		}
	});
}

