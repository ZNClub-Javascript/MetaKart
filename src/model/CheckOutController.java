package model;

import model.BaseDAO;
import model.Card;
import model.User;

import javax.mail.*;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.beans.Statement;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Properties;
import java.util.Random;

/**
 * Created by Varun on 10/28/2015.
 */
public class CheckOutController extends BaseDAO {

    Connection connection;
    PreparedStatement preparedStatement;
    Statement statement;


    public boolean payment(Card c){
        int count=0;

        try {
            connection = getConnection();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        String sql = "INSERT INTO HR.PAYMENTS VALUES (?,?,?,?,?)";
        try {
            preparedStatement= connection.prepareStatement(sql);
            preparedStatement.setInt(1, c.getPid());
            preparedStatement.setString(2, c.getEmail() );
            preparedStatement.setDouble(3, c.getCard());
            preparedStatement.setInt(4, c.getCvv());
            preparedStatement.setString(5, c.getUser_type());
            count = preparedStatement.executeUpdate();


        } catch (SQLException e) {
            e.printStackTrace();
        }
        if (count > 0) {
            System.out.println("Successfully Inserted");
            return true;
        } else {
            System.out.println("insertion failed");
            return false;
        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
    /**/
}
