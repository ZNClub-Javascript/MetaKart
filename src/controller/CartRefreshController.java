package controller;

import jdk.nashorn.api.scripting.JSObject;
import model.Cart;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

/**
 * Created by Varun on 10/29/2015.
 */
public class CartRefreshController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Cart cart = (Cart) request.getSession().getAttribute("cart");
        JSONArray ja = new JSONArray();
        try {
            for(String item: cart.getItems()){
                JSONObject ji = new JSONObject();
                ji.put("name",item);
                ja.add(ji);
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        response.getWriter().write(ja.toJSONString());
    }
}
