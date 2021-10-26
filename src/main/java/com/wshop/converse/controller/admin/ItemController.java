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

import com.wshop.converse.StartServer;
import com.wshop.converse.db_connect.DAO;
import com.wshop.converse.db_connect.Product;
import com.wshop.converse.dto.AddItemModel;

@Controller
public class ItemController {

	@RequestMapping(value = { "/add-item" }, method = RequestMethod.GET)
	public String addItem(final ModelMap model, final HttpServletRequest request, final HttpServletResponse response)
			throws IOException {
		AddItemModel itemModel = new AddItemModel();
		model.addAttribute("addItem", itemModel);
		return "admin/add-item";
	}

//	@RequestMapping(value = { "/add-item" }, method = RequestMethod.POST)
//	public String addItemModel(final ModelMap model, final HttpServletRequest request,
//			final HttpServletResponse response, @ModelAttribute("addItem") AddItemModel itemModel) throws IOException {
//		model.addAttribute("addItem", itemModel);
//		model.addAttribute("dataSubmit",
//				"Thêm thành công mặt hàng \n" + itemModel.getName() + "\n" + itemModel.getSKU());
//		return "admin/add-item";
//	}

	@RequestMapping(value = { "/ajax/add-item" }, method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> addItemAjax(final ModelMap model, final HttpServletRequest request,
			final HttpServletResponse response, final @RequestBody AddItemModel itemModel) throws IOException {
		Map<String, Object> jsonResult = new HashMap<String, Object>();
		DAO dao = new DAO();
		dao.addProduct(itemModel);
		jsonResult.put("code", 200);
		jsonResult.put("message", itemModel);
		return ResponseEntity.ok(jsonResult);
	}
	
	@RequestMapping(value = { "/list-item" }, method = RequestMethod.GET)
	public String listItem(final ModelMap model, final HttpServletRequest request, final HttpServletResponse response)
			throws IOException {
		DAO dao = new DAO();
		ArrayList<Product> list = dao.getAllProduct();
		model.addAttribute("pList", list);
		return "admin/list-item";
	}
	
	@RequestMapping(value = { "/ajax/edit-product" }, method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> editItemAjax(final ModelMap model, final HttpServletRequest request,
			final HttpServletResponse response, final @RequestBody Product product) throws IOException {
		Map<String, Object> jsonResult = new HashMap<String, Object>();
		DAO dao = new DAO();
		dao.editProduct(product);
		jsonResult.put("code", 200);
		jsonResult.put("message", product);
		return ResponseEntity.ok(jsonResult);
	}
	
	@RequestMapping(value = { "/delete-item" }, method = RequestMethod.GET)
	public String deleteProduct(final ModelMap model, final HttpServletRequest request,
			final HttpServletResponse response) throws IOException {
		String id = request.getParameter("id");
		DAO dao = new DAO();
		dao.deleteProduct(id);
		ArrayList<Product> list = dao.getAllProduct();
		model.addAttribute("pList", list);
		return "admin/list-item";

	}
}
