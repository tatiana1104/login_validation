import 'package:flutter/material.dart';
import '../utils/validators.dart';
import 'welcome_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState(); //crear estado mutable
}

class _RegisterScreenState extends State<RegisterScreen> { //estado mutable
  final _formKey = GlobalKey<FormState>(); //clave global para el formulario
  bool _isObscure = true; //variable para controlar la visualidad de la contraseña
  bool _isConfirmObscure = true; //variable para controlar la visualidad de la confirmacion de contraseña

  //controladores para los campos de texto
  final TextEditingController _nameController = TextEditingController(); 
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100], //fondo claro
      body: Center(
        child: SingleChildScrollView( //permite desplazamiento si el contenido es mayor que la pantalla
          padding: const EdgeInsets.all(24.0), //espaciado alrededor del formulario
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, //centrar verticalmente
            children: [
              const Icon( //icono de registro
                Icons.person_add,
                size: 80,
                color: Colors.blue,
              ),
              const SizedBox(height: 20.0), //espacio
              const Text( //titulo
                'Registro',
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
              ),
              const Text( //subtitulo
                'Regístrate en Fit Life',
                style: TextStyle(fontSize: 16.0, color: Colors.grey),
              ),
              const SizedBox(height: 30.0), //espacio
              Container( //contenedor del formulario
                padding: const EdgeInsets.all(20.0),
                decoration: BoxDecoration( //decoracion del contenedor
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
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      // Campo de nombre
                      TextFormField(
                        controller: _nameController, //asignar controlador
                        decoration: const InputDecoration(
                          labelText: 'Nombre',
                          prefixIcon: Icon(Icons.person),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8.0)),
                          ),
                        ),
                        validator: Validator.name,
                      ),
                      const SizedBox(height: 20.0),
                      // Campo de edad
                      TextFormField(
                        controller: _ageController,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          labelText: 'Edad',
                          prefixIcon: Icon(Icons.calendar_today),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8.0)),
                          ),
                        ),
                        validator: Validator.age,
                      ),
                      const SizedBox(height: 20.0),
                      // Campo de correo electrónico
                      TextFormField(
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                          labelText: 'Correo Electrónico',
                          prefixIcon: Icon(Icons.email_outlined),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8.0)),
                          ),
                        ),
                        validator: Validator.email,
                      ),
                      const SizedBox(height: 20.0),
                      // Campo de contraseña
                      TextFormField(
                        controller: _passwordController,
                        obscureText: _isObscure,
                        decoration: InputDecoration(
                          labelText: 'Contraseña',
                          prefixIcon: const Icon(Icons.lock_outline),
                          suffixIcon: IconButton(
                            icon: Icon(
                              _isObscure ? Icons.visibility : Icons.visibility_off,
                            ),
                            onPressed: () {
                              setState(() {
                                _isObscure = !_isObscure;
                              });
                            },
                          ),
                          border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8.0)),
                          ),
                        ),
                        validator: Validator.password,
                      ),
                      const SizedBox(height: 20.0),
                      // Campo de confirmar contraseña
                      TextFormField(
                        controller: _confirmPasswordController,
                        obscureText: _isConfirmObscure,
                        decoration: InputDecoration(
                          labelText: 'Confirmar Contraseña',
                          prefixIcon: const Icon(Icons.lock_outline),
                          suffixIcon: IconButton(
                            icon: Icon(
                              _isConfirmObscure ? Icons.visibility : Icons.visibility_off,
                            ),
                            onPressed: () {
                              setState(() {
                                _isConfirmObscure = !_isConfirmObscure;
                              });
                            },
                          ),
                          border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8.0)),
                          ),
                        ),
                        validator: (value) => Validator.confirmPassword(value, _passwordController.text),
                      ),
                      const SizedBox(height: 30.0),
                      // Botón de registro
                      SizedBox(
                        width: double.infinity,
                        height: 50.0,
                        child: ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              // Navegar a la pantalla de bienvenida con los datos
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => WelcomeScreen(
                                    name: _nameController.text,
                                    age: int.parse(_ageController.text),
                                    email: _emailController.text,
                                  ),
                                ),
                              );
                            }
                          },
                          child: const Padding(
                            padding: EdgeInsets.symmetric(vertical: 16.0),
                            child: Text(
                              'Registrarse',
                              style: TextStyle(fontSize: 16.0),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}