import 'package:flutter/foundation.dart';

/// {@template multi_listenable_notifier}
/// A [ChangeNotifier] that listens to multiple [Listenable] objects and
/// notifies its listeners when any of the listened objects change.
/// {@endtemplate}
class MultiListenableNotifier extends ChangeNotifier {
  /// {@macro multi_listenable_notifier}
  MultiListenableNotifier(this._listenables) {
    for (final listenable in _listenables) {
      listenable.addListener(notifyListeners);
    }
  }

  final List<Listenable> _listenables;

  @override
  void dispose() {
    for (final listenable in _listenables) {
      listenable.removeListener(notifyListeners);
    }
    super.dispose();
  }
}
