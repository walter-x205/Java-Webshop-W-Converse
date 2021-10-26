package com.wshop.converse.controller.customer;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.logging.Logger;

import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.http.client.ClientProtocolException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.view.RedirectView;

import com.wshop.converse.db_connect.DAO;
import com.wshop.converse.db_connect.User;
import com.wshop.converse.db_connect.homepage.Cart;
import com.wshop.converse.db_connect.homepage.CartItem;
import com.wshop.converse.db_connect.homepage.HomeProductDAO;
import com.wshop.converse.db_connect.homepage.Payment;
import com.wshop.converse.dto.Login_DAO;
import com.wshop.converse.dto.SignIn;
import com.wshop.converse.services.zalopay.CreateOrderService;
import com.wshop.converse.services.zalopay.OrderItem;
import com.wshop.converse.db_connect.homepage.Orders;

@Controller
public class PaymentController {
	@RequestMapping(value = { "/payment" }, method = RequestMethod.GET)
	public String doPayment(final ModelMap model, final HttpServletRequest request, final HttpServletResponse response)
			throws IOException {

		return "customer/payment";
	}

	
	@RequestMapping(value = { "/COD" }, method = RequestMethod.GET)
	public RedirectView payment(final ModelMap model, final HttpServletRequest request, final HttpServletResponse response)
			throws IOException {
		String pID = String.valueOf(System.currentTimeMillis());
		String rName = request.getParameter("receiver-name");
		String rPhone = request.getParameter("receiver-phone");
		String rAddress = request.getParameter("receiver-address");
		String payType = request.getParameter("pay-type");
		HttpSession session = request.getSession();
		Cart cart = (Cart) session.getAttribute("cart");
		User user = (User) session.getAttribute("account");
		List<CartItem> listItems = cart.getItem();
		ArrayList<Orders> listOrder = new ArrayList<Orders>();
		for (int i = 0; i < listItems.size(); i++) {
			listOrder.add(new Orders(pID, listItems.get(i).getProduct().getId(), listItems.get(i).getQuantity(),
					listItems.get(i).getPrice() * listItems.get(i).getQuantity()));
		}
		Payment payment = new Payment();
		payment.setId(pID);
		payment.setCustomerId(user.getId());
		payment.setAmount(cart.getTotal());
		payment.setPayment(payType);
		payment.setPaymentName(rName);
		payment.setPaymentAddress(rAddress);
		payment.setPaymentPhone(rPhone);
		payment.setCreatedDate(new Date());
		HomeProductDAO hDao = new HomeProductDAO();
		hDao.addPayment(payment);
		hDao.addOrders(listOrder);
		session.removeAttribute("cart");
		if (payType.equals("Thanh toán khi nhận hàng")) {
			return new RedirectView("https://zpt.2soft.top/bill");
		}
		else {
			return createOrder(cart.getTotal());
		}
	}
	
	 	private Logger logger = Logger.getLogger(this.getClass().getName());
	    private String key2 = "eG4r0GcoNtRGbO8";
	    private Mac HmacSHA256;

	    public PaymentController() throws Exception  {
	        HmacSHA256 = Mac.getInstance("HmacSHA256");
	        HmacSHA256.init(new SecretKeySpec(key2.getBytes(), "HmacSHA256"));
	    }
	    
	    @PostMapping("/zalopay/order")
	    public RedirectView createOrder(int amount) throws ClientProtocolException, IOException {
	    	OrderItem[] items = {
	    			new OrderItem("12312", "tich  ta kiem pho", 10000, 1)
	    	};
	    	return new RedirectView(CreateOrderService.call(items, amount, "user1"));
	    }

	    @GetMapping("/zalopay/callback")
	    public String callback(final ModelMap model, final HttpServletRequest request, final HttpServletResponse response,
	    		@RequestParam long amount,
	    		@RequestParam long discountamount,
	    		@RequestParam String appid,
	    		@RequestParam String checksum,
	    		@RequestParam String apptransid,
	    		@RequestParam String pmcid,
	    		@RequestParam String bankcode,
	    		@RequestParam int status
	    		) throws IOException {

	          if (status == 1) {
	        	  return bill(model, request, response);
	          }
	          
	          return "Thanh toán thất bại";
	    }

	@RequestMapping(value = { "/bill" }, method = RequestMethod.GET)
	public String bill(final ModelMap model, final HttpServletRequest request, final HttpServletResponse response)
			throws IOException {
		Payment showPayment = new Payment();
		HomeProductDAO hDao = new HomeProductDAO();
		DAO dao = new DAO();
		showPayment = hDao.getPayment();
		ArrayList<Orders> listOrders = hDao.getOrdersByPid(showPayment.getId());
		ArrayList<String> show = new ArrayList<String>();
		for (int i = 0; i < listOrders.size(); i++) {
			show.add(listOrders.get(i).getQty() + "x " + dao.getProductId(listOrders.get(i).getProductId()).getName());
		}
		showPayment.setShowOrders(show);
		model.addAttribute("show", showPayment);
		return "customer/bill";
	}
	
	@RequestMapping(value = { "/fast-login" }, method = RequestMethod.POST)
	public String fastLogin(final ModelMap model, final HttpServletRequest request, final HttpServletResponse response,
			final @ModelAttribute("fast-login") SignIn login)
			throws IOException {
		model.addAttribute("fast-login", login);
		Login_DAO ldao = new Login_DAO();
		User log = new User();
		log = ldao.userSignIn(login.getUsername(), login.getPassword());
		if (log == null) {
			model.addAttribute("mess", "Đăng nhập thất bại, username hoặc password không chính xác");
			return "customer/cart";
		} else {
			HttpSession session = request.getSession();
			session.setAttribute("account", log);
			return doPayment(model, request, response);
		}
	}
	
}
