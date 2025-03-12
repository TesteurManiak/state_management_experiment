import 'package:flutter/foundation.dart';

import 'mixins/hook_notifier.dart';

/// Base [ValueNotifier] class used to define view models.
///
/// You should **not** use the `value` setter directly with this class. Instead,
/// you should use the `state` setter from inside the view model.
///
/// ## Example
/// ```dart
/// class CounterPageViewModel extends ViewModel<int> {
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

  /// Used to handle the disposal of sub notifiers created by [select].
  final _selectorMap = <Selector<State, Object?>, _SelectorNotifier>{};

  /// Creates a [_SelectorNotifier] that listens to changes in
  /// the view model to observe a subset of the state.
  ValueListenable<S> select<S>(Selector<State, S> selector) {
    if (_selectorMap[selector] case final notifier? when !notifier.disposed) {
      notifier.dispose();
    }

    final notifier = useNotifier(_SelectorNotifier(() => selector(state)));

    addListener(notifier.notify);
    notifier.onDispose = () {
      removeListener(notifier.notify);
      _selectorMap.remove(selector);
    };

    _selectorMap[selector] = notifier;
    return notifier;
  }
}

typedef Selector<State, S> = S Function(State state);

/// A representation of a [ViewModel]'s subset of the state.
/// This class is used to listen to changes in the view model and notify
/// listeners when the selected state changes.
/// This class is used internally by [ViewModel.select].
class _SelectorNotifier<T> extends ValueNotifier<T> {
  _SelectorNotifier(this.getValue) : super(getValue());

  final T Function() getValue;

  VoidCallback? onDispose;
  bool disposed = false;

  void notify() {
    final current = getValue();
    value = current;
  }

  @override
  void dispose() {
    if (disposed) return;
    onDispose?.call();
    super.dispose();
    disposed = true;
  }
}
