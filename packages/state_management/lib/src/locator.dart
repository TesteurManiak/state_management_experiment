import 'package:flutter/foundation.dart';

typedef LocatorCreate<T> = T Function();
typedef OnDisposeCallback<T> = void Function(T value);

/// A service locator that lazily creates an instance of a type [T], accessible
/// through the singleton [instance] getter.
///
/// You can provide an optional [onDispose] callback that will be called
/// when the locator is invalidated using the [invalidate] method.
///
/// It can be overridden for testing purposes using the
/// [overrideWith] and [overrideWithValue] methods.
class Locator<T> {
  /// Creates a locator with the provided [create] function.
  Locator(this._create, {this.onDispose});

  LocatorCreate<T> _create;
  final OnDisposeCallback<T>? onDispose;

  T? _instance;
  T get instance => _instance ??= _create();

  /// Invalidates the current instance of the locator.
  ///
  /// If accessed again, a new instance will be created using the
  /// [_create] function.
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
