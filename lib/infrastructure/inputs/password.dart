import 'package:formz/formz.dart';

// Define input validation errors
enum PasswordError { empty, length }

// Extend FormzInput and provide the input type and error type.
class Password extends FormzInput<String, PasswordError> {
  // Call super.pure to represent an unmodified form input.
  const Password.pure() : super.pure('');

  // Call super.dirty to represent a modified form input.
  // como va a cambiar el valor
  const Password.dirty(String value) : super.dirty(value);

  String? get errorMessage{
    if(isValid || isPure) return null;

    if(displayError == PasswordError.empty) return 'Campo requerido';
    if(displayError == PasswordError.length) return 'Mínimo seis caracteres.';
    
    return null;
  }


  // Override validator to handle validating a given input value.
  @override
  PasswordError? validator(String value) {

    if (value.isEmpty || value.trim().isEmpty) return PasswordError.empty;
    if ( value.length < 6) return PasswordError.length;
    // si es nulo es que paso todas las validaciones
    return value.isEmpty ? PasswordError.empty : null;
  }
}