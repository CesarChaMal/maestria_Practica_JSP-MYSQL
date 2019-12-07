<%-- 
    Document   : show.jsp
    Created on : 31-ene-2009, 15:46:28
    Author     : USUARIO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import = "java.sql.*"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
<%
if(request.getParameter("id")!=null){
    Connection conn = null;
    String bd = "school";
    String login = "root";
    String password = "mysql";
//    String url = "jdbc:mysql://localhost/" + bd;
    String url = "jdbc:mysql://localhost:3306/" + bd + "?serverTimezone=UTC" ;

    try
    {
//       Class.forName("com.mysql.jdbc.Driver").newInstance();
       Class.forName("com.mysql.cj.jdbc.Driver").newInstance();

       conn = DriverManager.getConnection(url,login,password);
       ResultSet result = null;
       Statement stmt = conn.createStatement();
       String sql = "SELECT * FROM students s JOIN takes t ON s.sid=t.sid JOIN courses c ON t.courseid=c.courseid WHERE s.sid = '" + request.getParameter("id")+"'";

       result  = stmt.executeQuery(sql);
       
       out.println("student id&nbsp;&nbsp;&nbsp;name&nbsp;&nbsp;&nbsp;login&nbsp;&nbsp;&nbsp;age&nbsp;&nbsp;&nbsp;course id&nbsp;&nbsp;&nbsp;course name");
       out.println("<br>");
       out.println("<br>");
       for(;;){
           if(result.next()){
               out.println(result.getString("sid")+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+result.getString("name")+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+result.getString("login")+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+result.getString("age")+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+result.getString("courseid")+"&nbsp;&nbsp;&nbsp;&nbsp;"+result.getString("name"));
               out.println("<br>");
           }else
               break;
       }
    }
    catch(SQLException ex)
    {
       out.println(ex);
    }
    catch(ClassNotFoundException ex)
    {
       out.println(ex);
    }
}
%>
    </body>
</html>
