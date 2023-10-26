package com.taxibooking.logic;

import com.taxibooking.dao.TaxiDatabaseUtil;
import com.taxibooking.model.*;

import java.sql.*;
import java.util.*;

import javax.annotation.Resource;
import javax.servlet.ServletConfig;

public class TaxiImple {

    private static Customer custLogged = null;

    public static void setCustomer(Customer cust) {
        custLogged = cust;
    }

    public static Customer getCustomer() {
        return custLogged;
    }

    public static List<Taxi> getFreeTaxis(List<Taxi> taxis, int pickupTime, char pickupPoint) {
        List<Taxi> freeTaxis = new ArrayList<Taxi>();
        for (Taxi t : taxis) {
            if (t.getFreeTime() <= pickupTime && (Math.abs((t.getCurrentSpot() - '0') - (pickupPoint - '0')) <= pickupTime - t.getFreeTime())) {
                freeTaxis.add(t);
            }

        }
        return freeTaxis;
    }

    public static History bookTaxi(String customerName, char pickupPoint, char dropPoint, int pickupTime, List<Taxi> freeTaxis) {
        int min = 999;
        int distanceBetweenpickUpandDrop = 0;
        int earning = 0;
        int nextfreeTime = 0;
        char nextSpot = 'Z';
        Taxi bookedTaxi = null;
        String tripDetail = "";

        for (Taxi t : freeTaxis) {
            int distanceBetweenCustomerAndTaxi = Math.abs((t.getCurrentSpot() - '0') - (pickupPoint - '0')) * 15;
            if (distanceBetweenCustomerAndTaxi < min) {
                bookedTaxi = t;
                distanceBetweenpickUpandDrop = Math.abs((dropPoint - '0') - (pickupPoint - '0')) * 15;
                earning = (distanceBetweenpickUpandDrop - 5) * 10 + 100;
                min = distanceBetweenCustomerAndTaxi;
                int dropTime = pickupTime + distanceBetweenpickUpandDrop / 15;
                nextfreeTime = dropTime;
                nextSpot = dropPoint;

            }

        }
        String date = String.valueOf(new java.util.Date());

        date = date.substring(4, 10) + " " + date.substring(24, 28);
        System.out.println("Date: " + date);
        System.out.println("Booked Taxi ID: " + 3);
        System.out.println("Customer Name: " + customerName);
        System.out.println("Pickup Location: " + getExactLocation(pickupPoint));
        System.out.println("Drop Location: " + getExactLocation(dropPoint));
        System.out.println("Pickup Time: " + pickupTime);
        System.out.println("Next Free Time: " + nextfreeTime);
        System.out.println("Earning: " + earning);

        
//        System.out.println("1234567890wertyuiodfghuiop                  "+date + bookedTaxi.getId()+ customerName+ getExactLocation(pickupPoint)+getExactLocation(dropPoint)+ pickupTime+ nextfreeTime+ earning);
        History taxiBooked = new History(date, 1, customerName, getExactLocation(pickupPoint),
                getExactLocation(dropPoint), pickupTime, nextfreeTime, earning);

        System.out.println("Booked Details : " + taxiBooked);
//        System.out.println("Taxi " + bookedTaxi.getId() + " booked");

        return taxiBooked;

    }

    public static String getExactLocation(char pickupPoint) {
        HashMap<Character, String> hm = new HashMap<>();
        hm.put('A', "Borivali");
        hm.put('B', "National Park");
        hm.put('C', "Devipada");
        hm.put('D', "Magathane");
        hm.put('E', "Thakur Cinema");
        hm.put('F', "Thakur College");
        

        return hm.get(pickupPoint);
    }

    public static List<History> getHistoryBasedOnCustomer(String name) {
        List<History> histOfCustomer = new ArrayList<>();

        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cabbook?autoReconnect=true&useSSL=false", "root", "root");
            Statement st = con.createStatement();
            String Query = "select bookedDate,fromLoc,toLoc,amount,cab_id from history where custName = '" + name + "';";  // string has '' in between inputs.
            ResultSet rs = st.executeQuery(Query);

            while (rs.next()) {
                histOfCustomer.add(new History(rs.getString(1), rs.getString(2), rs.getString(3), Integer.parseInt(rs.getString(4)), Integer.parseInt(rs.getString(5))));
            }
            return histOfCustomer;
        } catch (Exception e) {
            System.out.println(e);
        }

        return histOfCustomer;
    }

}
