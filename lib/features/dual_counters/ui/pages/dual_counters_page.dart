import 'package:flutter/material.dart';
import 'package:state_management_experiment/core/mixins/hook.dart';

import '../../../counter/ui/widgets/counter.dart';
import '../view_models/dual_counters_view_model.dart';

class DualCountersPage extends StatefulWidget {
  const DualCountersPage({super.key});

  @override
  State<DualCountersPage> createState() => _DualCountersPageState();
}

class _DualCountersPageState extends State<DualCountersPage> with HookMixin {
  late final viewModel = useNotifier(DualCountersViewModel());
  late final counterA = viewModel.select((state) => state.counter1);

  @override
  Widget build(BuildContext context) {
    final counterB = viewModel.select((state) => state.counter2);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Dual Counters'),
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () => viewModel.reset(),
          ),
        ],
      ),
      body: Row(
        children: [
          Expanded(
            child: Counter(
              counterListenable: counterA,
              onIncrement: () => viewModel.incrementFirstCounter(),
            ),
          ),
          Expanded(
            child: Counter(
              counterListenable: counterB,
              onIncrement: () => viewModel.incrementSecondCounter(),
            ),
          ),
        ],
      ),
    );
  }
}
