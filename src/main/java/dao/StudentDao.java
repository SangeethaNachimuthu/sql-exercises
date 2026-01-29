package dao;

import model.Student;

import java.util.List;

public interface StudentDao {

    Student save(Student student);

    List<Student> findAll();
}
