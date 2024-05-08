import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterFormState> {
  RegisterCubit() : super(RegisterFormState());

  void onSubmit(){
    print('Submit: $state');
  }

  void userChanged(String value){
    emit(state.copyWith(
      user : value
    ));
  }
  void emailChanged(String value){
    emit(state.copyWith(
      email : value
    ));
  }
  void passwdChanged(String value){
    emit(state.copyWith(
      passwd : value
    ));
  }
}
