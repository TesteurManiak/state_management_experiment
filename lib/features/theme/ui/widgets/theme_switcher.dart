import 'package:flutter/material.dart';
import 'package:state_management_experiment/core/extensions/theme_mode.dart';

import '../view_models/theme_mode_view_model.dart';

class ThemeSwitcher extends StatelessWidget {
  const ThemeSwitcher({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = themeViewModel.instance;
    final darkModeNotifier = viewModel.select(
      (s) => s.toBrightness() == Brightness.dark,
    );

    return ValueListenableBuilder<bool>(
      valueListenable: darkModeNotifier,
      builder: (context, isDark, _) {
        return Switch(value: isDark, onChanged: (_) => viewModel.toggle());
      },
    );
  }
}
