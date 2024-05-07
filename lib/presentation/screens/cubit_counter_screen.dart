import 'package:flutter/material.dart';
import 'package:forms_app/presentation/blocs/counter_cubit/counter_cubit.dart';
// OJO importacion necesaria :
import 'package:flutter_bloc/flutter_bloc.dart';

class CubitCounterScreen extends StatelessWidget {
  static const String name = 'cubits';
  const CubitCounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => CounterCubit(), child: const _CubitCounterView());
  }
}

class _CubitCounterView extends StatelessWidget {
  const _CubitCounterView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final cubitRef = context.watch<CounterCubit>();
    // context.select(CounterCubit value);
    return Scaffold(
      appBar: AppBar(
        title: Text('Transaction counter: ${cubitRef.state.transactionCount}'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () => {
              cubitRef.reset()
            },
            icon: const Icon(Icons.refresh),
          )
        ],
      ),
      body: Center(
        child: BlocBuilder<CounterCubit, CounterState>(
          builder: (context, state) {
            print('cambio counter');
            return Text(
              'Counter value: ${state.counter}',
              style: const TextStyle(fontSize: 28),
            );
          },
        ),
      ),
      floatingActionButton: const Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          IncrementButton(
            value: 1,
          ),
          SizedBox(
            height: 15,
          ),
          IncrementButton(
            value: 2,
          ),
          SizedBox(
            height: 15,
          ),
          IncrementButton(
            value: 3,
          ),
        ],
      ),
      // floatingActionButton: ,
    );
  }
}

class IncrementButton extends StatelessWidget {
  final int value;

  const IncrementButton({super.key, this.value = 0});

  @override
  Widget build(BuildContext context) {
    final cubitRef = context.watch<CounterCubit>();
    return FloatingActionButton(
      onPressed: () {
        cubitRef.increaseBy(value);
      },
      heroTag: '${value}',
      child: Text(
        '+$value',
        style: TextStyle(fontSize: 20),
      ),
    );
  }
}
