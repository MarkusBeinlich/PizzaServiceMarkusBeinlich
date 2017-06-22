package de.beinlich.markus.pizzaservice.controller;

import de.beinlich.markus.pizzaservice.model.Customer;
import de.beinlich.markus.pizzaservice.model.Order;
import de.beinlich.markus.pizzaservice.model.Invoice;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Markus Beinlich
 */
public class OrderPizza {

    private Customer customer;
    private Invoice invoice;
    private Order order;

    public OrderPizza() {
        customer = new Customer();
        invoice = new Invoice();
        order = new Order();
    }
    
    public void save() {
        System.out.println("OrderPizza - save");
        System.out.println("OrderPizza.save: ip-" + order.getIpAddress() + " session: " + order.getSessionId());
        customer.store();
        order.setCustomer(customer);
        order.store();
    }

    public void setIpAndSession(HttpServletRequest req) {
        order.setIpAddress(req.getRemoteAddr());
        HttpSession sess = req.getSession();
        order.setSessionId(sess.getId());
    }

    public Customer getCustomer() {
        return customer;
    }

    public void setCustomer(Customer customer) {
        this.customer = customer;
    }

    public Invoice getInvoice() {
        return new Invoice(customer, order);
    }

    public void setInvoice(Invoice invoice) {
        this.invoice = invoice;
    }

    public Order getOrder() {
        return order;
    }

    public void setOrder(Order order) {
        this.order = order;
    }

    public String getSessionId() {
        return order.getSessionId();
    }

    public void setSessionId(String sessionId) {
        order.setSessionId(sessionId);
    }

    public String getIpAddress() {
        return order.getIpAddress();
    }

    public void setIpAddress(String ipAddress) {
        order.setIpAddress(ipAddress);
    }

}
