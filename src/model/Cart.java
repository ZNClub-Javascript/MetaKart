package model;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by Maanav Doshi on 23-10-2015.
 */
public class Cart {
    List cartItems = new ArrayList<Integer>();

    public void add(int vid) {
        cartItems.add((Integer) vid);
    }

    public String translate(int vid) throws SQLException, ClassNotFoundException {

        Class.forName("oracle.jdbc.driver.OracleDriver");
        Connection connection = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521", "hr", "hr");
        PreparedStatement statement = connection.prepareStatement("SELECT * FROM PRODUCTS WHERE ID = ?");
        statement.setInt(1, vid);
        ResultSet resultSet = statement.executeQuery();
        if (resultSet.next()) {
            String s = resultSet.getString("ID");
            return s;
        } else
            return null;
    }
    public void remove(int vid){
        cartItems.remove((Integer) vid);
    }

}
