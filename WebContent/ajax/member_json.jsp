<%@page import="org.json.simple.JSONObject"%>
<%@ page contentType = "application/json;charset=utf-8"%>
<%@ page import="org.json.simple.JSONArray" %>
<% 
JSONObject jsonObj = new JSONObject();
JSONArray jsonArray = new JSONArray();

JSONObject item1 = new JSONObject();
item1.put("name","서봉석");
item1.put("clubid","sfsfs");

JSONObject item2 = new JSONObject();
item2.put("name","서봉석");
item2.put("clubid","sfsfs");

JSONObject item3 = new JSONObject();
item3.put("name","서봉석");
item3.put("clubid","sfsfs");


jsonArray.add(item1);
jsonArray.add(item2);
jsonArray.add(item3);

jsonObj.put("cafelist",jsonArray);
out.print(jsonObj.toString());
%>

