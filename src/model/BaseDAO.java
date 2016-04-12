package model;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.SQLSyntaxErrorException;
import java.util.logging.Level;
import java.util.logging.Logger;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author universe
 */
public class BaseDAO {
    private Connection con, connectionP;
    private int active=0;
    PreparedStatement preparedStatement;


    public void checkLink()
    {
        if(active ==0)
        {
            System.out.println("Trying to Establish Connection");
            active = 1;
            establishLink();
        }

    }
    public void establishLink()
    {
        try {
            System.out.println("Establishing connection");
            connectionP = getConnection();
            String sql = "drop database link mumbai";
            preparedStatement = connectionP.prepareStatement(sql);
            preparedStatement.executeQuery();

            /*
            sql = "drop database link hyderabad";
            preparedStatement = connectionP.prepareStatement(sql);
            preparedStatement.executeQuery();
            */

            sql = "create database link mumbai connect to system identified by vvvvvv using 'site1'";
            preparedStatement = connectionP.prepareStatement(sql);
            preparedStatement.executeQuery();

            /*
            sql = "create database link hyderabad connect to system identified by vvvvvv using 'site1'";
            preparedStatement = connectionP.prepareStatement(sql);
            preparedStatement.executeQuery();
            */


        } catch (ClassNotFoundException ex) {
            Logger.getLogger(BaseDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(BaseDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    public Connection getConnection() throws ClassNotFoundException, SQLException
    {
        Class.forName("oracle.jdbc.OracleDriver"); //load the driver
        con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","HR","HR");//getConnection(location of the database,username,password)
        return con;
    }

}