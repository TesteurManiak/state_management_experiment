import 'package:state_management/state_management.dart';

import '../states/dual_counters_state.dart';

class DualCountersViewModel extends ViewModel<DualCountersState> {
  DualCountersViewModel() : super(const DualCountersState());

  void reset() => state = const DualCountersState();

  void incrementFirstCounter() =>
      state = state.copyWith(counter1: state.counter1 + 1);

  void incrementSecondCounter() =>
      state = state.copyWith(counter2: state.counter2 + 1);
}
