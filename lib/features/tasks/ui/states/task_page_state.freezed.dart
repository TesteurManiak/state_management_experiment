// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'task_page_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TaskPageState {
  List<Task> get todoTasks;
  List<Task> get archivedTasks;
  bool get isLoading;

  /// Create a copy of TaskPageState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $TaskPageStateCopyWith<TaskPageState> get copyWith =>
      _$TaskPageStateCopyWithImpl<TaskPageState>(
          this as TaskPageState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TaskPageState &&
            const DeepCollectionEquality().equals(other.todoTasks, todoTasks) &&
            const DeepCollectionEquality()
                .equals(other.archivedTasks, archivedTasks) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(todoTasks),
      const DeepCollectionEquality().hash(archivedTasks),
      isLoading);

  @override
  String toString() {
    return 'TaskPageState(todoTasks: $todoTasks, archivedTasks: $archivedTasks, isLoading: $isLoading)';
  }
}

/// @nodoc
abstract mixin class $TaskPageStateCopyWith<$Res> {
  factory $TaskPageStateCopyWith(
          TaskPageState value, $Res Function(TaskPageState) _then) =
      _$TaskPageStateCopyWithImpl;
  @useResult
  $Res call({List<Task> todoTasks, List<Task> archivedTasks, bool isLoading});
}

/// @nodoc
class _$TaskPageStateCopyWithImpl<$Res>
    implements $TaskPageStateCopyWith<$Res> {
  _$TaskPageStateCopyWithImpl(this._self, this._then);

  final TaskPageState _self;
  final $Res Function(TaskPageState) _then;

  /// Create a copy of TaskPageState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? todoTasks = null,
    Object? archivedTasks = null,
    Object? isLoading = null,
  }) {
    return _then(_self.copyWith(
      todoTasks: null == todoTasks
          ? _self.todoTasks
          : todoTasks // ignore: cast_nullable_to_non_nullable
              as List<Task>,
      archivedTasks: null == archivedTasks
          ? _self.archivedTasks
          : archivedTasks // ignore: cast_nullable_to_non_nullable
              as List<Task>,
      isLoading: null == isLoading
          ? _self.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _TaskPageState implements TaskPageState {
  const _TaskPageState(
      {final List<Task> todoTasks = const [],
      final List<Task> archivedTasks = const [],
      this.isLoading = true})
      : _todoTasks = todoTasks,
        _archivedTasks = archivedTasks;

  final List<Task> _todoTasks;
  @override
  @JsonKey()
  List<Task> get todoTasks {
    if (_todoTasks is EqualUnmodifiableListView) return _todoTasks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_todoTasks);
  }

  final List<Task> _archivedTasks;
  @override
  @JsonKey()
  List<Task> get archivedTasks {
    if (_archivedTasks is EqualUnmodifiableListView) return _archivedTasks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_archivedTasks);
  }

  @override
  @JsonKey()
  final bool isLoading;

  /// Create a copy of TaskPageState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$TaskPageStateCopyWith<_TaskPageState> get copyWith =>
      __$TaskPageStateCopyWithImpl<_TaskPageState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TaskPageState &&
            const DeepCollectionEquality()
                .equals(other._todoTasks, _todoTasks) &&
            const DeepCollectionEquality()
                .equals(other._archivedTasks, _archivedTasks) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_todoTasks),
      const DeepCollectionEquality().hash(_archivedTasks),
      isLoading);

  @override
  String toString() {
    return 'TaskPageState(todoTasks: $todoTasks, archivedTasks: $archivedTasks, isLoading: $isLoading)';
  }
}

/// @nodoc
abstract mixin class _$TaskPageStateCopyWith<$Res>
    implements $TaskPageStateCopyWith<$Res> {
  factory _$TaskPageStateCopyWith(
          _TaskPageState value, $Res Function(_TaskPageState) _then) =
      __$TaskPageStateCopyWithImpl;
  @override
  @useResult
  $Res call({List<Task> todoTasks, List<Task> archivedTasks, bool isLoading});
}

/// @nodoc
class __$TaskPageStateCopyWithImpl<$Res>
    implements _$TaskPageStateCopyWith<$Res> {
  __$TaskPageStateCopyWithImpl(this._self, this._then);

  final _TaskPageState _self;
  final $Res Function(_TaskPageState) _then;

  /// Create a copy of TaskPageState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? todoTasks = null,
    Object? archivedTasks = null,
    Object? isLoading = null,
  }) {
    return _then(_TaskPageState(
      todoTasks: null == todoTasks
          ? _self._todoTasks
          : todoTasks // ignore: cast_nullable_to_non_nullable
              as List<Task>,
      archivedTasks: null == archivedTasks
          ? _self._archivedTasks
          : archivedTasks // ignore: cast_nullable_to_non_nullable
              as List<Task>,
      isLoading: null == isLoading
          ? _self.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

// dart format on
