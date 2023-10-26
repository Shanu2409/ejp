/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.user.servlet;

import com.DAO.CartDAOImpl;
import com.DAO.ProductOrderDAOImpl;
import com.db.DbConnect;
import com.entity.Cart;
import com.entity.ProductDetails;
import com.entity.Product_order;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author shanu
 */
@WebServlet("/order")
public class OrderServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            HttpSession session = req.getSession();

            String name = req.getParameter("name");
            String email = req.getParameter("email");
            String address = req.getParameter("adrs");
            String phone = req.getParameter("phone");
            String landmark = req.getParameter("land");
            String city = req.getParameter("city");
            String state = req.getParameter("state");
            String pin = req.getParameter("pin");
            String payment = req.getParameter("pay");
            int id = Integer.parseInt(req.getParameter("id"));

            String FullAddress = address + ", " + landmark + ", " + city + ", " + state + ", " + pin;

            System.out.println(name + email + phone + FullAddress);

            CartDAOImpl dao = new CartDAOImpl(DbConnect.getCon());
            ProductOrderDAOImpl ProductOrderDao = new ProductOrderDAOImpl(DbConnect.getCon());
            Product_order o = null;

            List<Cart> pList = dao.getBookByUser(id);

//            int orderID = ProductOrderDao.getOrderNumber();
            if(pList.isEmpty()){
                session.setAttribute("OrderFailMsg", "!!!! Cart is Empty !!!!");
                resp.sendRedirect("checkout.jsp");
            } else {
                ArrayList<Product_order> orderList = new ArrayList<Product_order>();

            Random r = new Random();

            for (Cart c : pList) {
                o = new Product_order();

                o.setOrder_id("-PiD-" + r.nextInt(10000));
                o.setUserName(name);
                o.setEmail(email);
                o.setPhone(phone);
                o.setFullAddress(FullAddress);
                o.setProductName(c.getProductName());
                o.setOwner(c.getOwner());
                o.setPrice(c.getPrice() + "");
                o.setPayment(payment);

                orderList.add(o);

//                System.out.println(c.getProductName());
            }
//            System.out.println(orderList);
            boolean f = ProductOrderDao.saveOrder(orderList);

            if (f) {
//                System.out.println("successful");
//                session.setAttribute("OrderFailMsg", "User & Passwordre Invaild");
                resp.sendRedirect("orderSuccessful.jsp");
            } else {
                session.setAttribute("OrderFailMsg", "Something wrong with DataBase");
                resp.sendRedirect("checkout.jsp");
            }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
