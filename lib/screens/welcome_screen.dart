import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  final String name;
  final int age;
  final String email;

  const WelcomeScreen({
    super.key,
    required this.name,
    required this.age,
    required this.email,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.fitness_center,
                size: 80,
                color: Colors.blue,
              ),
              const SizedBox(height: 20.0),
              const Text(
                '¡Bienvenido a Fit Life!',
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10.0),
              const Text(
                'Tu registro ha sido exitoso',
                style: TextStyle(fontSize: 16.0, color: Colors.grey),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30.0),
              Container(
                padding: const EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Datos de Registro:',
                      style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 20.0),
                    _buildInfoRow('Nombre:', name),
                    const SizedBox(height: 10.0),
                    _buildInfoRow('Edad:', '$age años'),
                    const SizedBox(height: 10.0),
                    _buildInfoRow('Correo:', email),
                    const SizedBox(height: 30.0),
                    const Text(
                      '¡Prepárate para transformar tu vida con Fit Life!',
                      style: TextStyle(fontSize: 16.0, color: Colors.blue),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30.0),
              SizedBox(
                width: double.infinity,
                height: 50.0,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context); // Volver a la pantalla anterior
                  },
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 16.0),
                    child: Text(
                      'Volver',
                      style: TextStyle(fontSize: 16.0),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Row(
      children: [
        Text(
          label,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(width: 10.0),
        Expanded(
          child: Text(value),
        ),
      ],
    );
  }
}