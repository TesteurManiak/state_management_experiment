import 'package:flutter/widgets.dart';

extension WatchListenableExtension on BuildContext {
  /// Watches a [Listenable] and rebuilds the widget when it changes.
  void watch(Listenable listenable) {
    void watchListener() {
      if (this case final Element element
          when element.mounted && !element.dirty) {
        if (element.dirty) return;
        // Trigger widget rebuild
        element.markNeedsBuild();
      }
    }

    listenable.addListener(watchListener);
  }
}
