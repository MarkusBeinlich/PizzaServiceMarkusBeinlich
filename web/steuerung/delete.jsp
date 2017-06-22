
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <jsp:useBean id="orderPizza" scope="session" class="de.beinlich.markus.pizzaservice.controller.OrderPizza" />
    <body>
        <h1>Seite Fuellen</h1>
        <%
            orderPizza.getOrder().getOrderEntries().clear();
            response.sendRedirect("../menu.jsp");
          %>  
    </body>
</html>
