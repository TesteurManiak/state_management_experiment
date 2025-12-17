import 'package:flutter/material.dart';

import 'features/home/ui/pages/home_page.dart';
import 'features/theme/ui/notifiers/theme_mode_notifier.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: themeNotifier.instance,
      builder: (context, themeMode, _) {
        return MaterialApp(
          themeMode: themeMode,
          theme: ThemeData.light(),
          darkTheme: ThemeData.dark(),
          home: HomePage(),
        );
      },
    );
  }
}
