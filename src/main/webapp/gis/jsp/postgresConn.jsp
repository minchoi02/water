<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="javax.naming.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%
//Connection conn = null;
//DataSource ds  = null;
//PreparedStatement pstmt = null;
//ResultSet rs = null;

//final String DATASOUCE="java:comp/env/jdbc/monitor";

//InitialContext ic = new InitialContext();
//ds = (DataSource)ic.lookup(DATASOUCE);
//conn = ds.getConnection();*/

Connection conn=null;
PreparedStatement pstmt = null;
ResultSet rs = null;

  try{
	 String jdbcUrl = "jdbc:postgresql://1.221.187.76:15432/cmsdb";
     String dbId = "cmsmaster";
     String dbPass = "geometics!@";
	
	 Class.forName("org.postgresql.Driver");
	 conn = DriverManager.getConnection(jdbcUrl,dbId ,dbPass );
	 System.out.println("제대로 연결되었습니다.");
  }catch(Exception e){ 
	 e.printStackTrace();
  }


%>
