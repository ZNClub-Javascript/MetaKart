/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package model;

import java.beans.Statement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Karthick
 */
public class ProductMasterDAO extends BaseDAO {
    Connection connection;
    PreparedStatement preparedStatement;
    Statement statement;

    public boolean editProduct(Product p){
        try {
            connection = getConnection();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        String name = p.getName();
        String desc = p.getDescription();
        float price = p.getPrice();
        String image = p.getImage();
        int stock = p.getStock();
        int pid = p.getId();
        int count = 0;

        try {
            preparedStatement = connection.prepareStatement("update PRODUCTS set STOCK = ?  where id=?");
            preparedStatement.setInt(1,p.getStock());
            preparedStatement.setInt(2, pid);
            count += preparedStatement.executeUpdate();

            preparedStatement = connection.prepareStatement("update PRODUCTS set DESCRIPTION = ?  where id=?");
            preparedStatement.setString(1,p.getDescription());
            preparedStatement.setInt(2, pid);
            count += preparedStatement.executeUpdate();

            preparedStatement = connection.prepareStatement("update PRODUCTS set IMAGE = ?  where id=?");
            preparedStatement.setString(1,p.getImage());
            preparedStatement.setInt(2, pid);
            count += preparedStatement.executeUpdate();

            preparedStatement = connection.prepareStatement("update PRODUCTS set NAME = ?  where id=?");
            preparedStatement.setString(1,p.getName());
            preparedStatement.setInt(2, pid);
            count += preparedStatement.executeUpdate();

            preparedStatement = connection.prepareStatement("update PRODUCTS set PRICE = ?  where id=?");
            preparedStatement.setFloat(1,p.getPrice());
            preparedStatement.setInt(2, pid);
            count += preparedStatement.executeUpdate();


        } catch (SQLException e) {
            e.printStackTrace();
        }


        if(count==5)
            return true;
        else
            return false;


    }
    public boolean deleteProduct(Product p){
        try {
            connection = getConnection();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }

            int count=0;
            try {
            preparedStatement = connection.prepareStatement("DELETE FROM PRODUCTS where id=?");
            preparedStatement.setInt(1,p.getId());

            count += preparedStatement.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }


        if(count==1)
            return true;
        else
            return false;


    }

}
