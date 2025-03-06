import 'dart:async';

import 'package:flutter/foundation.dart';

mixin HookNotifierMixin on ChangeNotifier {
  final List<StreamSubscription> _subscriptions = [];
  final List<ChangeNotifier> _listenables = [];

  void willClose(StreamSubscription subscription) {
    _subscriptions.add(subscription);
  }

  N useNotifier<N extends ChangeNotifier>(N notifier) {
    _listenables.add(notifier);
    return notifier;
  }

  @override
  void dispose() {
    for (final s in _subscriptions) {
      s.cancel();
    }
    for (final l in _listenables) {
      l.dispose();
    }
    super.dispose();
  }
}
