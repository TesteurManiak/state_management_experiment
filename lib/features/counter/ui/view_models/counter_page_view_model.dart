import 'package:state_management/state_management.dart';

import '../states/counter_state.dart';

class CounterPageViewModel extends ViewModel<CounterState> {
  CounterPageViewModel() : super(const CounterState());

  void increment() => state = state.copyWith(counter: state.counter + 1);
  void decrement() => state = state.copyWith(counter: state.counter - 1);
}
