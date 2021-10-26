package com.wshop.converse.controller.admin;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.wshop.converse.db_connect.Admin_DAO;
import com.wshop.converse.db_connect.homepage.HomeProductDAO;
import com.wshop.converse.db_connect.homepage.Payment;


@Controller
public class CountingController {
	
	@RequestMapping(value = { "/counting" }, method = RequestMethod.GET)
	public String countingPage(final ModelMap model, final HttpServletRequest request,
			final HttpServletResponse response) throws IOException {
		HomeProductDAO hDao = new HomeProductDAO();
		int num = hDao.getPaymentNumberToday();
		model.addAttribute("num", num);
		int shippingNum = hDao.getPaymentShippingNumberToday();
		int shippedNum = hDao.getPaymentShippedNumberToday();
		model.addAttribute("shipping", shippingNum);
		model.addAttribute("shipped", shippedNum);
		int totalMonth = 0;
		int totalGet = 0;
		ArrayList<Payment> showAllPayment = new ArrayList<Payment>();
		showAllPayment = hDao.getAllPaymentToday();
		ArrayList<Payment> showAllPaymentMonth = hDao.getAllPaymentThisMonth();
		for (Payment payment : showAllPayment) {
			if (payment.getStatus() == 1) {
				totalGet = totalGet + payment.getAmount();
			}
			
		}
		for (Payment paymentM : showAllPaymentMonth) {
			if (paymentM.getStatus() == 1) {
				totalMonth += paymentM.getAmount();
			}
		}
		Payment cur = new Payment();
		model.addAttribute("totalMonth", totalMonth);
		model.addAttribute("showAllMonth", showAllPaymentMonth);
		model.addAttribute("currency", cur);
		model.addAttribute("total", totalGet);
		model.addAttribute("showAll", showAllPayment);
		return "admin/counting";

	}
	
	@RequestMapping(value = { "/countTime" }, method = RequestMethod.GET)
	public String countTime(final ModelMap model, final HttpServletRequest request,
			final HttpServletResponse response) throws IOException {
		String start = request.getParameter("Start-date");
		String end = request.getParameter("End-date");
		Admin_DAO aDao = new Admin_DAO();
		ArrayList<Payment> showPayments = new ArrayList<Payment>();
		showPayments = aDao.getPaymentByTime(start, end);
		int totalGet = 0;
		for (Payment payment : showPayments) {
			totalGet = totalGet + payment.getAmount();
		}
		model.addAttribute("totalTime", totalGet);
		model.addAttribute("pByTime", showPayments);
		model.addAttribute("keepStart", start);
		model.addAttribute("keepEnd", end);
		return countingPage(model, request, response);

	}
	
}
