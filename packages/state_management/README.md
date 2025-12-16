# state_management_experiment

An experimentation in implementing state management concepts in Flutter without using any external packages.

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

### 2. Create a `ViewModel`

```dart
class CounterPageViewModel extends ViewModel<CounterState> {
  CounterPageViewModel() : super(const CounterState());

  void increment() => state = state.copyWith(counter: state.counter + 1);
  void decrement() => state = state.copyWith(counter: state.counter - 1);
}
```

### 3. Use it in your Widget

```dart
class CounterPage extends StatefulWidget { /* ... */ }

class _CounterPageState extends State<CounterPage> {
  final viewModel = CounterPageViewModel();

  @override
  void dispose() {
    viewModel.dispose();
    super.dispose();
  }

  // ...
}
```

###### Rebuild the UI when the state changes

```dart
@override
Widget build(BuildContext context) {
    return ValueListenableBuilder(
        listenable: viewModel,
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
    final counterNotifier = viewModel.select((state) => state.counter);
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
    final counter = viewModel.select((state) => state.counter).watch(context);
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
