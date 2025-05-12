import '../core/database.dart';
import '../models/student.dart';

class StudentDao {
  static const String table = 'students';

  Future<int> insertStudent(Student student) async {
    final db = await AppDatabase().database;
    return db.insert(table, student.toMap());
  }

  Future<List<Student>> getAllStudents() async {
    final db = await AppDatabase().database;
    final result = await db.query(table);
    return result.map((map) => Student.fromMap(map)).toList();
  }
}
