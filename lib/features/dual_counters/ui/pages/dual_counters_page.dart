import 'package:flutter/material.dart';
import 'package:state_management_experiment/core/mixins/hook.dart';

import '../../../counter/ui/widgets/counter.dart';
import '../notifiers/dual_counters_notifier.dart';

class DualCountersPage extends StatefulWidget {
  const DualCountersPage({super.key});

  @override
  State<DualCountersPage> createState() => _DualCountersPageState();
}

class _DualCountersPageState extends State<DualCountersPage> with HookMixin {
  late final notifier = useNotifier(DualCountersNotifier());
  late final counterA = notifier.select((state) => state.counter1);

  @override
  Widget build(BuildContext context) {
    final counterB = notifier.select((state) => state.counter2);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Dual Counters'),
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () => notifier.reset(),
          ),
        ],
      ),
      body: Row(
        children: [
          Expanded(
            child: Counter(
              counterListenable: counterA,
              onIncrement: () => notifier.incrementFirstCounter(),
            ),
          ),
          Expanded(
            child: Counter(
              counterListenable: counterB,
              onIncrement: () => notifier.incrementSecondCounter(),
            ),
          ),
        ],
      ),
    );
  }
}
