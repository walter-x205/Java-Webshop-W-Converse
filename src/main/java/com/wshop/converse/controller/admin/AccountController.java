package com.wshop.converse.controller.admin;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.wshop.converse.db_connect.Admin;
import com.wshop.converse.db_connect.Admin_DAO;
import com.wshop.converse.db_connect.DAO;
import com.wshop.converse.db_connect.Product;
import com.wshop.converse.db_connect.User;
import com.wshop.converse.dto.AddItemModel;

@Controller
public class AccountController {

	@RequestMapping(value = { "/list-admin" }, method = RequestMethod.GET)
	public String listAdmin(final ModelMap model, final HttpServletRequest request, final HttpServletResponse response)
			throws IOException {
		Admin_DAO dao = new Admin_DAO();
		ArrayList<Admin> list = dao.getAllAdmin();
		model.addAttribute("aList", list);
		return "admin/list-admin";
	}
	
	@RequestMapping(value = { "/list-user" }, method = RequestMethod.GET)
	public String listUser(final ModelMap model, final HttpServletRequest request, final HttpServletResponse response)
			throws IOException {
		Admin_DAO dao = new Admin_DAO();
		ArrayList<User> list = dao.getAllUser();
		model.addAttribute("uList", list);
		return "admin/list-user";
	}
	
	@RequestMapping(value = { "/edit-user-loadout" }, method = RequestMethod.GET)
	public String editUserLoadout(final ModelMap model, final HttpServletRequest request, final HttpServletResponse response)
			throws IOException {
		String id = request.getParameter("id");
		Admin_DAO dao = new Admin_DAO();
		User u = dao.getUserById(id);
		model.addAttribute("detail", u);
		return "admin/edit-user-loadout";
	}
	
	@RequestMapping(value = { "/ajax/edit-user" }, method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> editUser(final ModelMap model, final HttpServletRequest request,
			final HttpServletResponse response, final @RequestBody User user) throws IOException {
		Map<String, Object> jsonResult = new HashMap<String, Object>();
		Admin_DAO dao = new Admin_DAO();
		dao.editUser(user);
		jsonResult.put("code", 200);
		jsonResult.put("message", user);
		return ResponseEntity.ok(jsonResult);
	}
	
	@RequestMapping(value = { "/delete-user" }, method = RequestMethod.GET)
	public String deleteUser(final ModelMap model, final HttpServletRequest request,
			final HttpServletResponse response) throws IOException {
		String id = request.getParameter("id");
		Admin_DAO dao = new Admin_DAO();
		dao.deleteUser(id);
		ArrayList<User> list = dao.getAllUser();
		model.addAttribute("uList", list);
		return "admin/list-user";

	}
	
	@RequestMapping(value = { "/add-admin" }, method = RequestMethod.GET)
	public String addAdmin(final ModelMap model, final HttpServletRequest request, final HttpServletResponse response)
			throws IOException {
		Admin adminModel = new Admin();
		model.addAttribute("adminModel", adminModel);
		return "admin/add-admin";
	}
	
	@RequestMapping(value = { "/ajax/add-admin" }, method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> addAdminAjax(final ModelMap model, final HttpServletRequest request,
			final HttpServletResponse response, final @RequestBody Admin adminModel) throws IOException {
		Map<String, Object> jsonResult = new HashMap<String, Object>();
		Admin_DAO aDao = new Admin_DAO();
		aDao.addAdmin(adminModel);
		jsonResult.put("code", 200);
		jsonResult.put("message", adminModel);
		return ResponseEntity.ok(jsonResult);
	}
}
