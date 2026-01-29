package dao;

import model.Student;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

public class StudentDaoImpl implements StudentDao {

    private Connection connection;

    public StudentDaoImpl(Connection connection) {
        this.connection = connection;
    }

    @Override
    public Student save(Student student) {
        return null;
    }

    @Override
    public List<Student> findAll() {

        List<Student> students = null;

        try (
                PreparedStatement preparedStatement = connection.prepareStatement(
                        "SELECT * FROM student");
                ResultSet resultSet = preparedStatement.executeQuery();
             ) {

            students = new ArrayList<>();

            while (resultSet.next()) {

                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                String classGroup = resultSet.getString("class_group");
                LocalDateTime createDate = resultSet.getTimestamp("create_date").toLocalDateTime();

                Student student = new Student(id, name, classGroup, createDate);
                students.add(student);
            }


        } catch (SQLException e) {
            e.printStackTrace();
        }

        return students;
    }
}
