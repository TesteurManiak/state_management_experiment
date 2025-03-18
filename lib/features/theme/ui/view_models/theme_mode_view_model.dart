import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:state_management/state_management.dart';

import '../../../../core/view_model_locator.dart';

const _kDefaultThemeMode = ThemeMode.system;

class ThemeModeViewModel extends ViewModel<ThemeMode> {
  ThemeModeViewModel({ThemeMode? initialThemeMode})
      : super(initialThemeMode ?? _kDefaultThemeMode);

  void toggle() {
    final platformBrightness = PlatformDispatcher.instance.platformBrightness;
    state = switch (state) {
      ThemeMode.system => platformBrightness == Brightness.light
          ? ThemeMode.dark
          : ThemeMode.light,
      ThemeMode.light => ThemeMode.dark,
      ThemeMode.dark => ThemeMode.light,
    };
  }
}

final themeViewModel = ViewModelLocator<ThemeMode, ThemeModeViewModel>(
  () => ThemeModeViewModel(),
);
