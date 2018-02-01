/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 *
 * @author CHINNAM
 */

package com.nbad.db;

import murach.util.*;
import com.nbad.domain.*;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.ResultSet;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.ArrayList;
import java.util.*;

public class PetstoreDAO {

    ConnectionPool cp = ConnectionPool.getInstance();
    Connection con = cp.getConnection();

    public String registerUser(Customer customer) {
        String cusID="";
        try {
            String query = "insert into login (pswd, first_name, last_name, contact_no, address,  card_no)"            
                    + "values(?,?,?,?,?,?)";
            try {
                
                PreparedStatement statement = con.prepareStatement(query);
                statement.setString(1, customer.getPassword());
                statement.setString(2, customer.getFirstName());
                statement.setString(3, customer.getLastName());
                statement.setString(4, customer.getContactNumber());
                statement.setString(5, customer.getAddress());
                statement.setString(6, customer.getCreditCardno());
                statement.executeUpdate();
                
            } catch (SQLException ex) {
                Logger.getLogger(PetstoreDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
            query="select max(custid) from login";
            PreparedStatement statement = con.prepareStatement(query);
            ResultSet rs=statement.executeQuery();
            while(rs.next()){
             cusID=rs.getString(1);
            }
        } catch (SQLException ex) {
            Logger.getLogger(PetstoreDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return cusID;
    }

    public String validateUser(String custID, String password) {
        //PasswordUtil passwordUtil=new PasswordUtil();
        try {
            String query = "select pswd, first_name, last_name, contact_no, address, card_no from login where custid=?";

            PreparedStatement statement = con.prepareStatement(query);

            statement.setString(1, custID);

            ResultSet res = statement.executeQuery();
            if (res != null) {
                String pass = "";
                String hashPass = "";
                String hashPassword = PasswordUtil.hashPassword(password);
                while (res.next()) {
                    Customer customer = new Customer();
                    customer.setCustId("custid");
                    pass = res.getString("pswd");
                    hashPass = PasswordUtil.hashPassword(pass);
                    customer.setAddress(res.getString("address"));
                    customer.setContactNumber(res.getString("contact_no"));
                    customer.setCreditCardno(res.getString("card_no"));
                    System.out.println("The db password for the user entered is " + pass);
                }
                if (hashPassword.equals(hashPass)) {

                    if (custID.equals("1000")) {
                        return "admin_login";
                    }

                    return "login_successfull";

                } else {

                    return "invalid_password";
                }

            }
        } catch (SQLException ex) {
            Logger.getLogger(PetstoreDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (NoSuchAlgorithmException ex) {
            Logger.getLogger(PetstoreDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return "invalid_customer";
    }

    public String getUserName(String custID) {
        String cusName = "";
        try {
            String query = "select first_name, last_name from login where custid=?";

            PreparedStatement statement = con.prepareStatement(query);

            statement.setString(1, custID);

            ResultSet res = statement.executeQuery();
            if (res != null) {
                while (res.next()) {
                    cusName = res.getString("first_name") + " " + res.getString("last_name");
                }

            }
        } catch (SQLException ex) {
            Logger.getLogger(PetstoreDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return cusName;
    }

    public List<Product> getProducts(int catId) {

        ArrayList<Product> productList = new ArrayList<Product>();
        try {
            String query = "select prod_id,cat_id,prod_name,prod_desc from product where cat_id=?";

            PreparedStatement statement = con.prepareStatement(query);

            statement.setInt(1, catId);

            ResultSet res = statement.executeQuery();
            if (res != null) {
                while (res.next()) {
                    Product product = new Product();
                    product.setCategoryId(res.getInt("cat_id"));
                    product.setProductDescription(res.getString("prod_desc"));
                    product.setProductId(res.getInt("prod_id"));
                    product.setProductName(res.getString("prod_name"));
                    productList.add(product);
                }
            }

        } catch (SQLException ex) {
            Logger.getLogger(PetstoreDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return productList;
    }
    public ArrayList<Item> getSelProdItems(ArrayList<String> prodList) {
        ArrayList<Item> itemList = new ArrayList<Item>();
        try {
            StringBuilder builder = new StringBuilder();
            for (int i = 0; i < prodList.size(); i++) {
                builder.append("?,");
                System.out.println("Inside the loop");
                System.out.println(builder.toString());
            }
            String query = "select item_id, prod_id, cat_id, item_name, item_desc, price from product_line_items where prod_id in (" + builder.deleteCharAt(builder.length() - 1).toString() + ")";;

            PreparedStatement statement = con.prepareStatement(query);

            int index = 1;
            for (String prod : prodList) {
                statement.setString(index++, prod);
            }

            ResultSet res = statement.executeQuery();
            if (res != null) {
                while (res.next()) {
                    System.out.println("In the loop!@!!!!");
                    Item item = new Item();
                    item.setCategoryId(res.getInt("cat_id"));
                    item.setItemDescription(res.getString("item_desc"));
                    item.setItemId(res.getInt("item_id"));
                    item.setItemName(res.getString("item_name"));
                    item.setPrice(res.getFloat("price"));
                    item.setProductId(res.getInt("prod_id"));
                    itemList.add(item);
                }
            }

        } catch (SQLException ex) {
            Logger.getLogger(PetstoreDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return itemList;

    }

    /*public ArrayList<Item> getSelProdItems(String selProd) {
        ArrayList<Item> itemList = new ArrayList<Item>();
        try {
            String query = "select item_id, prod_id, cat_id, item_name, item_desc, price from product_line_items where prod_id in (?)";

            PreparedStatement statement = con.prepareStatement(query);

            statement.setString(1, selProd);

            ResultSet res = statement.executeQuery();
            if (res != null) {
                while (res.next()) {
                    System.out.println("In the loop!@!!!!");
                    Item item = new Item();
                    item.setCategoryId(res.getInt("cat_id"));
                    item.setItemDescription(res.getString("item_desc"));
                    item.setItemId(res.getInt("item_id"));
                    item.setItemName(res.getString("item_name"));
                    item.setPrice(res.getFloat("price"));
                    item.setProductId(res.getInt("prod_id"));
                    itemList.add(item);
                }
            }

        } catch (SQLException ex) {
            Logger.getLogger(PetstoreDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return itemList;

    }*/

    public ArrayList<Item> getCartItems(String selItems) {
        ArrayList<Item> itemList = new ArrayList<Item>();
        try {
            String query = "select item_id, prod_id, cat_id, item_name, item_desc, price from product_line_items where item_id in (" + selItems + ")";

            PreparedStatement statement = con.prepareStatement(query);

            //statement.setString(1, selItems);
            ResultSet res = statement.executeQuery();

            //ResultSet res = statement.executeQuery();
            if (res != null) {
                while (res.next()) {
                    System.out.println("In the loop!!!!");
                    Item item = new Item();
                    item.setCategoryId(res.getInt("cat_id"));
                    item.setItemDescription(res.getString("item_desc"));
                    item.setItemId(res.getInt("item_id"));
                    item.setItemName(res.getString("item_name"));
                    item.setPrice(res.getFloat("price"));
                    item.setProductId(res.getInt("prod_id"));
                    itemList.add(item);
                    System.out.println("Added Items are " + itemList.size());
                }
            }

        } catch (SQLException ex) {
            Logger.getLogger(PetstoreDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return itemList;

    }//

    public float purchase(ArrayList<CartItem> cartItemList, int cusId) {

        float total = 0;
        try {
            System.out.println("The item------------** is assigned here!!!!!!!!" + cartItemList.isEmpty());
            System.out.println("com.nbad.db..purchase()" + cusId);
            String query = "insert into purchase_detail(itemid,prod_id,categid,quantity,custid) values(?,?,?,?,?)";
            PreparedStatement statement = con.prepareStatement(query);
            for (int i = 0; i < cartItemList.size(); i++) {
                CartItem cartItem = cartItemList.get(i);
                int itemId = cartItem.getItem().getItemId();
                int prodId = cartItem.getItem().getProductId();
                int catId = cartItem.getItem().getCategoryId();
                int quantity = cartItem.getQuantity();
                statement.setInt(1, itemId);
                statement.setInt(2, prodId);
                statement.setInt(3, catId);
                // statement.setInt(4, itemId);
                statement.setInt(4, quantity);
                statement.setInt(5, cusId);
                statement.executeUpdate();
                total = total + (cartItem.getItem().getPrice()*cartItem.getQuantity());

            }

            //statement.setString(1, s
        } catch (SQLException ex) {
            Logger.getLogger(PetstoreDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return total;
    }

    public void updatePrice(ArrayList<Integer> productIds, ArrayList<Float> prices) {
        try {
            String query = "update  product_line_items set price=? where item_id=?";
            Iterator<Integer> it = productIds.iterator();
            Iterator<Float> it2 = prices.iterator();
            PreparedStatement statement = con.prepareStatement(query);
            while (it.hasNext()) {
                statement.setInt(2, it.next());
                statement.setFloat(1, it2.next());
                statement.executeUpdate();
            }
        } catch (SQLException ex) {
            Logger.getLogger(PetstoreDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public List<Item> getAllItems() {
        List<Item> itemList = new ArrayList<Item>();
        try {
            String query = "select item_id,prod_id,cat_id,item_name,item_desc,price from product_line_items";
            PreparedStatement statement = con.prepareStatement(query);
            ResultSet resultSet = statement.executeQuery();
            if (resultSet != null) {
                while (resultSet.next()) {
                    Item item = new Item();
                    item.setCategoryId(resultSet.getInt("cat_id"));
                    item.setItemDescription(resultSet.getString("item_desc"));
                    item.setItemId(resultSet.getInt("item_id"));
                    item.setItemName(resultSet.getString("item_name"));
                    item.setPrice(resultSet.getFloat("price"));
                    item.setProductId(resultSet.getInt("prod_id"));
                    itemList.add(item);

                }

            }

            // return itemList;
        } catch (SQLException ex) {
            Logger.getLogger(PetstoreDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return itemList;
    }

    public String getOrderID() {
        String orderID = "";
        try {
            String query = "select max(orderid) from purchase_detail";
            PreparedStatement statement = con.prepareStatement(query);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                orderID = resultSet.getString("orderid");
            }

        } catch (SQLException ex) {
            Logger.getLogger(PetstoreDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return orderID;

    }

}
