import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ict_final/counter_cubit/counter_cubit.dart';
import 'package:ict_final/counter_cubit/counter_states.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterCubit(),
      child: BlocBuilder<CounterCubit, CounterState>(
        builder: (context, state) {
          // Object from our cubit
          CounterCubit counterCubit = context.read<CounterCubit>();

          return Scaffold(
            appBar: AppBar(
              title: Text("Counter Screen"),
            ),
            body: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    iconSize: 45,
                    onPressed: () {
                      counterCubit.decrementCounter();
                    },
                    icon: Icon(Icons.remove),
                  ),
                  Text("${counterCubit.counter}",
                      style: TextStyle(fontSize: 45)),
                  IconButton(
                    iconSize: 45,
                    onPressed: () {
                      counterCubit.incrementCounter();
                    },
                    icon: Icon(Icons.add),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
