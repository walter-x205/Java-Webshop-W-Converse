package com.wshop.converse.controller.customer;

import java.io.IOException;
import java.text.NumberFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.fasterxml.jackson.annotation.JsonTypeInfo.Id;
import com.wshop.converse.db_connect.DAO;
import com.wshop.converse.db_connect.Product;
import com.wshop.converse.db_connect.User;
import com.wshop.converse.db_connect.homepage.Cart;
import com.wshop.converse.db_connect.homepage.CartItem;
import com.wshop.converse.db_connect.homepage.HomeProductDAO;
import com.wshop.converse.dto.AddItemModel;
import com.wshop.converse.dto.Login_DAO;
import com.wshop.converse.dto.SignIn;

@Controller
public class IndexController {

	@RequestMapping(value = { "/homepage" }, method = RequestMethod.GET)
	public String home(final ModelMap model, final HttpServletRequest request, final HttpServletResponse response)
			throws IOException {
		HomeProductDAO dao = new HomeProductDAO();
		ArrayList<Product> msList = dao.getProductByCategory("Men-Sneaker");
		ArrayList<Product> wsList = dao.getProductByCategory("Women-Sneaker");
		ArrayList<Product> ksList = dao.getProductByCategory("Kid-Sneaker");
		model.addAttribute("msList", msList);
		model.addAttribute("wsList", wsList);
		model.addAttribute("ksList", ksList);
		return "customer/homepage"; 

	}

	@RequestMapping(value = { "/item-detail" }, method = RequestMethod.GET)
	public String itemDetail(final ModelMap model, final HttpServletRequest request, final HttpServletResponse response)
			throws IOException {
		String id = request.getParameter("id");
		DAO dao = new DAO();
		Product i = dao.getProductId(Integer.parseInt(id));
		model.addAttribute("detail", i);
		HomeProductDAO rndDao = new HomeProductDAO();
		ArrayList<Product> msList = rndDao.getRandProductByCategory("Men-Sneaker");
		ArrayList<Product> wsList = rndDao.getRandProductByCategory("Women-Sneaker");
		ArrayList<Product> ksList = rndDao.getRandProductByCategory("Kid-Sneaker");
		model.addAttribute("rmsList", msList);
		model.addAttribute("rwsList", wsList);
		model.addAttribute("rksList", ksList);
		return "customer/item-detail"; 

	}
	
	@RequestMapping(value = { "/menu-detail" }, method = RequestMethod.GET)
	public String menuDetail(final ModelMap model, final HttpServletRequest request, final HttpServletResponse response)
			throws IOException {
		String cate = request.getParameter("cate");
		model.addAttribute("cate", cate);
		HomeProductDAO dao = new HomeProductDAO();
		ArrayList<Product> menuList = null;
		if (cate.equals("men")) {
			menuList = dao.getProductByCategory("Men-Sneaker");
		}
		if (cate.equals("women")) {
			menuList = dao.getProductByCategory("Women-Sneaker");
		}
		if (cate.equals("kid")) {
			menuList = dao.getProductByCategory("Kid-Sneaker");
		}
		model.addAttribute("mList", menuList);
		return "customer/menu-detail"; 

	}
	
	@RequestMapping(value = { "/login-form" }, method = RequestMethod.GET)
	public String loginForm(final ModelMap model, final HttpServletRequest request, final HttpServletResponse response)
			throws IOException {
		SignIn login = new SignIn();
		model.addAttribute("login", login);
		return "customer/login-form";
	}
	
	@RequestMapping(value = { "/login" }, method = RequestMethod.POST)
	public String doLogin(final ModelMap model, final HttpServletRequest request, final HttpServletResponse response,
			final @ModelAttribute("login") SignIn login)
			throws IOException {
		model.addAttribute("login", login);
		Login_DAO ldao = new Login_DAO();
		User log = new User();
		log = ldao.userSignIn(login.getUsername(), login.getPassword());
		if (log == null) {
			model.addAttribute("mess", "Username or Password is not correct");
			return "customer/login-form";
		} else {
			HttpSession session = request.getSession();
			session.setAttribute("account", log);
			return home(model, request, response);
		}
	}
	
	@RequestMapping(value = { "/logout" }, method = RequestMethod.GET)
	public String doLogout(final ModelMap model, final HttpServletRequest request, final HttpServletResponse response)
			throws IOException {
		HttpSession session = request.getSession();
		session.removeAttribute("account");
		session.removeAttribute("cart");
		return home(model, request, response);
	}
	
	@RequestMapping(value = { "/cart" }, method = RequestMethod.GET)
	public String cart(final ModelMap model, final HttpServletRequest request, final HttpServletResponse response )
			throws IOException {
		HttpSession session = request.getSession();
		SignIn login = new SignIn();
		model.addAttribute("fast-login", login);
		session.getAttribute("cart");
		return "customer/cart"; 

	}
	
