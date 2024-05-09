part of 'register_cubit.dart';

// enumeracion de los estados que puede tener el formulario
enum FormStatus {invalid, valid, validating, posting}
class RegisterFormState extends Equatable {
  final FormStatus formStatus;
  final bool isValid;
  final Username user;
  final Email email;
  final Password passwd;

  const RegisterFormState({
    this.formStatus = FormStatus.invalid, 
    this.isValid = false,
    this.user = const Username.pure(), 
    this.email = const Email.pure(),
    this.passwd = const Password.pure()});

  RegisterFormState copyWith({
  FormStatus? formStatus,
  bool? isValid,
  Username? user,
  Email? email,
  Password? passwd,
  }) => RegisterFormState(
  formStatus: formStatus ?? this.formStatus,
  isValid : isValid ?? this.isValid,
  user: user ?? this.user,
  email: email ?? this.email,
  passwd: passwd ?? this.passwd

  );

  @override
  List<Object> get props => [formStatus, isValid, user, email, passwd];
}


