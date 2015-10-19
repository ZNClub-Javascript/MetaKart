package controller;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;

/**
 * Created by fwarr on 19-Oct-15.
 */
public class Product extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection connection = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521", "hr", "hr");
            PreparedStatement statement = connection.prepareStatement("SELECT * FROM PRODUCTS WHERE NAME = ?");
            statement.setString(1, request.getParameter("p"));
            ResultSet rs = statement.executeQuery();
            rs.next();
            model.Product p = new model.Product();
            p.setName(rs.getString("NAME"));
            p.setDescription(rs.getString("DESCRIPTION"));
            p.setImage(rs.getString("IMAGE"));
            p.setPrice(rs.getFloat("PRICE"));
            p.setStock(rs.getInt("STOCK"));
            p.setCategory(rs.getString("CATEGORY"));
            request.setAttribute("product",p);
            RequestDispatcher rd = request.getRequestDispatcher("product.jsp");
            rd.forward(request,response);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
