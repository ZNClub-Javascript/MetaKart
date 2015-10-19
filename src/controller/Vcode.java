package controller;

import model.user;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;

/**
 * Created by fwarr on 07-Oct-15.
 */
public class Vcode extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int vcode = Integer.parseInt(request.getParameter("vcode"));
        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection connection = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521", "hr", "hr");
            PreparedStatement statement = connection.prepareStatement("SELECT * FROM USERS WHERE VCODE = ?");
            statement.setInt(1,vcode);
            ResultSet resultSet = statement.executeQuery();
            if(resultSet.next()){
                statement = connection.prepareStatement("UPDATE USERS SET VERIFIED = 1 WHERE VCODE =?");
                statement.setInt(1,vcode);
                if(statement.execute()) {
                    user user = new user();
                    user.setUser(resultSet.getString("USERNAME"));
                    request.getSession().setAttribute("user", user);
                }
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        response.sendRedirect("index.jsp");
    }
}
