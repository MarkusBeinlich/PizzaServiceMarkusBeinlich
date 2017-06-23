<%-- 
    Document   : zusammenfassung
    Created on : 04.07.2014, 08:40:52
    Author     : Schulung
--%>

<%@page import="java.util.HashSet"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.Map"%>
<%@page import="de.beinlich.markus.pizzaservice.model.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%--Temporärer Hilfsobjekt weil setProperty keine komplexen Dadentypen 
unterstützt, sonder nur String --%>
<jsp:useBean id="kunde" scope="page" class="de.beinlich.markus.pizzaservice.model.Customer" />
<jsp:useBean id="orderPizza" scope="session" class="de.beinlich.markus.pizzaservice.controller.OrderPizza" />
<!-- Sie können mit dem * alle Inputtmöglichkeiten in Html(durch FORM und Submit) eines vorherigen Request in die 
gleichnamigen Eigenschaften eines Objektes setzen -->
<jsp:setProperty name="kunde" property="*" />
<!-- Sie können mit SetProperty einzelne Eigenschaften eines Objektes ansprechen-->
<%--<jsp:setProperty name="kunde" property="email" value="<%=kunde.getFirstname()+"@"+kunde.getLastname()+".de" %>" />--%>
<%-- Wenn das Objekt existiert wird es mit Use-Bean geholt
ansonnsten mit der JavaAnweisungen an den SessionScope unter der Bedingung angelegt
    if(session.getAttribute("sessOrder")!=null){
    
}
    
--%>  
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Pizza</title>
    </head>
    <body>
        <%  //hier wird das temporäre Hilfsobject an die echte Bean übergeben, 
            //natürlich gefüllt
            //order.getKunde().setFirstname(request.getParameter("firstname"));
            //order.getKunde().setLastname(request.getParameter("lastname"));
            //order.getKunde().setEmail(request.getParameter("email"));
            orderPizza.setCustomer(kunde);
            System.out.println("oderPizza.save: ip-" + orderPizza.getIpAddress() + " session: " + orderPizza.getSessionId());
            orderPizza.save();
            Invoice invoice = orderPizza.getInvoice();

            out.print(invoice.getCustomer().getFirstName() + " " + invoice.getCustomer().getLastName() + " " + invoice.getCustomer().getEmail() + "<br/>");
        %>
        <h2> Rechnung: </h2>
        <table>
            <%
                for (OrderEntry orderEntry : invoice.getInvoiceEntries()) {
                    out.print("<tr>");
                    out.print("<td>" + orderEntry.getMenuItem().getName() + "</td> "
                            + "<td>" + orderEntry.getQuantity() + "</td> "
                            + "<td>" + orderEntry.getPrice() + "</td> ");
                    out.print("</tr>");
                };

            %> 
        </table>
        <%   if (orderPizza.getOrder().getOrderEntries().size() != 0) {
                out.print("<br/>" + "Summe: " + invoice.getInvoiceAmount());
                out.print("<br/>" + "<br/>" + "IP-Adresse: " + orderPizza.getIpAddress() + " Session: " + orderPizza.getSessionId());
            }%> 
        <br/>
        <a href="generate/myPdf.pdf" > zur pdf Bestellung</a> <br/>
        <a href="<%=request.getContextPath()%>/menu.jsp">Bestellen</a>
        <h2>Guten Appetit</h2>
    </body>
</html>
