package controller;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;

/**
 * Created by fwarr on 23-Oct-15.
 */

public class ResetPassword extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int vcode = Integer.parseInt(request.getParameter("vcode"));
        String password = request.getParameter("password");
        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection connection = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521", "HR", "HR");
            PreparedStatement statement = connection.prepareStatement("SELECT * FROM USERS WHERE VCODE = ?");
            statement.setInt(1, vcode);
            ResultSet resultSet = statement.executeQuery();
            if (resultSet.next()) {
                statement = connection.prepareStatement("UPDATE USERS SET PASSWORD = ? WHERE VCODE =?");
                statement.setString(1, password);
                statement.setInt(2, vcode);
                statement.execute();
                response.sendRedirect("index.jsp");
            }else response.sendRedirect("reset.jsp");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            response.sendRedirect("reset.jsp");
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("reset.jsp");
        }
    }
}
