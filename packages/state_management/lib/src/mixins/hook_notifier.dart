import 'package:flutter/foundation.dart';

/// A [ChangeNotifier] mixin that allows to instanciate child notifiers that
/// will be disposed when the parent notifier is disposed.
mixin HookNotifierMixin on ChangeNotifier {
  final _hooks = <ChangeNotifier>[];

  N useNotifier<N extends ChangeNotifier>(N notifier) {
    _hooks.add(notifier);
    return notifier;
  }

  @override
  void dispose() {
    for (final l in _hooks) {
      l.dispose();
    }
    super.dispose();
  }
}
