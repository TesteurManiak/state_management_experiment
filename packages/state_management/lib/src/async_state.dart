sealed class AsyncState<State> {
  const AsyncState();

  const factory AsyncState.data(State value) = AsyncData<State>;

  const factory AsyncState.error({
    required Object error,
    StackTrace? stackTrace,
    State? value,
  }) = AsyncError<State>;

  const factory AsyncState.loading({State? value}) = AsyncLoading<State>;

  State? get valueOrNull => switch (this) {
    AsyncData<State>(:final value) => value,
    AsyncError<State>(:final value) => value,
    AsyncLoading<State>(:final value) => value,
  };
}

final class const AsyncData<State>(final State value)
    extends AsyncState<State> {
  @override
  int get hashCode => Object.hash(runtimeType, value);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AsyncData<State> && other.value == value);
}

final class const AsyncError<State>({
  required final Object error,
  final StackTrace? stackTrace,
  final State? value,
}) extends AsyncState<State> {
  @override
  int get hashCode => Object.hash(runtimeType, error, stackTrace, value);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AsyncError<State> &&
          other.error == error &&
          other.stackTrace == stackTrace &&
          other.value == value);
}

final class const AsyncLoading<State>({final State? value})
    extends AsyncState<State> {
  @override
  int get hashCode => Object.hash(runtimeType, value);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AsyncLoading<State> && other.value == value);
}
