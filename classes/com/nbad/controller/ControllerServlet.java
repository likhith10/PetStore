/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.nbad.controller;

import murach.email.MailUtil;
import com.nbad.db.PetstoreDAO;
import com.nbad.domain.CartItem;
import com.nbad.domain.Item;
import com.nbad.domain.Product;
import java.io.IOException;
import java.util.ArrayList;
import java.io.IOException;
import java.util.Iterator;
import java.util.*;
import javax.mail.MessagingException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;
import murach.util.MailUtilGmail;
import com.nbad.domain.Customer;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author CHINNAM
 */
public class ControllerServlet extends HttpServlet {

    ArrayList<Item> itemList2 = null;
    int cusId = 0;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("In the do Post method of the Servlet!!!!!!!!");
        PetstoreDAO dao = new PetstoreDAO();
        String[] list2 = null;
        String selProdItems2 = "";

        String url = request.getParameter("url");
        List<Product> productList = new ArrayList<Product>();
        if (url.equals("login")) {
            String cName = "";
            cName = request.getParameter("customerId");
            String password = "";
            password = request.getParameter("password");

            if (cName.isEmpty() || password.isEmpty()) {
                //String message="";
                System.out.println("In the if loop with empty strings!!!!");
                request.setAttribute("message", "Please fill all the details!!!");
                RequestDispatcher rd = getServletContext().getRequestDispatcher("/index.jsp");
                rd.forward(request, response);
                //rd.include(request, response);
            } else {
                //System.out.println("In the else loop");

                cusId = Integer.parseInt(cName);
                System.out.println("Cid=========" + cusId + "password===========" + password);
                String validation = dao.validateUser(cName, password);
                System.out.println(validation);
                if (validation.equals("login_successfull")) {

                    String display_Name = dao.getUserName(cName);

                    HttpSession session = request.getSession();
                    session.setAttribute("cName", display_Name);
                    session.setAttribute("cID", cusId);
                    RequestDispatcher rd = getServletContext().getRequestDispatcher("/category.jsp");
                    rd.forward(request, response);
                } else if (validation.equals("admin_login")) {
                    String display_Name = dao.getUserName(cName);

                    HttpSession session = request.getSession();
                    session.setAttribute("cName", display_Name);
                    session.setAttribute("cID", cusId);
                    List<Item> allItemList = dao.getAllItems();
                    request.setAttribute("Items", allItemList);
                    RequestDispatcher rd = getServletContext().getRequestDispatcher("/admin.jsp");
                    rd.forward(request, response);

                }
            }

        }
        if (url.equals("index_register")) {
            RequestDispatcher rd = getServletContext().getRequestDispatcher("/register.jsp");
            rd.forward(request, response);
        }
        if (url.equals("register_customer")) {
            String fName = request.getParameter("firstName");
            String lName = request.getParameter("lastName");
            String password = request.getParameter("password");
            String address = request.getParameter("address");
            String contactNumber = request.getParameter("phoneNumber");
            String cardNumber = request.getParameter("cardNumber");

            Customer customer = new Customer();
            customer.setAddress(address);
            customer.setContactNumber(contactNumber);
            customer.setCreditCardno(cardNumber);
            customer.setFirstName(fName);
            customer.setLastName(lName);
            customer.setPassword(password);
            String cusID = dao.registerUser(customer);
            request.setAttribute("message", "Registered Customer ID is" + cusID);

            RequestDispatcher rd = getServletContext().getRequestDispatcher("/index.jsp");
            rd.forward(request, response);
        } else if (url.equals("dog")) {

            productList = dao.getProducts(1);
            request.setAttribute("productList", productList);
            RequestDispatcher rd = getServletContext().getRequestDispatcher("/productsummary.jsp");
            rd.forward(request, response);

        } else if (url.equals("cat")) {
            productList = dao.getProducts(2);
            request.setAttribute("productList", productList);
            RequestDispatcher rd = getServletContext().getRequestDispatcher("/productsummary.jsp");
            rd.forward(request, response);

        } else if (url.equals("horse")) {
            productList = dao.getProducts(3);
            request.setAttribute("productList", productList);
            RequestDispatcher rd = getServletContext().getRequestDispatcher("/productsummary.jsp");
            rd.forward(request, response);

        } else if (url.equals("fish")) {
            productList = dao.getProducts(5);
            request.setAttribute("productList", productList);
            RequestDispatcher rd = getServletContext().getRequestDispatcher("/productsummary.jsp");
            rd.forward(request, response);

        } else if (url.equals("rabbit")) {
            productList = dao.getProducts(4);
            request.setAttribute("productList", productList);
            RequestDispatcher rd = getServletContext().getRequestDispatcher("/productsummary.jsp");
            rd.forward(request, response);

        } else if (url.equals("items")) {
            System.out.println("I am here!!!!!!!!");
            String[] list = request.getParameterValues("prodselection");
            //list2 = request.getParameterValues("prodselection");
            if (list != null) {
                System.out.println("I am testing this@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
                list2 = list;
                String selProdItems = String.join(",", list);
                selProdItems2 = String.join(",", list);
                System.out.println("Selected product IDs are=========" + selProdItems);
                ArrayList<String> prodList = new ArrayList<String>();
                for (int i = 0; i < list.length; i++) {
                    prodList.add(list[i]);
                }
                ArrayList<Item> itemList = dao.getSelProdItems(prodList);
                request.setAttribute("itemList", itemList);
                RequestDispatcher rd = getServletContext().getRequestDispatcher("/itemsummary.jsp");
                rd.forward(request, response);

            } else {
                request.setAttribute("message", "Please fill all the details!!!");
                productList = dao.getProducts(4);
                request.setAttribute("productList", productList);
                RequestDispatcher rd = getServletContext().getRequestDispatcher("/productsummary.jsp");
                rd.forward(request, response);
            }

        } else if (url.equals("cart")) {
            String[] list = request.getParameterValues("itemselection");
            if (list != null) {
                String selCartItems = String.join(",", list);
                System.out.println("Selected product IDs are=========" + selCartItems);
                itemList2 = dao.getCartItems(selCartItems);

                System.out.println("The item list is assigned here!!!!!!!!" + itemList2.isEmpty());
                HttpSession session = request.getSession();
                session.setAttribute("itemList", itemList2);
                //session.setAttribute("cID", cusId);
                request.setAttribute("itemList", itemList2);
                RequestDispatcher rd = getServletContext().getRequestDispatcher("/cartsummary_1.jsp");
                rd.forward(request, response);

            } else {
                request.setAttribute("message", "Please fill all the details!!!");
                productList = dao.getProducts(4);
                request.setAttribute("productList", productList);
                RequestDispatcher rd = getServletContext().getRequestDispatcher("/productsummary.jsp");
                rd.forward(request, response);
            }
        } else if (url.equals("ordered")) {
            System.out.println("In the ordered method!!!!!");
            String quantity[] = request.getParameterValues("quantity");

            System.out.println("The quantity entered are" + quantity.length);
            for (int i = 0; i < quantity.length; i++) {
                System.out.println("The quantiy of i is " + quantity[i]);
            }
            System.out.println("The item list is assigned here!!!!!!!!" + itemList2.isEmpty());
            //System.out.println("The list size is +++++++++++"+list2.length);
            //String selProdItems = String.join(",", list2);
            //System.out.println("Selected product IDs are=========" + selProdItems);
            //ArrayList<Item> itemList = dao.getSelProdItems(selProdItems);
            String[] quantityList = request.getParameterValues("quantity");
            String payment_method = request.getParameter("payment_method");
            System.out.println(quantityList);
            ArrayList<CartItem> cartItemList = new ArrayList<CartItem>();
            for (int i = 0; i < itemList2.size(); i++) {
                CartItem cartItem = new CartItem();
                Item item = (Item) itemList2.get(i);
                cartItem.setItem(item);
                cartItem.setQuantity(Integer.parseInt(quantityList[i]));
                cartItemList.add(cartItem);
            }

            float total = dao.purchase(cartItemList, cusId);
            request.setAttribute("total", total);
            System.out.println("Total Price==========" + total);
            request.setAttribute("total", total);
            //MailUtil mailUtil = new MailUtil();
            //mailUtil.sendEmail("likhithchinnam@gmail.com", "C. Likhith", "Payment Successful!", "The payment of "+total +"has been made. Thank You!");
            MailUtilGmail mailUtil = new MailUtilGmail();
            try {
                mailUtil.sendMail("likhithchinnam@gmail.com", "likhithchinnam@gmail.com", "Payment Successful!", "The payment of "+total +"has been made. Thank You!", true);
            } catch (MessagingException ex) {
                Logger.getLogger(ControllerServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
            //mailUtil.sendMail("likhithchinnam@gmail.com", "C. Likhith", "Payment Successful!", "The payment of "+total +"has been made. Thank You!");
            request.setAttribute("payment_method", payment_method);
            request.setAttribute("cartItemList", cartItemList);
            RequestDispatcher rd = getServletContext().getRequestDispatcher("/purchasesummary.jsp");
            rd.forward(request, response);

        } else if (url.equals("check_out")) {
            request.getSession().invalidate();
            response.sendRedirect("http://localhost:8080/petstore/home.jsp");
        } else if (url.equals("admin_update")) {
            String[] selItemList = request.getParameterValues("updated_price");
            String[] newPriceList = request.getParameterValues("new_priceList");
            ArrayList<Integer> itemIDs = new ArrayList<Integer>();
            ArrayList<Float> newPriceArrayList = new ArrayList<Float>();
            if (selItemList == null) {
                List<Item> allItemList = dao.getAllItems();
                request.setAttribute("Items", allItemList);
                request.setAttribute("message", "Please select the check box to select the items!!");
                RequestDispatcher rd = getServletContext().getRequestDispatcher("/admin.jsp");
                rd.forward(request, response);

            } else {
                for (int i = 0; i < selItemList.length; i++) {
                    System.out.println("The product Id selected is +++++++" + selItemList[i]);
                    itemIDs.add(Integer.parseInt(selItemList[i]));
                    newPriceArrayList.add(Float.parseFloat(newPriceList[i]));
                }
                dao.updatePrice(itemIDs, newPriceArrayList);
                List<Item> allItemList = dao.getAllItems();
                request.setAttribute("Items", allItemList);
                request.setAttribute("message", "Item Price(s) updated successflly!!!");
                RequestDispatcher rd = getServletContext().getRequestDispatcher("/admin.jsp");
                rd.forward(request, response);
            }

        }

    }

}
