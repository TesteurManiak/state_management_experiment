import 'package:flutter/foundation.dart';

import 'mixins/auto_dispose_notifier.dart';
import 'mixins/hook_notifier.dart';
import 'mixins/unsubscribe_notifier.dart';

/// Base class used to define notifiers.
///
/// ## Example
/// ```dart
/// class CounterPageNotifier extends Notifier<int> {
///   CounterPageNotifier() : super(0);
///
///   void increment() => state++;
///   void decrement() => state--;
/// }
/// ```
abstract class Notifier<State> extends ChangeNotifier
    with HookNotifierMixin, UnsubscribeNotifier
    implements ValueListenable<State> {
  Notifier(this._state) {
    init();
  }

  State _state;
  State get state => _state;

  @protected
  set state(State value) {
    if (_state == value) return;
    _state = value;
    notifyListeners();
  }

  /// Initialization method called after the view model is created.
  /// Override this method to perform any setup required for the view model.
  @protected
  void init() {}

  @override
  State get value => _state;

  /// Creates a [_SelectorNotifier] that listens to changes in the view model
  /// to observe a subset of the state.
  ValueListenable<S> select<S>(SelectCallback<State, S> selector) {
    final notifier = useNotifier(_SelectorNotifier(() => selector(state)));

    addListener(notifier.notify);
    notifier.onDispose = () => removeListener(notifier.notify);

    return notifier;
  }
}

typedef SelectCallback<State, S> = S Function(State state);

/// A representation of a [Notifier]'s subset of the state.
/// This class is used to listen to changes in the view model and notify
/// listeners when the selected state changes.
/// This class is used internally by [Notifier.select].
class _SelectorNotifier<T> extends ValueNotifier<T> with AutoDisposeNotifier {
  _SelectorNotifier(this.getValue) : super(getValue());

  final T Function() getValue;

  VoidCallback? onDispose;

  void notify() {
    final current = getValue();
    value = current;
  }

  @override
  void dispose() {
    if (disposed) return;
    onDispose?.call();
    super.dispose();
  }
}
