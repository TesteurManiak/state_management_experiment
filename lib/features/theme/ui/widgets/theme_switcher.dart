import 'package:flutter/material.dart';
import 'package:state_management_experiment/core/extensions/theme_mode.dart';

import '../notifiers/theme_mode_notifier.dart';

class ThemeSwitcher extends StatelessWidget {
  const ThemeSwitcher({super.key});

  @override
  Widget build(BuildContext context) {
    final darkModeNotifier = themeNotifier().select(
      (s) => s.toBrightness() == .dark,
    );

    return ValueListenableBuilder<bool>(
      valueListenable: darkModeNotifier,
      builder: (context, isDark, _) {
        return Switch(
          value: isDark,
          onChanged: (_) => themeNotifier().toggle(),
        );
      },
    );
  }
}
