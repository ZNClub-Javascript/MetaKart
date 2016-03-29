package controller;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;
import java.util.Random;

/**
 * Created by fwarr on 29-Oct-15.
 */

public class farmerUpload extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection connection = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521", "HR", "HR");
            PreparedStatement statement = connection.prepareStatement("INSERT INTO PRODUCTS VALUES (?,?,?,?,?,?,?)");
            Random random = new Random();
            statement.setInt(1, Math.abs(random.nextInt()));
            statement.setString(2, request.getParameter("name"));
            statement.setString(3, request.getParameter("description"));
            statement.setInt(4, Integer.parseInt(request.getParameter("price")));
            statement.setString(5, request.getParameter("image"));
            statement.setInt(6, Integer.parseInt(request.getParameter("stock")));
            statement.setString(7, request.getParameter("category"));
            ResultSet resultSet = statement.executeQuery();
            response.sendRedirect("/");
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            response.sendRedirect("upload.jsp");
        }
    }
}
