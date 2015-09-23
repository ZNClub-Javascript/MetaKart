package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * Created by fwarr on 23-Sep-15.
 */
public class user {
    private String user,password;

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

    public boolean validate() throws SQLException {
        JDBC j = JDBC.getInstance();
        Connection connection = j.getConnection();
        PreparedStatement statement = connection.prepareStatement("SELECT * FROM USERS WHERE USERNAME = ?");
        statement.setString(1,user);
        ResultSet resultSet = statement.executeQuery();
        if(resultSet.next())return true;
        return false;
    }
}
