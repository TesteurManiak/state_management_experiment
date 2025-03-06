import 'package:flutter/foundation.dart';

import 'mixins/auto_dispose_notifier.dart';
import 'mixins/hook_notifier.dart';

/// Base [ValueNotifier] class used to define view models.
///
/// You should **not** use the `value` setter directly with this class. Instead,
/// you should use the `state` setter from inside the view model.
///
/// ## Example
/// ```dart
/// class CounterPageViewModel extends ViewModel {
///   CounterPageViewModel() : super(0);
///
///   void increment() => state++;
///   void decrement() => state--;
/// }
/// ```
abstract class ViewModel<State> extends ChangeNotifier
    with HookNotifierMixin
    implements ValueListenable<State> {
  ViewModel(this._state);

  State _state;
  State get state => _state;

  @protected
  set state(State value) {
    if (_state == value) return;
    _state = value;
    notifyListeners();
  }

  @override
  State get value => _state;

  /// Creates an auto-disposed [SelectorNotifier] that listens to changes in the
  /// view model to observe a subset of the state.
  ValueListenable<S> select<S>(S Function(State) selector) {
    final notifier = useNotifier(_SelectorNotifier(() => selector(state)));
    notifier.onAddListener = () => addListener(notifier.notify);
    notifier.onRemoveListener = () => removeListener(notifier.notify);
    return notifier;
  }
}

/// A representation of a [ViewModel]'s subset of the state.
/// This class is used to listen to changes in the view model and notify
/// listeners when the selected state changes.
/// This class is used internally by [ViewModel.select].
class _SelectorNotifier<T> extends ChangeNotifier
    with AutoDisposeNotifierMixin
    implements ValueListenable<T> {
  _SelectorNotifier(this.getValue) : _value = getValue();

  final T Function() getValue;
  T _value;

  @override
  T get value => _value;

  VoidCallback? onAddListener;
  VoidCallback? onRemoveListener;

  void notify() {
    final current = getValue();
    if (current == _value) return;
    _value = current;
    notifyListeners();
  }

  @override
  void addListener(final VoidCallback listener) {
    onAddListener?.call();
    super.addListener(listener);
  }

  @override
  void removeListener(final VoidCallback listener) {
    onRemoveListener?.call();
    super.removeListener(listener);
  }
}
