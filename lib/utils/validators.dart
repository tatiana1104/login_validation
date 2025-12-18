class Validator {
  // Validación del email - correo electronico
  static String? email(String? value) { 

    // Validar si el valor es nulo o esta vacio
    if (value == null || value.isEmpty) return 'El correo es obligatorio';

    // Expresion regular para validar el formato del correo
    final emailRegExp = RegExp(r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$',);

    // si no cumple con el formato
    if (!emailRegExp.hasMatch(value)) return 'Formato de correo invalido'; 
    return null;
  }

  // validar contraseña
  static String? password(String? value) { 

    // si el valor es nulo o esta vacio
    if (value == null || value.isEmpty) return 'La contraseña es obligatoria'; 

    //Validar la longitud minima  caracteres
    if (value.length < 6) return 'Debe tener al menos 6 caracteres';

    //Validar que contenga al menos una Mayuscula
    // La expresion r'[A-Z]' buscar cualquier letra mayuscula del alfabeto ingles
    final hasUpperCase = RegExp(r'[A-Z]');

    // si no contiene ninguna mayuscula
    if (!hasUpperCase.hasMatch(value)) {
      return 'Debe contener al menos una letra mayuscula';
    }

    // Todo esta correcto
    return null;
  }

  // Validar nombre para registro
  static String? name(String? value) {
    if (value == null || value.isEmpty) return 'El nombre es obligatorio';
    if (value.length < 4) return 'El nombre debe tener al menos 4 letras';
    final nameRegExp = RegExp(r'^[a-zA-Z\s]+$');
    if (!nameRegExp.hasMatch(value)) return 'El nombre solo puede contener letras y espacios';
    return null;
  }

  // Validar edad
  static String? age(String? value) {
    if (value == null || value.isEmpty) return 'La edad es obligatoria';
    final age = int.tryParse(value);
    if (age == null) return 'La edad debe ser un número';
    if (age <= 18) return 'Debe ser mayor de 18 años';
    return null;
  }


  // Validar confirmación de contraseña
  static String? confirmPassword(String? value, String? originalPassword) {
    if (value == null || value.isEmpty) return 'La confirmación de contraseña es obligatoria';
    if (value != originalPassword) return 'Las contraseñas no coinciden';
    return null;
  }
}
