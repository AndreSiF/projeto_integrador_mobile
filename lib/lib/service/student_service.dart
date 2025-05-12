import '../persistence/student_dao.dart';
import '../models/student.dart';

class StudentService {
  final StudentDao _studentDao = StudentDao();

  Future<int> addStudent(Student student) async {
    return await _studentDao.insertStudent(student);
  }

  Future<List<Student>> getStudents() async {
    return await _studentDao.getAllStudents();
  }
}
