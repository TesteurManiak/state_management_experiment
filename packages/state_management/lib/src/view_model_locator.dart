import 'locator.dart';
import 'view_model.dart';

/// A specialized [Locator] for managing instances of [ViewModel]s.
///
/// It provides an optional [autodispose] feature that automatically
/// disposes the [ViewModel] instance when there are no more subscribers
/// listening to it.
///
/// ```dart
/// final counterVm = ViewModelLocator(CounterViewModel.new, autodispose: true);
/// ```
class ViewModelLocator<T extends ViewModel> extends Locator<T> {
  ViewModelLocator(super._create, {super.onDispose, this.autodispose = false});

  final bool autodispose;

  @override
  T get instance {
    // Setup autodispose if enabled
    final vm = super.instance;
    if (autodispose) vm.onUnsubscribed = _onUnsubscribed;
    return vm;
  }

  @override
  void dispose() {
    instance.dispose();
    super.dispose();
  }

  void _onUnsubscribed() {
    if (autodispose) dispose();
  }
}
