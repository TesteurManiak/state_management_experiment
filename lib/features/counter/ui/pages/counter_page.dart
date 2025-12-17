import 'package:flutter/material.dart';
import 'package:state_management_experiment/core/mixins/hook.dart';

import '../../../theme/ui/widgets/theme_switcher.dart';
import '../notifiers/counter_page_notifier.dart';
import '../widgets/counter.dart';

class CounterPage extends StatefulWidget {
  const CounterPage({super.key});

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> with HookMixin {
  late final notifier = useNotifier(CounterPageNotifier());

  @override
  Widget build(BuildContext context) {
    final counterNotifier = notifier.select((state) => state.counter);
    return Scaffold(
      appBar: AppBar(actions: [ThemeSwitcher()]),
      body: Counter(
        counterListenable: counterNotifier,
        onIncrement: notifier.increment,
        onDecrement: notifier.decrement,
      ),
    );
  }
}
