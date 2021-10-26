package com.wshop.converse.controller.admin;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.wshop.converse.db_connect.Admin;
import com.wshop.converse.db_connect.DAO;
import com.wshop.converse.db_connect.Product;
import com.wshop.converse.db_connect.User;
import com.wshop.converse.db_connect.homepage.HomeProductDAO;
import com.wshop.converse.db_connect.homepage.Orders;
import com.wshop.converse.db_connect.homepage.Payment;
import com.wshop.converse.dto.AddItemModel;
import com.wshop.converse.dto.Login_DAO;
import com.wshop.converse.dto.SignIn;

@Controller
public class AdIndexController {

	@RequestMapping(value = { "/ad-index" }, method = RequestMethod.GET)
	public String adminHomepage(final ModelMap model, final HttpServletRequest request,
			final HttpServletResponse response) throws IOException {
		SignIn login = new SignIn();
		model.addAttribute("admin-login", login);
		return "admin/ad-index";

	}
	
	@RequestMapping(value = { "/ad-login" }, method = RequestMethod.POST)
	public String doAdLogin(final ModelMap model, final HttpServletRequest request, final HttpServletResponse response,
			final @ModelAttribute("admin-login") SignIn login)
			throws IOException {
		model.addAttribute("admin-login", login);
		Login_DAO ldao = new Login_DAO();
		Admin log = new Admin();
		log = ldao.adminSignIn(login.getUsername(), login.getPassword());
		if (log == null) {
			model.addAttribute("mess", "Username or Password is not correct");
			return adminHomepage(model, request, response);
		} else {
			HttpSession session = request.getSession();
			session.setAttribute("admin", log);
			return "admin/ad-index";
		}
	}
	
	@RequestMapping(value = { "/ad-logout" }, method = RequestMethod.GET)
	public String doLogout(final ModelMap model, final HttpServletRequest request, final HttpServletResponse response)
			throws IOException {
		HttpSession session = request.getSession();
		session.removeAttribute("admin");
		return adminHomepage(model, request, response);
	}

	@RequestMapping(value = { "/load-edit" }, method = RequestMethod.GET)
	public String editProduct(final ModelMap model, final HttpServletRequest request,
			final HttpServletResponse response) throws IOException {
		Product itemModel = new Product();
		model.addAttribute("editItem", itemModel);
		String id = request.getParameter("id");
		DAO dao = new DAO();
		Product i = dao.getProductId(Integer.parseInt(id));
		model.addAttribute("detail", i);
		return "admin/load-edit";

	}
	
	@RequestMapping(value = { "/shipping" }, method = RequestMethod.GET)
	public String shippingList(final ModelMap model, final HttpServletRequest request, final HttpServletResponse response)
			throws IOException {
		ArrayList<Payment> showAllPayment = new ArrayList<Payment>();
		HomeProductDAO hDao = new HomeProductDAO();
		showAllPayment = hDao.getAllPayment();
		DAO dao = new DAO();
		for (Payment payment : showAllPayment) {
			ArrayList<Orders> listOrders = hDao.getOrdersByPid(payment.getId());
			ArrayList<String> show = new ArrayList<String>();
			for (int i = 0; i < listOrders.size(); i++) {
				show.add(listOrders.get(i).getQty() + "x " + dao.getProductId(listOrders.get(i).getProductId()).getName());
			}
			payment.setShowOrders(show);
		}
		model.addAttribute("showAll", showAllPayment);
		return "admin/shipping";
	}
	
	@RequestMapping(value = { "/change" }, method = RequestMethod.GET)
	public String changeStatus(final ModelMap model, final HttpServletRequest request,
			final HttpServletResponse response) throws IOException {
		String pid = request.getParameter("pid");
		HomeProductDAO hDao = new HomeProductDAO();
		hDao.changeStatus(pid);
		return shippingList(model, request, response);

	}
	
	@RequestMapping(value = { "/delete-payment" }, method = RequestMethod.GET)
	public String deletePayment(final ModelMap model, final HttpServletRequest request,
			final HttpServletResponse response) throws IOException {
		String pid = request.getParameter("pid");
		HomeProductDAO hDao = new HomeProductDAO();
		hDao.deletePayment(pid);
		return shippingList(model, request, response);

	}
	
	@RequestMapping(value = { "/shipped" }, method = RequestMethod.GET)
	public String shippedList(final ModelMap model, final HttpServletRequest request, final HttpServletResponse response)
			throws IOException {
		ArrayList<Payment> showAllPayment = new ArrayList<Payment>();
		HomeProductDAO hDao = new HomeProductDAO();
		showAllPayment = hDao.getAllPayment();
		DAO dao = new DAO();
		for (Payment payment : showAllPayment) {
			ArrayList<Orders> listOrders = hDao.getOrdersByPid(payment.getId());
			ArrayList<String> show = new ArrayList<String>();
			for (int i = 0; i < listOrders.size(); i++) {
				show.add(listOrders.get(i).getQty() + "x " + dao.getProductId(listOrders.get(i).getProductId()).getName());
			}
			payment.setShowOrders(show);
		}
		model.addAttribute("showAll", showAllPayment);
		return "admin/shipped";
	}
}
