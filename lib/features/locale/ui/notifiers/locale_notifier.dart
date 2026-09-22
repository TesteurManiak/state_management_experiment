import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:locator_di/locator_di.dart';
import 'package:state_management/state_management.dart';

final defaultLocale = Locator<Locale>(() => PlatformDispatcher.instance.locale);

class LocaleNotifier extends Notifier<Locale> {
  new(super.initialValue);

  void setLocale(Locale locale) => state = locale;
}

final localeNotifier = NotifierLocator(() {
  final initialValue = defaultLocale();
  return LocaleNotifier(initialValue);
});
