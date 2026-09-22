import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

extension ToBrightnessExt on ThemeMode {
  Brightness toBrightness() {
    return switch (this) {
      .system => PlatformDispatcher.instance.platformBrightness,
      .light => .light,
      .dark => .dark,
    };
  }
}
