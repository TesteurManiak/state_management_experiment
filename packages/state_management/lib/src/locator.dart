import 'package:flutter/foundation.dart';

typedef LocatorCreate<T> = T Function();
typedef OnDisposeCallback<T> = void Function(T value);

/// A locator that lazily creates an instance of a type [T], accessible through
/// the singleton [instance] getter.
class Locator<T> {
  /// Creates a locator with the provided [create] function.
  Locator(this._create, {this.onDispose});

  LocatorCreate<T> _create;
  final OnDisposeCallback<T>? onDispose;

  T? _instance;
  T get instance => _instance ??= _create();

  /// Invalidates the current instance of the locator.
  void invalidate() {
    onDispose?.call(instance);
    _instance = null;
  }

  /// Overrides the current instance of the locator with the provided [create]
  /// function.
  @visibleForTesting
  void overrideWith(LocatorCreate<T> create) {
    invalidate();
    _create = create;
  }

  /// Overrides the current instance of the locator with the provided [value].
  @visibleForTesting
  void overrideWithValue(T value) {
    invalidate();
    _create = () => value;
    _instance = value;
  }
}
