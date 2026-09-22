import 'package:flutter/material.dart';
import 'package:state_management/state_management.dart';
import 'package:state_management_experiment/features/locale/ui/notifiers/locale_notifier.dart';

import 'features/home/ui/pages/home_page.dart';
import 'features/theme/ui/notifiers/theme_mode_notifier.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeMode = themeNotifier().watch(context);
    final locale = localeNotifier().watch(context);

    return MaterialApp(
      themeMode: themeMode,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      locale: locale,
      home: HomePage(),
    );
  }
}
