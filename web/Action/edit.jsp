<%-- 
    Document   : index
    Created on : Nov 18, 2016, 10:06:11 PM
    Author     : tuan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.sql.ResultSet"%>
<%@page import="connect.Controller"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        

<c:set var="root" value="${pageContext.request.contextPath}"/>
<link href="${root}/resources/css/mos-style.css" rel='stylesheet' type='text/css' />

        
    </head>
    <body>
        <jsp:include page="../admin/header.jsp"></jsp:include>
        
        <div id="wrapper">
        <jsp:include page="../admin/menu.jsp"></jsp:include>
       <div id="rightContent">
	        <h1>Staff's Info Manage</h1>
	
	<div class="informasi">
	ini adalah notifikasi pertanda informasi
	</div>
	
	<div class="gagal">
	ini adalah notifikasi pertanda gagal
	</div>
	
	<div class="sukses">
	ini adalah notifikasi pertanda sukses
	</div>
        <h1>Edit this Category's information</h1>

        <%
            String cid = (request.getParameter("cid"));

            String query = "select * from category where categoryid = " + cid;

            ResultSet rs = Controller.queryExecute(query);

            String cname = "";
            String bid ="";
            if (rs.next()) {
                cname = rs.getString("cname");
                bid = rs.getString("bid");
                
            }
            cname = "'" + cname + "'";
            bid = "'" + bid + "'";
            
            rs.close();
        %>

        <form method="post" action="update.jsp">
            <table>
                <tr>
                    <td>Category ID</td>
                    <td>
                        <input type="text" name="cid" value=<%=cid%> >
                    </td>
                </tr>
                <tr>
                    <td>Category Name</td>
                    <td>
                        <input type="text" name="cname" value=<%=cname%> >
                    </td>
                </tr>
                <tr>
                    <td>Brand ID</td>
                    <td>
                        <input type="text" name="bid" value=<%=bid%> >
                    </td>
                </tr>
                <tr>
                    <td>
                        <input type="submit" name="s3" value="Edit">
                    </td>
                    <td>
                        <input type="button" onclick="location.href='../admin/manageCategory.jsp';" value="Cancel" />
                    </td>
                </tr>
            </table>
        </form>        
        <br>
        <hr>
	</div>
        <div class="clear"></div>
        <jsp:include page="../admin/footer.jsp"></jsp:include>
        </div>
    </body>
</html>