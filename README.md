# state_management_experiment

An experimentation in implementing state management concepts in Flutter without using any external packages.

## Features

It tries to adapt concepts of the MVN (Model-View-Notifier) pattern, similar to the one used in the [`minimal_mvn`](https://pub.dev/packages/minimal_mvn) package, but with a bit more flexibility in its API and some additional features:
- `Locator`: A way to provide a service app-wide for DI.
- `NotifierLocator`: A way to provide any `ChangeNotifier`, that uses the `UnsubscribeNotifier` mixin, app-wide with an auto-dispose mechanism when there are no more listeners.
- `Notifier`: A base class to define your state-holders, it implements `ValueListenable` and allow to observe a subset of its state via selectors.
- `ValueListenable.watch(context)`: An extension method on `ValueListenable` to easily trigger rebuilds in your widgets.

Check out the sub-packages [locator_di](packages/locator_di/README.md) and [state_management](packages/state_management/README.md) for more details.

## Example

```dart
final apiService = Locator<ApiService>(() => ApiServiceImpl());

class ViewNotifier extends Notifier<ViewState> {
    ViewNotifier({required this.apiService}) : super(const ViewState.loading());

    final ApiService apiService;

    @override
    Future<void> init() => fetchData();

    Future<void> fetchData() async {
        state = const ViewState.loading();
        try {
            final data = await apiService.getData();
            state = ViewState.data(data);
        } catch (e) {
            state = ViewState.error(e.toString());
        }
    }
}

final viewNotifier = NotifierLocator(() => ViewNotifier(apiService: apiService()), autoDispose: true);

class MyView extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        final viewState = viewNotifier().watch(context);

        return Scaffold(
            appBar: AppBar(title: Text('State Management Experiment')),
            body: Center(
                child: viewState.when(
                    loading: () => CircularProgressIndicator(),
                    data: (data) => Text('Data: $data'),
                    error: (message) => Text('Error: $message'),
                ),
            ),
            floatingActionButton: FloatingActionButton(
                onPressed: () => viewNotifier().fetchData(),
                child: Icon(Icons.refresh),
            ),
        );
    }
}
```
