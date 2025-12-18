import 'package:flutter/material.dart';
import 'screens/register_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, //ocultar banner de debug
      title: 'Demo Validaciones',
      theme: ThemeData(
        primarySwatch: Colors.blue, //color primario azul
        useMaterial3: true, //utilizar materiales de dart version 3
      ),
      home: const RegisterScreen(), //pantalla principal de la aplicacion
    );
  }
}
