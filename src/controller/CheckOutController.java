package controller;

import javax.mail.*;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Properties;
import java.util.Random;

/**
 * Created by Varun on 10/28/2015.
 */
public class CheckOutController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
// Recipient's email ID needs to be mentioned.
        Random r = new Random();
        String to = (String) request.getSession().getAttribute("user");

        // Sender's email ID needs to be mentioned
        String from = "emandi74@gmail.com";

        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");

        Session session = Session.getInstance(props,
                new javax.mail.Authenticator() {
                    protected PasswordAuthentication getPasswordAuthentication() {
                        return new PasswordAuthentication("emandi74@gmail.com", "freshVeggies");
                    }
                });
        try {
            // Create a default MimeMessage object.
            MimeMessage message = new MimeMessage(session);

            // Set From: header field of the header.
            message.setFrom(new InternetAddress(from));

            // Set To: header field of the header.
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));

            // Set Subject: header field
            message.setSubject("E-Mandi: Order Confirmation");

            // Now set the actual message
            StringBuilder str = new StringBuilder();
            str.append("<h3>A confirmation of your order no: ").append(r.nextInt(9999)).append("</h3>");
            str.append("<img src = \"http://ep.yimg.com/ay/yhst-30578333464715/organic-vegetable-of-the-month-club-5-lbs-per-month-1.gif\"></img>");
            message.setText(str.toString(), "text/html");

            // Send message
            Transport.send(message);
            System.out.println("Sent message successfully....");
        } catch (MessagingException e) {
            e.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
