import 'package:flutter/material.dart';
import 'package:state_management_experiment/core/mixins/hook.dart';

import '../../../theme/ui/widgets/theme_switcher.dart';
import '../view_models/counter_page_view_model.dart';
import '../widgets/counter.dart';

class CounterPage extends StatefulWidget {
  const CounterPage({super.key});

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> with HookMixin {
  late final viewModel = useNotifier(CounterPageViewModel());

  @override
  Widget build(BuildContext context) {
    final counterNotifier = viewModel.select((state) => state.counter);
    return Scaffold(
      appBar: AppBar(
        actions: [ThemeSwitcher()],
      ),
      body: Counter(
        counterListenable: counterNotifier,
        onIncrement: viewModel.increment,
        onDecrement: viewModel.decrement,
      ),
    );
  }
}