	@RequestMapping(value = { "/ajax/add-to-cart" }, method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> addToCartAjax(final ModelMap model, final HttpServletRequest request,
			final HttpServletResponse response, final @RequestBody Product id) throws IOException {
		Map<String, Object> jsonResult = new HashMap<String, Object>();
		int quantity = 1;
		DAO dao = new DAO();
		Product product = new Product();
		product = dao.getProductId(id.getId());
		HttpSession session = request.getSession();
		Cart cart = new Cart();
		List<CartItem> listItems = new ArrayList<CartItem>();
		if (session.getAttribute("cart")==null) {
			cart = new Cart();
			CartItem productItem = new CartItem(product, quantity, product.getPrice());
			listItems.add(productItem);
			cart.setItem(listItems);
		} else {
			cart = (Cart) session.getAttribute("cart");
			listItems = cart.getItem();
			boolean check = false;
			for (CartItem item : listItems) {
				if (item.getProduct().getId() == product.getId()) {
					item.setQuantity(item.getQuantity()+quantity);
					check = true;
				}
			}
			if (check == false) {
				CartItem item = new CartItem(product, quantity, product.getPrice());
				listItems.add(item);
			}
		}
		session.setAttribute("cart", cart);
		jsonResult.put("code", 200);
		jsonResult.put("message", product);
		jsonResult.put("totalInCart", cart.getTic());
		return ResponseEntity.ok(jsonResult);
	}
	
	@RequestMapping(value = { "/ajax/increase" }, method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> increaseAjax(final ModelMap model, final HttpServletRequest request,
			final HttpServletResponse response, final @RequestBody Product product) throws IOException {
		Map<String, Object> jsonResult = new HashMap<String, Object>();
		HttpSession session = request.getSession();
		Cart cart = (Cart) session.getAttribute("cart");
		List<CartItem> listItems = cart.getItem();
		
		for (CartItem item : listItems) {
			if (item.getProduct().getId() == product.getId()) {
				item.setQuantity(item.getQuantity()+1);
				
			}
		}
		session.setAttribute("cart", cart);
		jsonResult.put("code", 200);
		jsonResult.put("message", product);
		return ResponseEntity.ok(jsonResult);
	}
	
	@RequestMapping(value = { "/ajax/decrease" }, method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> decreaseAjax(final ModelMap model, final HttpServletRequest request,
			final HttpServletResponse response, final @RequestBody Product product) throws IOException {
		Map<String, Object> jsonResult = new HashMap<String, Object>();
		HttpSession session = request.getSession();
		Cart cart = (Cart) session.getAttribute("cart");
		List<CartItem> listItems = cart.getItem();
		for (CartItem item : listItems) {
			if (item.getProduct().getId() == product.getId()) {
				item.setQuantity(item.getQuantity()-1);
			}
		}
		session.setAttribute("cart", cart);
		jsonResult.put("code", 200);
		jsonResult.put("message", product);
		return ResponseEntity.ok(jsonResult);
	}
	
	@RequestMapping(value = { "/ajax/delete-cart" }, method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> deleteCartAjax(final ModelMap model, final HttpServletRequest request,
			final HttpServletResponse response, final @RequestBody Product product) throws IOException {
		Map<String, Object> jsonResult = new HashMap<String, Object>();
		HttpSession session = request.getSession();
		Cart cart = (Cart) session.getAttribute("cart");
		List<CartItem> listItems = cart.getItem();
		for (int i = 0; i < listItems.size(); i++) {
			if (listItems.get(i).getProduct().getId() == product.getId()) {
				listItems.remove(i);
			}
		}
		session.setAttribute("cart", cart);
		jsonResult.put("code", 200);
		jsonResult.put("message", product);
		return ResponseEntity.ok(jsonResult);
	}
	
	@RequestMapping(value = { "/sign-up-form" }, method = RequestMethod.GET)
	public String SignupForm(final ModelMap model, final HttpServletRequest request, final HttpServletResponse response)
			throws IOException {
		User user = new User();
		model.addAttribute("sign-up", user);
		return "customer/sign-up-form";
	}
	
	@RequestMapping(value = { "/sign-up" }, method = RequestMethod.POST)
	public String doLogin(final ModelMap model, final HttpServletRequest request, final HttpServletResponse response,
			final @ModelAttribute("sign-up") User user)
			throws IOException {
		Login_DAO lDao = new Login_DAO();
		User check = lDao.checkUser(user.getUsername());
		if (check != null) {
			model.addAttribute("mess", "This username is already used!");
			return "customer/sign-up-form";
		} else {
			lDao.addUser(user);
			User log = lDao.userSignIn(user.getUsername(), user.getPassword());
			HttpSession session = request.getSession();
			session.setAttribute("account", log);
			return home(model, request, response);
		}
	}
	
	@RequestMapping(value = { "/search" }, method = RequestMethod.GET)
	public String doSearch(final ModelMap model, final HttpServletRequest request, final HttpServletResponse response)
			throws IOException {
		String search = request.getParameter("search");
		DAO dao = new DAO();
		ArrayList<Product> sList = dao.searchResult(search);
		model.addAttribute("sList", sList);
		return "customer/result";
	}
	
	
}
