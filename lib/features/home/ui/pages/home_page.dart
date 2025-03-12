import 'package:flutter/material.dart';

import '../../../counter/ui/pages/counter_page.dart';
import '../../../dual_counters/ui/pages/dual_counters_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 8,
          children: [
            _NavigationButton(
              label: 'Counter',
              builder: (_) => CounterPage(),
            ),
            _NavigationButton(
              label: 'Dual Counters',
              builder: (_) => DualCountersPage(),
            ),
          ],
        ),
      ),
    );
  }
}

class _NavigationButton<T extends Object?> extends StatelessWidget {
  const _NavigationButton({
    required this.label,
    required this.builder,
  });

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
