package model;

import oracle.jdbc.pool.OracleDataSource;

import java.sql.Connection;
import java.sql.SQLException;

/**
 * Created by fwarr on 23-Sep-15.
 */
public class JDBC {
    private  Connection conn;
    private static JDBC ourInstance = new JDBC();

    public static JDBC getInstance() {
        return ourInstance;
    }

    private JDBC() {
        String connString="jdbc:oracle:thin:@//localhost:1521";

        try {
        OracleDataSource ods = new OracleDataSource();
        ods.setURL(connString);
        ods.setUser("hr");
        ods.setPassword("hr");
            conn = ods.getConnection();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public Connection getConnection()
    {
        return conn;
    }
}
