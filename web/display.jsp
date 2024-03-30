<%-- 
    Document   : display
    Created on : Mar 28, 2024, 9:33:11 AM
    Author     : st
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            try{
            Connection con = null;
            PreparedStatement ps = null;
            ResultSet rs =null;
            HttpSession ssn = request.getSession();
            
                Class.forName("com.mysql.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/darshan_14","root","");
                
                String mname = (String) request.getParameter("mname");
                
                ps = con.prepareStatement("select * from medicine where medicine_name=?");
                ps.setString(1,mname);
                rs = ps.executeQuery();
                
                
                                    
        %>
        <table border="1">
            <tr>
                <td>id</td><td>medicine_name</td><td>medicine_detail</td><td>manufacturer_name</td><td>batch_no</td><td>manufacturing_month_year</td><td>expiring_month_year</td>
            </tr>
            <tr>
            <%
                while(rs.next()){
            %>
            <td><% out.println(rs.getInt("id"));%></td>
            <td><% out.println(rs.getString("medicine_name"));%></td>
            <td><% out.println(rs.getString("medicine_detail"));%></td>
            <td><% out.println(rs.getString("manufacturer_name"));%></td>
            <td><% out.println(rs.getString("batch_no"));%></td>
            <td><% out.println(rs.getDate("manufacturing_month_year"));%></td>
            <td><% out.println(rs.getDate("expiring_month_year"));}%></td>
            
        
        
        </table>
        <%
            }catch(Exception e){
                e.printStackTrace();
            }
        %>
        
    </body>
</html>
