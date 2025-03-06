import 'package:flutter/material.dart';

import 'features/counter/ui/pages/counter_page.dart';
import 'features/theme/ui/view_models/theme_mode_view_model.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: themeViewModel.instance,
      builder: (context, themeMode, _) {
        return MaterialApp(
          themeMode: themeMode,
          theme: ThemeData.light(),
          darkTheme: ThemeData.dark(),
          home: CounterPage(),
        );
      },
    );
  }
}
