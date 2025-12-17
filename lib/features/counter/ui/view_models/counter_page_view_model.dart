import 'package:state_management/state_management.dart';

import '../states/counter_state.dart';

class CounterPageNotifier extends ViewNotifier<CounterState> {
  CounterPageNotifier() : super(const CounterState());

  void increment() => state = state.copyWith(counter: state.counter + 1);
  void decrement() => state = state.copyWith(counter: state.counter - 1);
}
