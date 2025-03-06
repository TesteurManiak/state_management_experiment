import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'async_value.dart';

typedef AsyncDataBuilder<T> = Widget Function(BuildContext context, T data);
typedef AsyncLoadingBuilder = Widget Function(BuildContext context);
typedef AsyncErrorBuilder = Widget Function(
  BuildContext context,
  Object error,
  StackTrace? stackTrace,
);

class AsyncValueBuilder<T> extends StatelessWidget {
  const AsyncValueBuilder({
    required this.valueListenable,
    required this.data,
    required this.loading,
    required this.error,
    this.skipLoading = false,
    this.skipError = false,
    super.key,
  });

  final ValueListenable<AsyncValue<T>> valueListenable;
  final AsyncDataBuilder<T> data;
  final AsyncLoadingBuilder loading;
  final AsyncErrorBuilder error;

  /// Skip the loading state if [AsyncLoading] contains a non null value.
  final bool skipLoading;

  /// Skip the error state if [AsyncError] contains a non null value.
  final bool skipError;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<AsyncValue<T>>(
      valueListenable: valueListenable,
      builder: (context, asyncValue, _) {
        return switch (asyncValue) {
          AsyncData(:final value) => data(context, value),
          AsyncLoading(:final value?) when skipLoading => data(context, value),
          AsyncLoading() => loading(context),
          AsyncError(:final value?) when skipError => data(context, value),
          AsyncError(error: final e, :final stackTrace) =>
            error(context, e, stackTrace),
        };
      },
    );
  }
}
