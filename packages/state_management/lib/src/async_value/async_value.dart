sealed class AsyncValue<T> {
  const AsyncValue();

  T? get valueOrNull => switch (this) {
        AsyncData(:final value) => value,
        AsyncLoading(:final value) => value,
        AsyncError(:final value) => value,
      };

  bool get hasData => valueOrNull != null;
}

class AsyncData<T> extends AsyncValue<T> {
  const AsyncData(this.value);

  final T value;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is AsyncData<T> && other.value == value);
  }

  @override
  int get hashCode => Object.hash(runtimeType, value);
}

class AsyncLoading<T> extends AsyncValue<T> {
  const AsyncLoading({this.value});

  final T? value;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is AsyncLoading<T> && other.value == value);
  }

  @override
  int get hashCode => Object.hash(runtimeType, value);
}

class AsyncError<T> extends AsyncValue<T> {
  const AsyncError(
    this.error, {
    this.stackTrace,
    this.value,
  });

  final Object error;
  final StackTrace? stackTrace;
  final T? value;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is AsyncError<T> &&
            other.error == error &&
            other.stackTrace == stackTrace &&
            other.value == value);
  }

  @override
  int get hashCode => Object.hash(runtimeType, error, stackTrace, value);
}
