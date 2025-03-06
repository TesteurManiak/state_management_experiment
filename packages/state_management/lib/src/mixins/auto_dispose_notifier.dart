import 'package:flutter/foundation.dart';

/// Allow for a [ChangeNotifier] to be automatically disposed when no listeners
/// are attached.
mixin AutoDisposeNotifierMixin on ChangeNotifier {
  bool _disposed = false;
  bool get disposed => _disposed;

  @override
  void removeListener(VoidCallback listener) {
    super.removeListener(listener);
    if (!hasListeners) {
      dispose();
    }
  }

  @override
  void dispose() {
    if (_disposed) return;
    super.dispose();
    _disposed = true;
  }
}
