import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

extension ValueListenableWatchExtension<T> on ValueListenable<T> {
  /// Watches a [ValueListenable] and binds it to the [context] to rebuilds the
  /// widget when its value changes.
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
