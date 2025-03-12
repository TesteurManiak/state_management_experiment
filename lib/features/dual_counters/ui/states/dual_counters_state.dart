import 'package:freezed_annotation/freezed_annotation.dart';

part 'dual_counters_state.freezed.dart';

@freezed
abstract class DualCountersState with _$DualCountersState {
  const factory DualCountersState({
    @Default(0) int counter1,
    @Default(0) int counter2,
  }) = _DualCountersState;
}
