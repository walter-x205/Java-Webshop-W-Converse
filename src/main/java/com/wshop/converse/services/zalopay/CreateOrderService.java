package com.wshop.converse.services.zalopay;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.TimeZone;
import java.util.UUID;

import org.apache.http.NameValuePair;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.message.BasicNameValuePair;
import org.json.JSONObject;

import vn.zalopay.crypto.HMACUtil;


public class CreateOrderService {
 private static Map<String, String> config = new HashMap<String, String>(){{
     put("appid", "2554");
     put("key1", "sdngKKJmqEMzvh5QQcdD2A9XBSKUNaYn");
     put("key2", "trMrHtvjo6myautxDUiAcYsVtaeQ8nhf");
     put("endpoint", "https://sandbox.zalopay.com.vn/v001/tpe/createorder");
 }};

 public static String getCurrentTimeString(String format) {
     Calendar cal = new GregorianCalendar(TimeZone.getTimeZone("GMT+7"));
     SimpleDateFormat fmt = new SimpleDateFormat(format);
     fmt.setCalendar(cal);
     return fmt.format(cal.getTimeInMillis());
 }

 public static String call(OrderItem[] items, int amount, String appUser) throws ClientProtocolException, IOException {
	 final Map embeddata = new HashMap(){{
         put("merchantinfo", "embeddata123");
     }};

     Map<String, Object> order = new HashMap<String, Object>(){{
         put("appid", config.get("appid"));
         put("apptransid", getCurrentTimeString("yyMMdd") +"_"+ UUID.randomUUID()); // mã giao dich có định dạng yyMMdd_xxxx
         put("apptime", System.currentTimeMillis()); // miliseconds
         put("appuser", appUser);
         put("amount", amount);
         put("description", "ZaloPay Intergration Demo");
         put("bankcode", "zalopayapp");
         put("item", new JSONObject(OrderItem.toMapArray(items)).toString());
         put("embeddata", new JSONObject(embeddata).toString());
     }};

     // appid +”|”+ apptransid +”|”+ appuser +”|”+ amount +"|" + apptime +”|”+ embeddata +"|" +item
     String data = order.get("appid") +"|"+ order.get("apptransid") +"|"+ order.get("appuser") +"|"+ order.get("amount")
             +"|"+ order.get("apptime") +"|"+ order.get("embeddata") +"|"+ order.get("item");
     order.put("mac", HMACUtil.HMacHexStringEncode(HMACUtil.HMACSHA256, config.get("key1"), data));

     CloseableHttpClient client = HttpClients.createDefault();
     HttpPost post = new HttpPost(config.get("endpoint"));

     List<NameValuePair> params = new ArrayList<>();
     for (Map.Entry<String, Object> e : order.entrySet()) {
         params.add(new BasicNameValuePair(e.getKey(), e.getValue().toString()));
     }

     // Content-Type: application/x-www-form-urlencoded
     post.setEntity(new UrlEncodedFormEntity(params));

     CloseableHttpResponse res = client.execute(post);
     BufferedReader rd = new BufferedReader(new InputStreamReader(res.getEntity().getContent()));
     StringBuilder resultJsonStr = new StringBuilder();
     String line;

     while ((line = rd.readLine()) != null) {
         resultJsonStr.append(line);
     }

     JSONObject result = new JSONObject(resultJsonStr.toString());
     Map resultMap = result.toMap();
     
     return (String) resultMap.get("orderurl");
 }
}