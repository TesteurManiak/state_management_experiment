import 'dart:collection';

import 'package:flutter/foundation.dart';

class SetValueNotifier<T> extends ChangeNotifier
    implements ValueListenable<UnmodifiableSetView<T>> {
  SetValueNotifier(Set<T>? initialData) : _data = initialData ?? {};

  final Set<T> _data;
  late final _view = UnmodifiableSetView<T>(_data);

  @override
  UnmodifiableSetView<T> get value => _view;

  bool add(T value) {
    final changed = _data.add(value);
    if (changed) notifyListeners();
    return changed;
  }

  void addAll(Iterable<T> values) {
    _data.addAll(values);
    notifyListeners();
  }

  void clear() {
    _data.clear();
    notifyListeners();
  }

  bool remove(T value) {
    final changed = _data.remove(value);
    if (changed) notifyListeners();
    return changed;
  }

  /// Removes each element of [elements] from this set.
  /// ```dart
  /// final characters = <String>{'A', 'B', 'C'};
  /// characters.removeAll({'A', 'B', 'X'});
  /// print(characters); // {C}
  /// ```
  void removeAll(Iterable<T> values) {
    _data.removeAll(values);
    notifyListeners();
  }

  /// Removes all elements of this set that satisfy [test].
  /// ```dart
  /// final characters = <String>{'A', 'B', 'C'};
  /// characters.removeWhere((element) => element.startsWith('B'));
  /// print(characters); // {A, C}
  /// ```
  void removeWhere(bool Function(T element) test) {
    _data.removeWhere(test);
    notifyListeners();
  }

  /// Removes all elements of this set that are not elements in [elements].
  ///
  /// Checks for each element of [elements] whether there is an element in this
  /// set that is equal to it (according to `this.contains`), and if so, the
  /// equal element in this set is retained, and elements that are not equal
  /// to any element in [elements] are removed.
  /// ```dart
  /// final characters = <String>{'A', 'B', 'C'};
  /// characters.retainAll({'A', 'B', 'X'});
  /// print(characters); // {A, B}
  /// ```
  void retainAll(Iterable<T> elements) {
    _data.retainAll(elements);
    notifyListeners();
  }

  /// Removes all elements of this set that fail to satisfy [test].
  /// ```dart
  /// final characters = <String>{'A', 'B', 'C'};
  /// characters.retainWhere(
  ///     (element) => element.startsWith('B') || element.startsWith('C'));
  /// print(characters); // {B, C}
  /// ```
  void retainWhere(bool Function(T element) test) {
    _data.retainWhere(test);
    notifyListeners();
  }
}
