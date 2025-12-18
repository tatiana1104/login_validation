import 'package:flutter/material.dart';
import '../utils/validators.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  //clave global para identificar al formulario y validarlo
  final _formKey = GlobalKey<FormState>();

  //variable para controlar la visualidad de la contraseña
  bool _isObscure = true;

  //controladores para los campos de texto (opcional, por si se requiere nviar los datos a un API)
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100], //fondo claro
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(
            24.0,
          ), //espaciado alrededor del formulario
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, //centrar verticalmente
            children: [
              // ----LOGO O TITULO DE BIENVENIDA ----
              const Icon(
                Icons.lock_person_rounded,
                size: 80,
                color: Colors.blue,
              ), //icono de candado
              const SizedBox(height: 20.0), //espacio
              const Text(
                //titulo
                'Bienvenido',
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
              ),
              const Text(
                //subtitulo
                'Inicia sesión para continuar',
                style: TextStyle(fontSize: 16.0, color: Colors.grey),
              ),
              const SizedBox(height: 30.0), //espacio
              // ----FORMULARIO DE LOGIN ----
              Container(
                padding: const EdgeInsets.all(20.0), //espaciado interno
                decoration: BoxDecoration(
                  //decoracion del contenedor
                  color: Colors.white, //fondo blanco
                  borderRadius: BorderRadius.circular(
                    12.0,
                  ), //bordes redondeados
                  boxShadow: [
                    //sombra
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 2, // extensión de la sombra
                      blurRadius: 5, // difuminado de la sombra
                      offset: const Offset(0, 3), // sombra abajo
                    ),
                  ],
                ),

                child: Form(
                  key: _formKey, //asignar la clave global al formulario
                  child: Column(
                    children: [
                      // Campo de correo electronico
                      TextFormField(
                        controller: _emailController, //controlador del campo
                        keyboardType:
                            TextInputType.emailAddress, //tipo de teclado
                        decoration: const InputDecoration(
                          //decoracion del campo
                          labelText: 'Correo Electrónico', //etiqueta
                          prefixIcon: Icon(
                            Icons.email_outlined,
                          ), //icono al inicio del campo
                          border: OutlineInputBorder(
                            //borde del campo
                            borderRadius: BorderRadius.all(
                              Radius.circular(8.0),
                            ),
                          ),
                        ),
                        validator: Validator.email, //validacion del email
                      ),
                      const SizedBox(height: 20.0), //espacio
                      // Campo de contraseña
                      TextFormField(
                        controller: _passwordController, //controlador del campo
                        obscureText: _isObscure, //ocultar texto
                        decoration: InputDecoration(
                          //decoracion del campo
                          labelText: 'Contraseña', //etiqueta
                          prefixIcon: const Icon(
                            Icons.lock_outline,
                          ), //icono al inicio del campo
                          suffixIcon: IconButton(
                            //icono para mostrar/ocultar contraseña
                            icon: Icon(
                              //cambiar icono segun el estado
                              _isObscure
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                            ),
                            onPressed: () {
                              //accion al presionar el icono
                              setState(() {
                                _isObscure = !_isObscure; //cambiar estado
                              });
                            },
                          ),
                          border: const OutlineInputBorder(
                            //borde del campo
                            borderRadius: BorderRadius.all(
                              Radius.circular(8.0),
                            ),
                          ),
                        ),
                        validator:
                            Validator.password, //validacion de la contraseña
                      ),
                      const SizedBox(height: 30.0), //espacio
                      // Boton de inicio de sesion
                      SizedBox(
                        width: double.infinity, //ancho completo
                        height: 50.0, //alto del boton
                        child: ElevatedButton(
                          //boton elevado
                          onPressed: () {
                            // Validar el formulario
                            if (_formKey.currentState!.validate()) {
                              // Si es valido, mostrar un snackbar (o proceder con el login)
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                    'Formulario válido. Procesando...',
                                  ), //mensaje
                                  backgroundColor:
                                      Colors.green, //color de fondo
                                ),
                              );

                              //aquí llamamos a tu servicio de autenticación o API
                            }
                          },
                          child: const Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: 16.0,
                            ), //espaciado vertical
                            child: Text( 
                              'Iniciar Sesión', //texto del boton
                              style: TextStyle(
                                fontSize: 16.0
                                ),
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
