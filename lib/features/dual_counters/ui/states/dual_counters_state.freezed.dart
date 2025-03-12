// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dual_counters_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DualCountersState {
  int get counter1;
  int get counter2;

  /// Create a copy of DualCountersState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DualCountersStateCopyWith<DualCountersState> get copyWith =>
      _$DualCountersStateCopyWithImpl<DualCountersState>(
          this as DualCountersState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DualCountersState &&
            (identical(other.counter1, counter1) ||
                other.counter1 == counter1) &&
            (identical(other.counter2, counter2) ||
                other.counter2 == counter2));
  }

  @override
  int get hashCode => Object.hash(runtimeType, counter1, counter2);

  @override
  String toString() {
    return 'DualCountersState(counter1: $counter1, counter2: $counter2)';
  }
}

/// @nodoc
abstract mixin class $DualCountersStateCopyWith<$Res> {
  factory $DualCountersStateCopyWith(
          DualCountersState value, $Res Function(DualCountersState) _then) =
      _$DualCountersStateCopyWithImpl;
  @useResult
  $Res call({int counter1, int counter2});
}

/// @nodoc
class _$DualCountersStateCopyWithImpl<$Res>
    implements $DualCountersStateCopyWith<$Res> {
  _$DualCountersStateCopyWithImpl(this._self, this._then);

  final DualCountersState _self;
  final $Res Function(DualCountersState) _then;

  /// Create a copy of DualCountersState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? counter1 = null,
    Object? counter2 = null,
  }) {
    return _then(_self.copyWith(
      counter1: null == counter1
          ? _self.counter1
          : counter1 // ignore: cast_nullable_to_non_nullable
              as int,
      counter2: null == counter2
          ? _self.counter2
          : counter2 // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _DualCountersState implements DualCountersState {
  const _DualCountersState({this.counter1 = 0, this.counter2 = 0});

  @override
  @JsonKey()
  final int counter1;
  @override
  @JsonKey()
  final int counter2;

  /// Create a copy of DualCountersState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$DualCountersStateCopyWith<_DualCountersState> get copyWith =>
      __$DualCountersStateCopyWithImpl<_DualCountersState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _DualCountersState &&
            (identical(other.counter1, counter1) ||
                other.counter1 == counter1) &&
            (identical(other.counter2, counter2) ||
                other.counter2 == counter2));
  }

  @override
  int get hashCode => Object.hash(runtimeType, counter1, counter2);

  @override
  String toString() {
    return 'DualCountersState(counter1: $counter1, counter2: $counter2)';
  }
}

/// @nodoc
abstract mixin class _$DualCountersStateCopyWith<$Res>
    implements $DualCountersStateCopyWith<$Res> {
  factory _$DualCountersStateCopyWith(
          _DualCountersState value, $Res Function(_DualCountersState) _then) =
      __$DualCountersStateCopyWithImpl;
  @override
  @useResult
  $Res call({int counter1, int counter2});
}

/// @nodoc
class __$DualCountersStateCopyWithImpl<$Res>
    implements _$DualCountersStateCopyWith<$Res> {
  __$DualCountersStateCopyWithImpl(this._self, this._then);

  final _DualCountersState _self;
  final $Res Function(_DualCountersState) _then;

  /// Create a copy of DualCountersState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? counter1 = null,
    Object? counter2 = null,
  }) {
    return _then(_DualCountersState(
      counter1: null == counter1
          ? _self.counter1
          : counter1 // ignore: cast_nullable_to_non_nullable
              as int,
      counter2: null == counter2
          ? _self.counter2
          : counter2 // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

// dart format on
