# locator_di

An experimentation in implementing simple dependency injection in Dart without using any external packages.

## Dependency Injection

You can use the `Locator` class to register and retrieve singleton instances of your services (e.g., repositories, API clients, etc.).

```dart
final repositoryLocator = Locator<MyRepository>(MyRepositoryImpl.new);
```

### Registering asynchronously initialized dependencies

`Locator` only creates instances synchronously. For a dependency that requires
an `await` to initialize (e.g. `SharedPreferences`), resolve it once before
`runApp` and assign it to a `late final` locator so the rest of the app can
still access it synchronously:

```dart
late final Locator<SharedPreferences> sharedPreferencesLocator;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  sharedPreferencesLocator = Locator(() => prefs);
  runApp(const MyApp());
}
```

## Credits

This package takes inspiration from similar concepts from the following:

- [get_it](https://pub.dev/packages/get_it)
- [lite_ref](https://pub.dev/packages/lite_ref)
- [riverpod](https://pub.dev/packages/riverpod)