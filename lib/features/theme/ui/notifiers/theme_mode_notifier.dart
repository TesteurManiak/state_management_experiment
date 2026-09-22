import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:state_management/state_management.dart';

const _kDefaultThemeMode = ThemeMode.system;

class ThemeModeNotifier extends Notifier<ThemeMode> {
  ThemeModeNotifier({ThemeMode? initialThemeMode})
    : super(initialThemeMode ?? _kDefaultThemeMode);

  void toggle() {
    final platformBrightness = PlatformDispatcher.instance.platformBrightness;
    final ThemeMode newMode = switch (state) {
      .system => platformBrightness == .light ? .dark : .light,
      .light => .dark,
      .dark => .light,
    };
    state = newMode;
  }
}

final themeNotifier = NotifierLocator(ThemeModeNotifier.new);
