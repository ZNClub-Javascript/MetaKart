package controller;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Properties;
import java.util.Random;

/**
 * Created by fwarr on 27-Sep-15.
 */
public class SignUpController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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


        try {
            Random random = new Random();
            int vcode = random.nextInt();
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection connection = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521", "HR", "HR");
            PreparedStatement statement = connection.prepareStatement("INSERT INTO USERS VALUES (?,?,?,?,?)");
            statement.setString(1, request.getParameter("email"));
            statement.setString(2, request.getParameter("password"));

            String urlParameters  = "secret=6Lc7RA8TAAAAAA5gr8g9_Bmov4zWmSuSIej4iSAQ&response=" + request.getParameter("g-recaptcha-response");
            byte[] postData       = urlParameters.getBytes( StandardCharsets.UTF_8 );
            int    postDataLength = postData.length;
            String requests       = "https://www.google.com/recaptcha/api/siteverify";
            URL    url            = new URL( requests );
            HttpURLConnection conn= (HttpURLConnection) url.openConnection();
            conn.setDoOutput( true );
            conn.setInstanceFollowRedirects( false );
            conn.setRequestMethod( "POST" );
            conn.setRequestProperty( "Content-Type", "application/x-www-form-urlencoded");
            conn.setRequestProperty( "charset", "utf-8");
            conn.setRequestProperty( "Content-Length", Integer.toString( postDataLength ));
            conn.setUseCaches( false );
            try( DataOutputStream wr = new DataOutputStream( conn.getOutputStream())) {
                wr.write( postData );
                wr.flush();
                wr.close();
            }
            BufferedReader in = new BufferedReader(new InputStreamReader(
                    conn.getInputStream()));
            String inputLine;
            StringBuffer responses = new StringBuffer();
            while ((inputLine = in.readLine()) != null) {
                responses.append(inputLine);
            }
            in.close();

            // print result
            System.out.println("POST Response" + responses.toString());


            //System.out.println("farmer: " + request.getParameter("user-type-farmer"));
            //System.out.println("farmer: " + request.getParameter("g-recaptcha-response"));
            //System.out.println("customer: " + request.getParameter("user-type-customer"));
            statement.setInt(3, vcode);
            statement.setInt(4,0);
            statement.setInt(5,Integer.parseInt(request.getParameter("user-type")));

            statement.execute();

            // Create a default MimeMessage object.
            MimeMessage message = new MimeMessage(session);

            // Set From: header field of the header.
            message.setFrom(new InternetAddress(from));

            // Set To: header field of the header.
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));

            // Set Subject: header field
            message.setSubject("Hey Emandi just mailed you!");

            // Now set the actual message
            message.setText("And this is crazy, your account is ready.\n Mail us maybe?\nYour verification code link: http://localhost:8086/verify?vcode=" + vcode);

            // Send message
            Transport.send(message);
            System.out.println("Sent message successfully....");
            response.sendRedirect("/");
        } catch (MessagingException | ClassNotFoundException | SQLException mex) {
            mex.printStackTrace();
            response.sendRedirect("signup.jsp");
        }
    }
}
