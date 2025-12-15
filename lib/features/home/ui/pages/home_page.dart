import 'package:flutter/material.dart';
import 'package:state_management_experiment/features/tasks/ui/pages/tasks_page.dart';

import '../../../counter/ui/pages/counter_page.dart';
import '../../../dual_counters/ui/pages/dual_counters_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home')),
      body: Center(
        child: Column(
          mainAxisSize: .min,
          mainAxisAlignment: .center,
          spacing: 8,
          children: [
            _NavigationButton(label: 'Counter', builder: (_) => CounterPage()),
            _NavigationButton(
              label: 'Dual Counters',
              builder: (_) => DualCountersPage(),
            ),
            _NavigationButton(label: 'Tasks', builder: (_) => TasksPage()),
          ],
        ),
      ),
    );
  }
}

class _NavigationButton<T extends Object?> extends StatelessWidget {
  const _NavigationButton({required this.label, required this.builder});

  final String label;
  final WidgetBuilder builder;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () =>
          Navigator.push(context, MaterialPageRoute<T>(builder: builder)),
      child: Text(label),
    );
  }
}
