package controller;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Arrays;

/**
 * Created by fwarr on 17-Sep-15.
 */
public class welcome extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Cookie cookies[] = request.getCookies();
        if (cookies[0].getValue().equals("true")) response.sendRedirect("index.jsp");
        else {
            Cookie first = new Cookie("new", "true");
            first.setMaxAge(60 * 60 * 24 * 14);
            response.addCookie(first);
            response.sendRedirect("landing.jsp");
        }
    }
}
