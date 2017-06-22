
<%@page import="java.util.Set"%>
<%@page import="java.util.HashSet"%>
<%@page import="java.util.Map"%>
<%@page import="java.io.IOException"%>
<%@page import="de.beinlich.markus.pizzaservice.model.*"%>
<%@page import="de.beinlich.markus.pizzaservice.controller.OrderPizza"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="orderPizza" scope="session" class="de.beinlich.markus.pizzaservice.controller.OrderPizza" />
<jsp:useBean id="menuPizza" scope="application" class="de.beinlich.markus.pizzaservice.controller.MenuPizza" />
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Pizza</title>
    </head>
    <body>
        <form name="orderForm" action="<%=request.getContextPath()%>/steuerung/fuellen.jsp" method="get">
            <h1>PIZZA</h1>

            <table> 
                <%
                    int i = 0;
                    int quantity;
                    for (MenuItem menuItem : menuPizza.getMenu().getMenu()) {
                        out.print("<tr>");
                        out.println("<td>" + menuItem.getName() + "</td> ");
                        out.println("<td>" + menuItem.getDescription() + "</td> ");
                        out.println("<td>" + menuItem.getPrice() + "</td> ");
                        quantity = orderPizza.getOrder().getOrderEntryQuantity(menuItem);
                        out.println("<td>" + "<select  name = \"number_" + i++ + "\"> "
                                + "<option>0</option>"
                                + ((quantity == 1) ? "<option selected>1</option>" : "<option>1</option>")
                                + ((quantity == 2) ? "<option selected>2</option>" : "<option>2</option>")
                                + "</select>" + "</td> ");
                        out.print("</tr>");
                    }
                %>

            </table>
            <input type="submit" value="berechnen" />
        </form>
        <h2> Bestellung: </h2>
        <table>
            <%
                orderPizza.setIpAndSession(request);
                for (Map.Entry<MenuItem, OrderEntry> orderEntry : orderPizza.getOrder().getOrderEntries().entrySet()) {
                    out.print("<tr>");
                    out.print("<td>" + orderEntry.getKey().getName() + "</td> "
                            + "<td>" + orderEntry.getValue().getQuantity() + "</td> "
                            + "<td>" + orderEntry.getValue().getPrice() + "</td> ");
                    out.print("</tr>");
                };

            %> 
        </table>
        <%   if (orderPizza.getOrder().getOrderEntries().size() != 0) {
                out.print("<br/>" + "Summe: " + orderPizza.getOrder().getAmount());
        %>  
        <br/>
        <a href="<%=request.getContextPath()%>/kundendaten.jsp">Bestellen</a>
        <form id="del" action="<%=request.getContextPath()%>/steuerung/delete.jsp">
            <input type="submit" value="zurücksetzen" />
        </form>

        <%
                out.print("<br/>" + "<br/>" + "IP-Adresse: " + orderPizza.getIpAddress() + " Session: " + orderPizza.getSessionId());
                Set<String> hitCounter = (HashSet)application.getAttribute("hitCounter");
                if (hitCounter == null) {
                    hitCounter = new HashSet<String>();
                }
                hitCounter.add(orderPizza.getSessionId());
                application.setAttribute("hitCounter", hitCounter);
                out.print("Visits: " + ((Set)application.getAttribute("hitCounter")).size());
            }%>
    </body>
</html>
