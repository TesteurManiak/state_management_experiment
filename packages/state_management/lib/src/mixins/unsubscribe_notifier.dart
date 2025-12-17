import 'package:flutter/foundation.dart';

/// A [ChangeNotifier] mixin that provides functionality to notify when there
/// are no more subscribers listening to it.
mixin UnsubscribeNotifier on ChangeNotifier {
  /// Callback invoked when there are no more subscribers to this notifier.
  VoidCallback? _onUnsubscribed;
  set onUnsubscribed(VoidCallback? callback) => _onUnsubscribed = callback;

  @mustCallSuper
  @override
  void removeListener(VoidCallback listener) {
    super.removeListener(listener);
    if (!hasListeners) _onUnsubscribed?.call();
  }
}
