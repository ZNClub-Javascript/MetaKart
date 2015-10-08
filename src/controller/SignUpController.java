package controller;

import java.io.IOException;
import java.sql.*;
import java.util.*;
import javax.mail.*;
import javax.mail.internet.*;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Created by fwarr on 27-Sep-15.
 */
public class SignUpController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Recipient's email ID needs to be mentioned.
        String to = request.getParameter("email");

        // Sender's email ID needs to be mentioned
        String from = "f.warren210@gmail.com";

        Properties props = new Properties();
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.host", "smtp.gmail.com");
		props.put("mail.smtp.port", "587");

		Session session = Session.getInstance(props,
		  new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication("f.warren210@gmail.com", "motoxt720");
			}
		  });


        try{
            Random random = new Random();
            int vcode = random.nextInt();
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection connection = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521", "hr", "hr");
            PreparedStatement statement = connection.prepareStatement("INSERT INTO USERS VALUES (?,?,?)");
            statement.setString(1,request.getParameter("email"));
            statement.setString(2,request.getParameter("password"));
            statement.setInt(3,vcode);
            try {
                statement.execute();
            }
            catch (Exception e){
             response.sendRedirect("signup.jsp");
            }
            // Create a default MimeMessage object.
            MimeMessage message = new MimeMessage(session);

            // Set From: header field of the header.
            message.setFrom(new InternetAddress(from));

            // Set To: header field of the header.
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));

            // Set Subject: header field
            message.setSubject("Hey Emandi just mailed you!");

            // Now set the actual message
            message.setText("And this is crazy, your account is ready.\n Mail us maybe?\nYour verification code link: http://localhost:8086/verify?vcode="+vcode);

            // Send message
            Transport.send(message);
            System.out.println("Sent message successfully....");
        }catch (MessagingException mex) {
            mex.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
