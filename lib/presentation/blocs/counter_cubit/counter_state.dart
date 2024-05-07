part of 'counter_cubit.dart';

class CounterState extends Equatable{
  final int counter;
  final int transactionCount;

  const CounterState({
    this.counter = 0, 
    this.transactionCount = 0
    });

  copyWith({
    int? counter,
    int? transactionCount,
    }) => CounterState(
          counter: counter ?? this.counter,
          transactionCount: transactionCount ?? this.transactionCount
        );
  
  // aqui especificamos cuales seran los objetos a verifricar 
  //que los valores sean iguales
  // (no entre ellos, pero contra otros valores)
  @override
  List<Object> get props => [counter, transactionCount];
}
