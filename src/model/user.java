package model;

import java.sql.*;

/**
 * Created by fwarr on 23-Sep-15.
 */
public class user {
    private String user, password;

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getUser() {
        return user;
    }

    public void setUser(String user) {
        this.user = user;
    }

    public boolean validate() throws SQLException, ClassNotFoundException {
        Class.forName("oracle.jdbc.driver.OracleDriver");
        Connection connection = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521", "hr", "hr");
        PreparedStatement statement = connection.prepareStatement("SELECT * FROM USERS WHERE USERNAME = ?");
        statement.setString(1, user);
        ResultSet resultSet = statement.executeQuery();
        if (resultSet.next()) {
            System.out.println(resultSet.getString("PASSWORD"));
            if (resultSet.getString("PASSWORD").equals(this.password))
                return true;
        }
        return false;
    }
}