import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

extension ValueListenableWatchExtension<T> on ValueListenable<T> {
  /// Watches a [ValueListenable] and rebuilds the widget when it changes.
  T watch(BuildContext context) {
    void watchListener() {
      if (context is! Element || !context.mounted || context.dirty) {
        // If the element is no longer mounted, remove the listener
        removeListener(watchListener);
        return;
      }

      // Trigger a rebuild
      context.markNeedsBuild();
    }

    addListener(watchListener);

    return value;
  }
}
