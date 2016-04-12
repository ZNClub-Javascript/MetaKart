package controller;

import model.*;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Properties;
import java.util.Random;

/**
 * Created by admin on 12/04/2016.
 */
public class CheckOutServlet {

    Random r = new Random();
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            Card c = new Card();
            CheckOutController coc = new CheckOutController();

            c.setPid(r.nextInt(9999));
            c.setEmail(((User) request.getSession().getAttribute("user")).getUser());
            c.setCard(Float.parseFloat(request.getParameter("card")));
            c.setUser_type(request.getParameter("user-type"));
            c.setCvv(Integer.parseInt(request.getParameter("stock")));


            boolean b = coc.payment(c);

            if (b) {
                RequestDispatcher rd = request.getRequestDispatcher("success.jsp");
                rd.forward(request, response);
            } else {
                RequestDispatcher rd = request.getRequestDispatcher("error.jsp");
                rd.forward(request, response);
            }


        }
    }

}
