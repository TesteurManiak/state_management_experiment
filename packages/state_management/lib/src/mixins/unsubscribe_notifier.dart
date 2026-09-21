import 'dart:async';

import 'package:flutter/foundation.dart';

/// A [ChangeNotifier] mixin that provides functionality to notify when there
/// are no more subscribers listening to it.
mixin UnsubscribeNotifier on ChangeNotifier {
  /// Callback invoked when there are no more subscribers to this notifier.
  VoidCallback? _onUnsubscribed;
  set onUnsubscribed(VoidCallback? callback) => _onUnsubscribed = callback;

  bool _disposed = false;

  @mustCallSuper
  @override
  void removeListener(VoidCallback listener) {
    super.removeListener(listener);
    // Defer the check to the next microtask: a listener removed as part of a
    // rebuild (e.g. widget reparenting) is often re-added before this turn
    // ends, so re-check `hasListeners` instead of disposing immediately.
    if (!hasListeners) scheduleMicrotask(_notifyIfStillUnsubscribed);
  }

  @mustCallSuper
  @override
  void dispose() {
    _disposed = true;
    super.dispose();
  }

  void _notifyIfStillUnsubscribed() {
    if (!_disposed && !hasListeners) _onUnsubscribed?.call();
  }
}
