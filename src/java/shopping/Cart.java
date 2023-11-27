/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package shopping;

import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author PHUC
 */
public class Cart {
        
    private Map<String, Integer> items;

    public Map<String, Integer> getItems() {
        return items;
    }

    public Cart() {
    }

    public Cart(Map<String, Integer> items) {
        this.items = items;
    }

    public void setItems(Map<String, Integer> items) {
        this.items = items;
    }

   
    
    public void addCart(String fruitId, int quantity) {
        if (this.items == null) {
            this.items = new HashMap<>();
        }//items are not existed
        //item are existed
        if(this.items.containsKey(fruitId)){
            quantity = this.items.get(fruitId) + quantity;
        }
        System.out.println(fruitId + " " + quantity);
        //update quantity in Map
        this.items.put(fruitId, quantity);
    }
    
    public void removeCart(String fruitId) {
        if(this.items==null) {
            return;
        }
        //item have existed
        if(this.items.containsKey(fruitId)) {
            this.items.remove(fruitId);
            if(this.items.isEmpty()) {
                this.items = null; //cancel cart
            }
        }
    }
}
