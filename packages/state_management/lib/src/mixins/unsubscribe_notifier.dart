import 'package:flutter/foundation.dart';

/// Mixin that provides functionality to notify when there are no more
/// subscribers listening to the notifier.
mixin UnsubscribeNotifier on ChangeNotifier {
  /// Callback invoked when there are no more subscribers to this notifier.
  VoidCallback? _onUnsubscribed;
  set onUnsubscribed(VoidCallback? callback) => _onUnsubscribed = callback;

  @override
  void removeListener(VoidCallback listener) {
    super.removeListener(listener);
    if (!hasListeners) _onUnsubscribed?.call();
  }
}
