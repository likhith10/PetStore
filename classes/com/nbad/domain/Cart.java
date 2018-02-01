/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.nbad.domain;

import java.util.ArrayList;

/**
 *
 * @author CHINNAM
 */
public class Cart {
private int orderId;
private String custId;
private ArrayList<CartItem> itemDetails = new ArrayList<CartItem>();

    /**
     * @return the orderId
     */
    public int getOrderId() {
        return orderId;
    }

    /**
     * @param orderId the orderId to set
     */
    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    /**
     * @return the custId
     */
    public String getCustId() {
        return custId;
    }

    /**
     * @param custId the custId to set
     */
    public void setCustId(String custId) {
        this.custId = custId;
    }

    /**
     * @return the itemDetails
     */
    public ArrayList<CartItem> getItemDetails() {
        return itemDetails;
    }

    /**
     * @param itemDetails the itemDetails to set
     */
    public void setItemDetails(ArrayList<CartItem> itemDetails) {
        this.itemDetails = itemDetails;
    }





    
}
