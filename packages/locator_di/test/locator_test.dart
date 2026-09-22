import 'package:flutter_test/flutter_test.dart';
import 'package:locator_di/locator_di.dart';

class const _Service();

void main() {
  group('Locator', () {
    test('lazily creates a single cached instance', () {
      var creationCount = 0;
      final locator = Locator<_Service>(() {
        creationCount++;
        return _Service();
      });

      expect(creationCount, 0);

      final first = locator.instance;
      expect(creationCount, 1);

      final second = locator.instance;
      expect(creationCount, 1);
      expect(identical(first, second), isTrue);
    });

    test('dispose releases the cached instance so a new one is created', () {
      var creationCount = 0;
      final locator = Locator<_Service>(() {
        creationCount++;
        return _Service();
      });

      final first = locator.instance;
      expect(creationCount, 1);

      locator.dispose();

      final second = locator.instance;
      expect(creationCount, 2);
      // A distinct object means the locator held no strong reference to
      // `first` after dispose, so it was free to be garbage collected.
      expect(identical(first, second), isFalse);
    });

    test('dispose invokes onDispose exactly once', () {
      var disposeCount = 0;
      final locator = Locator<_Service>(
        _Service.new,
        onDispose: () => disposeCount++,
      );

      locator.instance; // create it
      locator.dispose();
      expect(disposeCount, 1);

      locator.dispose();
      expect(disposeCount, 2);
    });

    test('overrideWith discards the previous instance', () {
      var creationCount = 0;
      final locator = Locator<_Service>(() {
        creationCount++;
        return _Service();
      });

      final original = locator.instance;
      final replacement = _Service();
      locator.overrideWith(() => replacement);

      final result = locator.instance;
      expect(identical(result, replacement), isTrue);
      expect(identical(result, original), isFalse);
      // The override, not the original `_create`, was used.
      expect(creationCount, 1);
    });

    test('overrideWithValue discards the previous instance', () {
      final locator = Locator<_Service>(_Service.new);

      final original = locator.instance;
      final replacement = _Service();
      locator.overrideWithValue(replacement);

      expect(identical(locator.instance, replacement), isTrue);
      expect(identical(locator.instance, original), isFalse);
    });

    test('mounted reflects whether an instance is active', () {
      final locator = Locator<_Service>(_Service.new);
      expect(locator.mounted, isFalse);

      locator.instance;
      expect(locator.mounted, isTrue);

      locator.dispose();
      expect(locator.mounted, isFalse);
    });

    test('call() is shorthand for instance', () {
      final locator = Locator<_Service>(_Service.new);
      expect(identical(locator(), locator.instance), isTrue);
    });

    test('throws on re-entrant creation', () {
      late final Locator<_Service> locator;
      locator = Locator<_Service>(() {
        // Reading `instance` while already creating it must not succeed
        // silently, since that would allow a half-constructed reference
        // to leak out and be cached.
        locator.instance;
        return _Service();
      });

      expect(() => locator.instance, throwsStateError);
    });
  });
}
