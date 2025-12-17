import 'package:flutter/foundation.dart';

/// A [ChangeNotifier] mixin that automatically disposes itself
/// when it has no more listeners.
mixin AutoDisposeNotifier on ChangeNotifier {
  bool _disposed = false;
  bool get disposed => _disposed;

  @mustCallSuper
  @override
  void removeListener(VoidCallback listener) {
    super.removeListener(listener);
    if (!hasListeners) dispose();
  }

  @mustCallSuper
  @override
  void dispose() {
    if (_disposed) return;
    super.dispose();
    _disposed = true;
  }
}
