import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:forms_app/infrastructure/inputs/inputs.dart';
import 'package:forms_app/infrastructure/inputs/password.dart';
import 'package:formz/formz.dart';


part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterFormState> {
  RegisterCubit() : super(RegisterFormState());

  void onSubmit(){
    emit(state.copyWith(
      formStatus: FormStatus.validating,
      user: Username.dirty(state.user.value),
      email: Email.dirty(state.email.value),
      passwd: Password.dirty(state.passwd.value),

      isValid: Formz.validate([
        state.user,
        state.passwd,
        state.email
      ])
    ));
    print(state.isValid);
  }

  void userChanged(String value){
    final user = Username.dirty(value);

    emit(state.copyWith(
      user : user,
      isValid: Formz.validate([ user, state.email, state.passwd ])
    ));
  }
  void emailChanged(String value){
    final email = Email.dirty(value);

    emit(state.copyWith(
      email : email,
      isValid: Formz.validate([ state.user, email, state.passwd ])
    ));
  }
  void passwdChanged(String value){
    final password = Password.dirty(value);

    emit(state.copyWith(
      passwd : password,
      isValid: Formz.validate([ state.user,state.email, password ])
    ));
  }
}
