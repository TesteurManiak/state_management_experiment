import 'package:flutter/widgets.dart' hide State;

import '../async_state.dart';

typedef AsyncStateLoadedBuilder<State> = Widget Function(
  BuildContext context,
  State state,
);

typedef ErrorBuilder = Widget Function(
  BuildContext context,
  Object error,
  StackTrace? stackTrace,
);

class AsyncStateBuilder<State> extends StatelessWidget {
  const AsyncStateBuilder({
    required this.state,
    required this.loaded,
    required this.loading,
    required this.error,
    super.key,
  });

  final AsyncState<State> state;
  final AsyncStateLoadedBuilder<State> loaded;
  final WidgetBuilder loading;
  final ErrorBuilder error;

  @override
  Widget build(BuildContext context) {
    return switch (state) {
      AsyncData(:final value) => loaded(context, value),
      AsyncError(error: final e, :final stackTrace) => error(
        context,
        e,
        stackTrace,
      ),
      AsyncLoading() => loading(context),
    };
  }
}
