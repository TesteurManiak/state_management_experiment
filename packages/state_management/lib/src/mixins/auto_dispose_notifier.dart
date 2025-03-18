import 'package:flutter/foundation.dart';

mixin AutoDisposeNotifier on ChangeNotifier {
  bool _disposed = false;
  bool get disposed => _disposed;

  @override
  void removeListener(VoidCallback listener) {
    super.removeListener(listener);
    if (!hasListeners) dispose();
  }

  @mustCallSuper
  @override
  void dispose() {
    super.dispose();
    _disposed = true;
  }
}
