import dao.StudentDao;
import dao.StudentDaoImpl;
import db.DatabaseConnection;
import model.Student;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

public class SchoolManagementApp {

    void main() {

        try {
            Connection mySQLConnection = DatabaseConnection.getMySQLConnection();

            StudentDao studentDao = new StudentDaoImpl(mySQLConnection);

            List<Student> students = studentDao.findAll();

            for (Student s : students) {
                IO.println(s);
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
