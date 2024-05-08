part of 'register_cubit.dart';

// enumeracion de los estados que puede tener el formulario
enum FormStatus {invalid, valid, validating, posting}
class RegisterFormState extends Equatable {
  final FormStatus formStatus;
  final String user;
  final String email;
  final String passwd;

  const RegisterFormState({
    this.formStatus = FormStatus.invalid, 
    this.user = '', 
    this.email = '',
    this.passwd = ''});

  RegisterFormState copyWith({
  FormStatus? formStatus,
  String? user,
  String? email,
  String? passwd,
  }) => RegisterFormState(
  formStatus: formStatus ?? this.formStatus,
  user: user ?? this.user,
  email: email ?? this.email,
  passwd: passwd ?? this.passwd

  );

  @override
  List<Object> get props => [formStatus, user, email, passwd];
}


