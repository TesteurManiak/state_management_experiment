import 'package:flutter/widgets.dart';

mixin HookMixin<T extends StatefulWidget> on State<T> {
  final _listenables = <ChangeNotifier>[];

  N useNotifier<N extends ChangeNotifier>(N notifier) {
    _listenables.add(notifier);
    return notifier;
  }

  @override
  void dispose() {
    for (final l in _listenables) {
      l.dispose();
    }
    super.dispose();
  }
}
