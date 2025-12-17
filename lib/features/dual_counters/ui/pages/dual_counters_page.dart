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
  late final viewNotifier = useNotifier(DualCountersNotifier());
  late final counterA = viewNotifier.select((state) => state.counter1);

  @override
  Widget build(BuildContext context) {
    final counterB = viewNotifier.select((state) => state.counter2);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Dual Counters'),
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () => viewNotifier.reset(),
          ),
        ],
      ),
      body: Row(
        children: [
          Expanded(
            child: Counter(
              counterListenable: counterA,
              onIncrement: () => viewNotifier.incrementFirstCounter(),
            ),
          ),
          Expanded(
            child: Counter(
              counterListenable: counterB,
              onIncrement: () => viewNotifier.incrementSecondCounter(),
            ),
          ),
        ],
      ),
    );
  }
}
