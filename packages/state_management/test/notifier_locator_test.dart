import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:state_management/src/mixins/unsubscribe_notifier.dart';
import 'package:state_management/src/notifier_locator.dart';

void main() {
  group('NotifierLocator', () {
    group('autodispose', () {
      test('should call dispose when there is no more listeners', () {
        final locator = NotifierLocator(
          _DisposableNotifier.new,
          autodispose: true,
        );
        final notifier = locator.instance;

        expect(notifier.disposed, isFalse);

        void emptyListener() {}
        notifier.addListener(emptyListener);
        notifier.removeListener(emptyListener);

        expect(notifier.disposed, isTrue);
      });
    });
  });
}

class _DisposableNotifier extends ChangeNotifier with UnsubscribeNotifier {
  bool _disposed = false;
  bool get disposed => _disposed;

  @override
  void dispose() {
    super.dispose();
    _disposed = true;
  }
}
