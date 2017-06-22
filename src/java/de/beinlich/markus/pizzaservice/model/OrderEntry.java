package de.beinlich.markus.pizzaservice.model;

import java.math.BigDecimal;

/**
 *
 * @author Markus Beinlich
 */
public class OrderEntry {

    private MenuItem menuItem;
    private int quantity;

    public OrderEntry(MenuItem menuItem, int quantity) {
        this.menuItem = menuItem;
        this.quantity = quantity;
    }

    public OrderEntry() {
    }

    public MenuItem getMenuItem() {
        return menuItem;
    }

    public void setMenuItem(MenuItem menuItem) {
        this.menuItem = menuItem;
    }

    public int getQuantity() {
        return quantity;
    }

    public BigDecimal getPrice() {
        return menuItem.getPrice().multiply(new BigDecimal(quantity));
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

}
