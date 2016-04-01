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
import java.sql.*;
import java.util.Properties;

/**
 * Created by fwarr on 23-Oct-15.
 */
public class ResetPasswordInit extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection connection = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521", "HR", "HR");
            PreparedStatement statement = connection.prepareStatement("SELECT * FROM USERS WHERE USERNAME = ?");
            statement.setString(1, request.getParameter("email"));
            ResultSet resultSet = statement.executeQuery();
            if (resultSet.next()) {

                int vcode = resultSet.getInt("VCODE");
                System.out.println("Reset Password " + vcode);
                // Recipient's email ID needs to be mentioned.
                String to = request.getParameter("email");

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

                // Create a default MimeMessage object.
                MimeMessage message = new MimeMessage(session);

                // Set From: header field of the header.
                message.setFrom(new InternetAddress(from));

                // Set To: header field of the header.
                message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));

                // Set Subject: header field
                message.setSubject("You'll need this to reset your password.");

                // Now set the actual message
                message.setText("Your verification code is:" + vcode);

                // Send message
                Transport.send(message);
                System.out.println("Sent message successfully....");
                response.sendRedirect("reset.jsp");
            }
            else response.sendRedirect("signup.jsp");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            response.sendRedirect("signup.jsp");
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("signup.jsp");
        } catch (AddressException e) {
            e.printStackTrace();
            response.sendRedirect("signup.jsp");
        } catch (MessagingException e) {
            e.printStackTrace();
            response.sendRedirect("signup.jsp");
        }
    }
}
