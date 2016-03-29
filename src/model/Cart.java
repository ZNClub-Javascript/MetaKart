package model;

import java.sql.*;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

/**
 * Created by Maanav Doshi on 23-10-2015.
 */
public class Cart {
    public List cartItems = new ArrayList<Integer>();

    public void add(int vid) {
        cartItems.add((Integer) vid);
    }

    public String translate(int vid) throws SQLException, ClassNotFoundException {

        Class.forName("oracle.jdbc.driver.OracleDriver");
        Connection connection = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521", "HR", "HR");
        PreparedStatement statement = connection.prepareStatement("SELECT * FROM PRODUCTS WHERE ID = ?");
        statement.setInt(1, vid);
        ResultSet resultSet = statement.executeQuery();
        if (resultSet.next()) {
            String s = resultSet.getString("ID");
            return s;
        } else
            return null;
    }
    public String[] getItems() throws SQLException, ClassNotFoundException{
        System.out.println(cartItems.size());
       String al[] = new String[cartItems.size()];
        Class.forName("oracle.jdbc.driver.OracleDriver");
        Connection connection = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521", "HR", "HR");
        for(int i = 0; i< cartItems.size();i++) {
            PreparedStatement statement = connection.prepareStatement("SELECT * FROM PRODUCTS WHERE ID = ?");
            statement.setInt(1, (int)cartItems.get(i));
            ResultSet resultSet = statement.executeQuery();
            if(resultSet.next()){
                al[i]= resultSet.getString("NAME");
            }
        }
        System.out.println(Arrays.asList(al));
        return al;
    }
    public String[] getCosts() throws SQLException, ClassNotFoundException{
        System.out.println(cartItems.size());
        String al[] = new String[cartItems.size()];
        Class.forName("oracle.jdbc.driver.OracleDriver");
        Connection connection = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521", "hr", "hr");
        for(int i = 0; i< cartItems.size();i++) {
            PreparedStatement statement = connection.prepareStatement("SELECT * FROM PRODUCTS WHERE ID = ?");
            statement.setInt(1, (int)cartItems.get(i));
            ResultSet resultSet = statement.executeQuery();
            if(resultSet.next()){
                al[i]= resultSet.getString("PRICE");
            }
        }
        System.out.println(Arrays.asList(al));
        return al;
    }

    public String[] getImages() throws SQLException, ClassNotFoundException{
        System.out.println(cartItems.size());
        String al[] = new String[cartItems.size()];
        Class.forName("oracle.jdbc.driver.OracleDriver");
        Connection connection = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521", "HR", "HR");
        for(int i = 0; i< cartItems.size();i++) {
            PreparedStatement statement = connection.prepareStatement("SELECT * FROM PRODUCTS WHERE ID = ?");
            statement.setInt(1, (int)cartItems.get(i));
            ResultSet resultSet = statement.executeQuery();
            if(resultSet.next()){
                al[i]= resultSet.getString("IMAGE");
            }
        }
        System.out.println(Arrays.asList(al));
        return al;
    }
    public void remove(int vid){
        cartItems.remove((Integer) vid);
    }

}
