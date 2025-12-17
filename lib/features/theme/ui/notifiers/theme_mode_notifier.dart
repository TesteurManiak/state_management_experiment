import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:state_management/state_management.dart';

const _kDefaultThemeMode = ThemeMode.system;

class ThemeModeNotifier extends Notifier<ThemeMode> {
  ThemeModeNotifier({ThemeMode? initialThemeMode})
    : super(initialThemeMode ?? _kDefaultThemeMode);

  void toggle() {
    final platformBrightness = PlatformDispatcher.instance.platformBrightness;
    state = switch (state) {
      ThemeMode.system =>
        platformBrightness == Brightness.light
            ? ThemeMode.dark
            : ThemeMode.light,
      ThemeMode.light => ThemeMode.dark,
      ThemeMode.dark => ThemeMode.light,
    };
  }
}

final themeNotifier = NotifierLocator(ThemeModeNotifier.new);
