import 'locator.dart';
import 'mixins/unsubscribe_notifier.dart';

/// A specialized [Locator] for managing instances of unsubscribable notifiers.
///
/// It provides an optional [autodispose] feature that automatically
/// disposes the notifier's instance when there are no more subscribers
/// listening to it.
///
/// ```dart
/// final counterNotifier = NotifierLocator(CounterNotifier.new, autodispose: true);
/// ```
class NotifierLocator<T extends UnsubscribeNotifier> extends Locator<T> {
  NotifierLocator(super._create, {super.onDispose, this.autodispose = false});

  final bool autodispose;

  bool _disposed = false;

  @override
  T get instance {
    // Setup autodispose if enabled
    final vm = super.instance;
    if (autodispose) vm.onUnsubscribed = _onUnsubscribe;
    return vm;
  }

  @override
  void dispose() {
    if (_disposed) return;
    instance.dispose();
    super.dispose();
    _disposed = true;
  }

  void _onUnsubscribe() {
    if (autodispose) dispose();
  }
}
