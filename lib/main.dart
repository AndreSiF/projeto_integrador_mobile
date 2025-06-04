
import 'package:flutter/material.dart';
import 'package:projeto_integrador_mobile/core/database.dart';
import 'package:projeto_integrador_mobile/pages/form/ident_aqui_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppDatabase().database;

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Desativa a bandeirinha de DEBUG no topo da tela
      title: "Formulário Aquicultura",
      home: IdentificacaoAquicultorPage(),
    );
  }
}

