import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
// ignore: unused_import
import 'package:meta/meta.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(const CounterState(counter: 3));

  void increaseBy(int newValue) {
    emit(state.copyWith(
        counter: state.counter + newValue,
        transactionCount: state.transactionCount + 1));
  }

  void reset() {
    emit(state.copyWith(counter: 0));
  }
}
