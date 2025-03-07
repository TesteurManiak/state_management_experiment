import 'package:flutter/foundation.dart';

mixin HookNotifierMixin on ChangeNotifier {
  final List<ChangeNotifier> _listenables = [];

  N useNotifier<N extends ChangeNotifier>(N notifier) {
    _listenables.add(notifier);
    return notifier;
  }

  @override
  void dispose() {
    for (final l in _listenables) {
      l.dispose();
    }
    super.dispose();
  }
}
