<%@ page contentType="text/html; charset=utf-8" %>
<%@ include file ="postgresConn.jsp" %>

<%
String searchT = request.getParameter("t");
try {
  String s_Query = "";
  s_Query += ""
          + " select \"cusnum\", \"npsnm\", \"nstadr\", \"lat\", \"lng\", \"status\" "
          + " from gis_customer "
          + " where npsnm like '%"+searchT+"%'"
          + " order by \"cusnum\"";
  pstmt = conn.prepareStatement(s_Query);
  rs = pstmt.executeQuery();
  while (rs.next()) {
    out.print(rs.getString("cusnum") + "|" + rs.getString("npsnm") + "|" + rs.getString("nstadr") + "|" 
            + rs.getString("lat") + "|" + rs.getString("lng") + "|" + rs.getString("status") + "//");
  }
} catch (Exception e) {
  out.println("ERROR : " + e.toString());
}
if (rs != null) rs.close();
if (pstmt != null) pstmt.close();
if (conn != null) conn.close();
%>
