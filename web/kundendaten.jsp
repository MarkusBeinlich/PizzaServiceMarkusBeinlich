<%-- 
    Document   : kundendaten
    Created on : 04.07.2014, 08:35:25
    Author     : Schulung
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="zusammenfassung.jsp">
           Vorname: <input type="text" name="firstName" value="" /><br />
           Nachname:<input type="text" name="lastName" value="" /><br />
            Email<input type="text" name="email" value="" /><br />
           <input type="submit" value="Weiter" />
        </form>
    </body>
</html>
