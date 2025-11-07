import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:state_management_experiment/core/extensions/build_context.dart';

class Counter extends StatelessWidget {
  const Counter({
    required this.counterListenable,
    this.onIncrement,
    this.onDecrement,
    super.key,
  });

  final ValueListenable<int> counterListenable;
  final VoidCallback? onIncrement;
  final VoidCallback? onDecrement;

  @override
  Widget build(BuildContext context) {
    final count = context.watch(counterListenable);

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('You have pushed the button this many times:'),
          Text(
            '$count',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            spacing: 8,
            children: [
              IconButton(
                onPressed: onDecrement,
                icon: Icon(Icons.remove),
              ),
              IconButton(
                onPressed: onIncrement,
                icon: Icon(Icons.add),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
