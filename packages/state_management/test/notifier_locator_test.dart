import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:state_management/src/mixins/unsubscribe_notifier.dart';
import 'package:state_management/src/notifier_locator.dart';

void main() {
  group('NotifierLocator', () {
    group('autodispose = true', () {
      void emptyListener() {}

      test('should call dispose when there is no more listeners', () {
        final locator = NotifierLocator(_TestNotifier.new, autodispose: true);
        final notifier = locator.instance;

        expect(notifier.disposed, isFalse);

        notifier.addListener(emptyListener);
        notifier.removeListener(emptyListener);

        expect(notifier.disposed, isTrue);
      });

      test('should create a new notifier after disposal', () {
        final locator = NotifierLocator(_TestNotifier.new, autodispose: true);
        final notifierA = locator.instance;

        notifierA.addListener(emptyListener);
        notifierA.removeListener(emptyListener);

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
