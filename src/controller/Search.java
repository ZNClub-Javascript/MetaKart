package controller;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

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
public class Search extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String q = request.getParameter("q");
        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection connection = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521", "hr", "hr");
            PreparedStatement statement = connection.prepareStatement("SELECT * FROM PRODUCTS WHERE NAME LIKE '%"+q+"%' OR CATEGORY LIKE '%"+q+"%'");
            JSONObject ret = new JSONObject();
            JSONArray res = new JSONArray();
            ResultSet rs = statement.executeQuery();
            while (rs.next())
            {
                JSONObject product = new JSONObject();
                product.put("title",rs.getString("NAME"));
                product.put("category",rs.getString("CATEGORY"));
                product.put("price",rs.getString("PRICE"));
                product.put("url","product?p="+rs.getString("NAME"));
                res.add(product);
            }
            ret.put("results",res);
            response.getWriter().write(ret.toJSONString());
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
