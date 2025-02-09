import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ict_final/counter_cubit/counter_states.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterInitial());

  int counter = 0;

  void incrementCounter() {
    counter++;
    log(counter.toString());
    emit(CounterIncrementState());
  }

  void decrementCounter() {
    if (counter > 0) {
      counter--;
    }
    log(counter.toString());

    emit(CounterDecrementState());
  }
}
