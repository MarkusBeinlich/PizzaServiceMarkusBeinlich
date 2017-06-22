

<%@page import="java.util.Enumeration"%>
<%@page import="de.beinlich.markus.pizzaservice.model.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="orderPizza" scope="session" class="de.beinlich.markus.pizzaservice.controller.OrderPizza" />
<jsp:useBean id="menuPizza" scope="application" class="de.beinlich.markus.pizzaservice.controller.MenuPizza" />

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>

        <%

            int menuIndex = 0;
            int anz = 0;
            String parameterName;
            for (Enumeration<String> name = request.getParameterNames(); name.hasMoreElements();) {
                parameterName = name.nextElement();
                anz = Integer.parseInt(request.getParameter(parameterName));
                if (anz != 0) {
                    menuIndex = Integer.parseInt(parameterName.substring(parameterName.lastIndexOf("_")+1));
                    orderPizza.getOrder().addOrderEntry(new OrderEntry(menuPizza.getMenu().getMenu().get(menuIndex), anz));
                }
            }

        %> 
        <jsp:forward page="../menu.jsp" />
    </body>
</html>
