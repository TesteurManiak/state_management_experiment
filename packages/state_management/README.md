# state_management_experiment

An experimentation in implementing state management concepts in Flutter without using any external packages.

## Dependency Injection

You can use the `Locator` class to register and retrieve singleton instances of your services (e.g., repositories, API clients, etc.). Prefer using `NotifierLocator` to bind the lifecycle of your ViewNotifiers ([check](#use-a-notifierlocator-to-share-it-globally-or-any-di-mechanism-you-like)).

```dart
final repositoryLocator = Locator<MyRepository>(MyRepositoryImpl.new);
```

## State Management Concepts

### 1. Create a State

```dart
@freezed
abstract class CounterState with _$CounterState {
  const factory CounterState({
    @Default(0) int counter,
  }) = _CounterState;
}
```

### 2. Create a `ViewNotifier`

```dart
class CounterPageNotifier extends ViewNotifier<CounterState> {
  CounterPageNotifier() : super(const CounterState());

  void increment() => state = state.copyWith(counter: state.counter + 1);
  void decrement() => state = state.copyWith(counter: state.counter - 1);
}
```

### 3. Lifecycle Management

###### Bind ViewNotifier to Widget Lifecycle

```dart
class CounterPage extends StatefulWidget { /* ... */ }

class _CounterPageState extends State<CounterPage> {
  final viewNotifier = CounterPageNotifier();

  @override
  void dispose() {
    viewNotifier.dispose();
    super.dispose();
  }

  // ...
}
```

###### Use a `NotifierLocator` to share it globally (or any DI mechanism you like)

```dart
final counterLocator = NotifierLocator(CounterPageNotifier.new, autodispose: true);
```

### 4. Use it in your Widget

###### Rebuild the UI when the state changes

```dart
@override
Widget build(BuildContext context) {
    return ValueListenableBuilder(
        listenable: viewNotifier,
        builder: (context, state, _) {
            final counter = state.counter;
            // ...
        },
    );
}
```

###### (Optimized) Rebuild the UI only when part of the state changes

```dart
@override
Widget build(BuildContext context) {
    final counterNotifier = viewNotifier.select((state) => state.counter);
    return ValueListenableBuilder(
        valueListenable: counterNotifier,
        builder: (context, counter, _) {
            // ...
        },
    );
}
```

###### Use the `watch(context)` extension for less boilerplate

```dart
@override
Widget build(BuildContext context) {
    final counter = viewNotifier.select((state) => state.counter).watch(context);
    return Text('$counter');
}
```

## Credits

This package takes inspirations and implement similar concepts from the following:

- [provider](https://pub.dev/packages/provider)
- [flutter_riverpod](https://pub.dev/packages/flutter_riverpod)
- [minimal_mvn](https://pub.dev/packages/minimal_mvn)
- [Architecting Flutter apps](https://docs.flutter.dev/app-architecture)
- [Flutter State Management WITHOUT external packages (ChangeNotifier, InheritedWidget and more)](https://www.youtube.com/watch?v=VPRzLMyI1HY)
