window.onscroll = function() {myFunction()};

  var header = document.getElementById("myMenu");
  var sticky = header.offsetTop;
  
  function myFunction() {
    if (window.pageYOffset > sticky) {
      header.classList.add("sticky");
    } else {
      header.classList.remove("sticky");
    }
  }
  
 function addToCart(id){
	let data = {
		id: id
	}
	
	jQuery.ajax({
		url: "/ajax/add-to-cart",
		type: "post",
		contentType: "application/json",
		data: JSON.stringify(data),
		
		dataType: "json",
		success: function(jsonResult){
			alert("Thêm vào giỏ hàng thành công");
			$("#itemInCart").html(jsonResult.totalInCart);
		},
		error: function(jqXhr, textStatus, errorMessage){
			alert("Them that bai");
		}
	});
}