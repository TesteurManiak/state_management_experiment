import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

extension ToBrightnessExt on ThemeMode {
  Brightness toBrightness() {
    return switch (this) {
      ThemeMode.system => PlatformDispatcher.instance.platformBrightness,
      ThemeMode.light => Brightness.light,
      ThemeMode.dark => Brightness.dark,
    };
  }
}
