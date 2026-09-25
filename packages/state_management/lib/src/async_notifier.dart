import 'async_state.dart';
import 'notifier.dart';

abstract class AsyncNotifier<State> extends Notifier<AsyncState<State>> {
  new(super.state);
}
