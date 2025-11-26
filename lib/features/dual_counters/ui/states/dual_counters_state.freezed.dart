// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
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

 int get counter1; int get counter2;
/// Create a copy of DualCountersState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DualCountersStateCopyWith<DualCountersState> get copyWith => _$DualCountersStateCopyWithImpl<DualCountersState>(this as DualCountersState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DualCountersState&&(identical(other.counter1, counter1) || other.counter1 == counter1)&&(identical(other.counter2, counter2) || other.counter2 == counter2));
}


@override
int get hashCode => Object.hash(runtimeType,counter1,counter2);

@override
String toString() {
  return 'DualCountersState(counter1: $counter1, counter2: $counter2)';
}


}

/// @nodoc
abstract mixin class $DualCountersStateCopyWith<$Res>  {
  factory $DualCountersStateCopyWith(DualCountersState value, $Res Function(DualCountersState) _then) = _$DualCountersStateCopyWithImpl;
@useResult
$Res call({
 int counter1, int counter2
});




}
/// @nodoc
class _$DualCountersStateCopyWithImpl<$Res>
    implements $DualCountersStateCopyWith<$Res> {
  _$DualCountersStateCopyWithImpl(this._self, this._then);

  final DualCountersState _self;
  final $Res Function(DualCountersState) _then;

/// Create a copy of DualCountersState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? counter1 = null,Object? counter2 = null,}) {
  return _then(_self.copyWith(
counter1: null == counter1 ? _self.counter1 : counter1 // ignore: cast_nullable_to_non_nullable
as int,counter2: null == counter2 ? _self.counter2 : counter2 // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [DualCountersState].
extension DualCountersStatePatterns on DualCountersState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DualCountersState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DualCountersState() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DualCountersState value)  $default,){
final _that = this;
switch (_that) {
case _DualCountersState():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DualCountersState value)?  $default,){
final _that = this;
switch (_that) {
case _DualCountersState() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int counter1,  int counter2)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DualCountersState() when $default != null:
return $default(_that.counter1,_that.counter2);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int counter1,  int counter2)  $default,) {final _that = this;
switch (_that) {
case _DualCountersState():
return $default(_that.counter1,_that.counter2);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int counter1,  int counter2)?  $default,) {final _that = this;
switch (_that) {
case _DualCountersState() when $default != null:
return $default(_that.counter1,_that.counter2);case _:
  return null;

}
}

}

/// @nodoc


class _DualCountersState implements DualCountersState {
  const _DualCountersState({this.counter1 = 0, this.counter2 = 0});
  

@override@JsonKey() final  int counter1;
@override@JsonKey() final  int counter2;

/// Create a copy of DualCountersState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DualCountersStateCopyWith<_DualCountersState> get copyWith => __$DualCountersStateCopyWithImpl<_DualCountersState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DualCountersState&&(identical(other.counter1, counter1) || other.counter1 == counter1)&&(identical(other.counter2, counter2) || other.counter2 == counter2));
}


@override
int get hashCode => Object.hash(runtimeType,counter1,counter2);

@override
String toString() {
  return 'DualCountersState(counter1: $counter1, counter2: $counter2)';
}


}

/// @nodoc
abstract mixin class _$DualCountersStateCopyWith<$Res> implements $DualCountersStateCopyWith<$Res> {
  factory _$DualCountersStateCopyWith(_DualCountersState value, $Res Function(_DualCountersState) _then) = __$DualCountersStateCopyWithImpl;
@override @useResult
$Res call({
 int counter1, int counter2
});




}
/// @nodoc
class __$DualCountersStateCopyWithImpl<$Res>
    implements _$DualCountersStateCopyWith<$Res> {
  __$DualCountersStateCopyWithImpl(this._self, this._then);

  final _DualCountersState _self;
  final $Res Function(_DualCountersState) _then;

/// Create a copy of DualCountersState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? counter1 = null,Object? counter2 = null,}) {
  return _then(_DualCountersState(
counter1: null == counter1 ? _self.counter1 : counter1 // ignore: cast_nullable_to_non_nullable
as int,counter2: null == counter2 ? _self.counter2 : counter2 // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
