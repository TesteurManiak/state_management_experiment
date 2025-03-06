import 'package:flutter/foundation.dart';

typedef LocatorCreate<T> = T Function();

/// A locator that lazily creates an instance of a type [T], accessible through
/// the singleton [instance] getter.
class Locator<T> {
  /// Creates a locator with the provided [create] function.
  Locator(this._create);

  LocatorCreate<T> _create;

  T? _instance;
  T get instance => _instance ??= _create();

  /// Invalidates the current instance of the locator.
  void invalidate() => _instance = null;

  /// Overrides the current instance of the locator with the provided [create]
  /// function.
  @visibleForTesting
  void overrideWith(LocatorCreate<T> create) {
    _create = create;
    invalidate();
  }

  @visibleForTesting
  void overrideWithValue(T value) {
    _create = () => value;
    _instance = value;
  }
}
