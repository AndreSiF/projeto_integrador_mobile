import 'package:flutter/material.dart';
import '../service/student_service.dart';
import 'add_student_page.dart';
import '../models/student.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final StudentService _studentService = StudentService();
  late Future<List<Student>> _students;

  @override
  void initState() {
    super.initState();
    _students = _studentService.getStudents();
  }

  void _refreshStudents() {
    setState(() {
      _students = _studentService.getStudents();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Alunos')),
      body: FutureBuilder<List<Student>>(
        future: _students,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Erro: ${snapshot.error}'));
          }
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              final student = snapshot.data![index];
              return ListTile(
                title: Text(student.name),
                subtitle: Text(student.email),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddStudentPage()),
          );
          _refreshStudents();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
