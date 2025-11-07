import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

extension WatchListenableExtension on BuildContext {
  /// Watches a [Listenable] and rebuilds the widget when it changes.
  T watch<T>(ValueListenable<T> listenable) {
    void watchListener() {
      if (this case final Element element
          when element.mounted && !element.dirty) {
        if (element.dirty) return;
        // Trigger widget rebuild
        element.markNeedsBuild();
      }
    }

    // Remove previous listener to avoid multiple registrations
    listenable.addListener(watchListener);

    return listenable.value;
  }
}
