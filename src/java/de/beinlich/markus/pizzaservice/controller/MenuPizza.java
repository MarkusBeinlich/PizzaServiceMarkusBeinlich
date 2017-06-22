package de.beinlich.markus.pizzaservice.controller;

import de.beinlich.markus.pizzaservice.model.Menu;

/**
 *
 * @author Markus Beinlich
 */
public class MenuPizza {
    private Menu menu;

    public MenuPizza() {
        this.menu = new Menu();
    }

    public Menu getMenu() {
        return menu;
    }

    public void setMenu(Menu menu) {
        this.menu = menu;
    }
}
