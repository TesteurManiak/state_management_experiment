import 'package:flutter/foundation.dart';

typedef LocatorCreate<T> = T Function();

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

  final LocatorCreate<T> _create;
  final VoidCallback? onDispose;

  LocatorCreate<T>? _override;

  T? _instance;

  @mustCallSuper
  T get instance {
    final creator = _override ?? _create;
    return _instance ??= creator();
  }

  /// Disposes the current instance of the locator.
  ///
  /// Calls the [onDispose] callback if provided and sets the instance to null.
  ///
  /// If accessed again, a new instance will be created using the
  /// [_create] function.
  ///
  /// If you override this method, make sure to call `super.dispose()` last.
  @mustCallSuper
  void dispose() {
    onDispose?.call();
    _instance = null;
  }

  /// Overrides the current instance of the locator with the provided [create]
  /// function.
  ///
  /// {@template locator.override_warning}
  /// **Warning:** This method does not perform any disposal of the existing
  /// instance. Make sure to call [dispose] before overriding if necessary.
  /// {@endtemplate}
  @visibleForTesting
  void overrideWith(LocatorCreate<T> create) {
    _override = create;
    _instance = null;
  }

  /// Overrides the current instance of the locator with the provided [value].
  ///
  /// {@macro locator.override_warning}
  @visibleForTesting
  void overrideWithValue(T value) => overrideWith(() => value);
}
