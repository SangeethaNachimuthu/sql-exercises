package db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseConnection {

    private static final String URL = "jdbc:mysql://localhost:3306/school_management";
    private static final String USER = "root";
    private static final String PASSWORD = "SangaBalan18*";

    private static Connection connection;

    public static Connection getMySQLConnection() throws SQLException {

        connection = DriverManager.getConnection(URL, USER, PASSWORD);
        return connection;
    }
}
