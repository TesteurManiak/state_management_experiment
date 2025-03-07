import 'package:flutter/material.dart';
import 'package:state_management_experiment/core/mixins/hook.dart';

import '../../../theme/ui/widgets/theme_switcher.dart';
import '../view_models/counter_page_view_model.dart';

class CounterPage extends StatefulWidget {
  const CounterPage({super.key});

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> with HookMixin {
  late final viewModel = useNotifier(CounterPageViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [ThemeSwitcher()],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('You have pushed the button this many times:'),
            _Counter(viewModel),
            _Buttons(viewModel),
          ],
        ),
      ),
    );
  }
}

class _Counter extends StatelessWidget {
  const _Counter(this.viewModel);

  final CounterPageViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    final counterNotifier = viewModel.select((state) => state.counter);

    return ValueListenableBuilder<int>(
      valueListenable: counterNotifier,
      builder: (context, counter, _) {
        return Text(
          '$counter',
          style: Theme.of(context).textTheme.headlineMedium,
        );
      },
    );
  }
}

class _Buttons extends StatelessWidget {
  const _Buttons(this.viewModel);

  final CounterPageViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      spacing: 8,
      children: [
        IconButton(
          onPressed: viewModel.decrement,
          icon: Icon(Icons.remove),
        ),
        IconButton(
          onPressed: viewModel.increment,
          icon: Icon(Icons.add),
        ),
      ],
    );
  }
}
