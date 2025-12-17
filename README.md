# state_management_experiment

An experimentation in implementing state management concepts in Flutter without using any external packages.

This package takes inspirations and implement similar concepts from the following:

- [provider](https://pub.dev/packages/provider)
- [flutter_riverpod](https://pub.dev/packages/flutter_riverpod)
- [minimal_mvn](https://pub.dev/packages/minimal_mvn)
- [Architecting Flutter apps](https://docs.flutter.dev/app-architecture)
- [Flutter State Management WITHOUT external packages (ChangeNotifier, InheritedWidget and more)](https://www.youtube.com/watch?v=VPRzLMyI1HY)

## Features

It tries to adapt concepts of the MVN (Model-View-Notifier) pattern, similar to the one used in the `minimal_mvn` package, but with a bit more flexibility in its API and some additional features:
- `Locator`: A way to provide a service app-wide.
- `NotifierLocator`: A way to provide any `ChangeNotifier`, that uses the `UnsubscribeNotifier` mixin, app-wide with an auto-dispose mechanism when there are no more listeners.
- `Notifier`: A base class to define your state-holders, it implements `ValueListenable` and allow to observe a subset of its state via selectors.
- `ValueListenable.watch(context)`: An extension method on `ValueListenable` to easily trigger rebuilds in your widgets.
