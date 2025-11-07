import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

extension WatchListenableExtension on BuildContext {
  /// Watches a [ValueListenable] and rebuilds the widget when it changes.
  T watch<T>(ValueListenable<T> listenable) {
    void watchListener() {
      final element = this;
      if (element is! Element || !element.mounted || element.dirty) {
        // If the element is no longer mounted, remove the listener
        listenable.removeListener(watchListener);
        return;
      }

      // Trigger a rebuild
      element.markNeedsBuild();
    }

    listenable.addListener(watchListener);

    return listenable.value;
  }
}
