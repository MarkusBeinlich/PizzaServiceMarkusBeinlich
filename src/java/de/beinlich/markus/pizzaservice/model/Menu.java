package de.beinlich.markus.pizzaservice.model;

import de.beinlich.markus.pizzaservice.dao.*;
import java.util.List;


public class Menu {

    private List<MenuItem> menu;

    public Menu() {
        if (menu == null) {
            DaoMenu daoMenu = new DaoMenu();
            menu = daoMenu.getMenu();
        }
    }

    public List<MenuItem> getMenu() {
        return menu;
    }

    public void setMenu(List<MenuItem> menu) {
        this.menu = menu;
    }

    public static void main(String[] args) {
        Menu m = new Menu();
        for (MenuItem mItem : m.getMenu()) {
            System.out.println(" " + mItem.getName());
        }

    }
}
