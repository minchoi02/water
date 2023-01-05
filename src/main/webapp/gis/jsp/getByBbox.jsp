<%@ page contentType="text/html; charset=utf-8" %>
<%@ include file ="postgresConn.jsp" %>

<%
String s_minX = request.getParameter("minX");
String s_minY = request.getParameter("minY");
String s_maxX = request.getParameter("maxX");
String s_maxY = request.getParameter("maxY");
try {
  String s_Query = "";
    s_Query += ""
            + " select \"cusnum\", \"npsnm\", \"nstadr\", \"lat\", \"lng\", \"status\" "
            + " from gis_customer "
            + " where (\"lng\" between "+ s_minX +" and "+ s_maxX +") and (\"lat\" between "+ s_minY +" and "+ s_maxY +")";
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
