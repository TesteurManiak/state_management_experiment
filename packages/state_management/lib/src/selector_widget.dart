import 'package:flutter/material.dart';
import 'package:state_management/src/view_model.dart';

typedef SelectWidgetBuilder<S> = Widget Function(BuildContext, S);

class Selector<State, S> extends StatelessWidget {
  const Selector({
    required this.select,
    required this.viewModel,
    required this.builder,
    super.key,
  });

  final SelectCallback<State, S> select;
  final ViewModel<State> viewModel;
  final SelectWidgetBuilder<S> builder;

  @override
  Widget build(BuildContext context) {
    final selectNotifier = viewModel.select(select);
    return ValueListenableBuilder(
      valueListenable: selectNotifier,
      builder: (context, value, _) => builder(context, value),
    );
  }
}
