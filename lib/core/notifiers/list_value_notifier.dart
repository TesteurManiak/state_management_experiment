import 'dart:collection';

import 'package:flutter/foundation.dart';

class ListValueNotifier<T> extends ChangeNotifier
    implements ValueListenable<List<T>> {
  ListValueNotifier(List<T>? initialData) : _data = initialData ?? [];

  final List<T> _data;
  late final _view = UnmodifiableListView<T>(_data);

  @override
  UnmodifiableListView<T> get value => _view;

  void add(T value) {
    _data.add(value);
    notifyListeners();
  }

  void addAll(Iterable<T> values) {
    _data.addAll(values);
    notifyListeners();
  }

  void clear() {
    _data.clear();
    notifyListeners();
  }

  void fillRange(int start, int end, [T? value]) {
    _data.fillRange(start, end, value);
    notifyListeners();
  }

  void insert(int index, T value) {
    _data.insert(index, value);
    notifyListeners();
  }

  void insertAll(int index, Iterable<T> values) {
    _data.insertAll(index, values);
    notifyListeners();
  }

  bool remove(T value) {
    final changed = _data.remove(value);
    if (changed) notifyListeners();
    return changed;
  }

  T removeAt(int index) {
    final removed = _data.removeAt(index);
    notifyListeners();
    return removed;
  }
}
