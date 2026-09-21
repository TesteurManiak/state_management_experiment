import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:state_management/src/mixins/unsubscribe_notifier.dart';
import 'package:state_management/src/notifier_locator.dart';

void main() {
  group('NotifierLocator', () {
    group('autodispose = true', () {
      void emptyListener() {}

      test('should call dispose when there is no more listeners', () async {
        final locator = NotifierLocator(_TestNotifier.new, autodispose: true);
        final notifier = locator.instance;

        expect(notifier.disposed, isFalse);

        notifier.addListener(emptyListener);
        notifier.removeListener(emptyListener);

        // Autodispose is deferred to a microtask to avoid disposing on a
        // transient zero-listener moment (see UnsubscribeNotifier).
        await Future<void>.value();

        expect(notifier.disposed, isTrue);
      });

      test('should create a new notifier after disposal', () async {
        final locator = NotifierLocator(_TestNotifier.new, autodispose: true);
        final notifierA = locator.instance;

        notifierA.addListener(emptyListener);
        notifierA.removeListener(emptyListener);
        await Future<void>.value();

        final notifierB = locator.instance;
        expect(notifierB.disposed, isFalse);
        expect(notifierA, isNot(same(notifierB)));
      });
    });
  });
}

class _TestNotifier extends ChangeNotifier with UnsubscribeNotifier {
  bool _disposed = false;
  bool get disposed => _disposed;

  @override
  void dispose() {
    super.dispose();
    _disposed = true;
  }
}
