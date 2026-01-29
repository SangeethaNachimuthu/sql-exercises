package model;

import java.time.LocalDateTime;

public class Attendance {

    private int id;
    private Student studentId;
    private LocalDateTime attendanceDate;
    private Status status;

    public Attendance(Student studentId, Status status) {
        this.studentId = studentId;
        this.status = status;
    }

    public Attendance(Student studentId, LocalDateTime attendanceDate, Status status) {
        this.studentId = studentId;
        this.attendanceDate = attendanceDate;
        this.status = status;
    }

    public Attendance(int id, Student studentId, LocalDateTime attendanceDate, Status status) {
        this.id = id;
        this.studentId = studentId;
        this.attendanceDate = attendanceDate;
        this.status = status;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Student getStudentId() {
        return studentId;
    }

    public void setStudentId(Student studentId) {
        this.studentId = studentId;
    }

    public LocalDateTime getAttendanceDate() {
        return attendanceDate;
    }

    public void setAttendanceDate(LocalDateTime attendanceDate) {
        this.attendanceDate = attendanceDate;
    }

    public Status getStatus() {
        return status;
    }

    public void setStatus(Status status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "Attendance{" +
                "id=" + id +
                ", studentId=" + studentId +
                ", attendanceDate=" + attendanceDate +
                ", status=" + status +
                '}';
    }
}
