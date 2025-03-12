import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:state_management_experiment/features/tasks/domain/entities/task.dart';

part 'task_page_state.freezed.dart';

@freezed
abstract class TaskPageState with _$TaskPageState {
  const factory TaskPageState({
    @Default([]) List<Task> todoTasks,
    @Default([]) List<Task> archivedTasks,
    @Default(true) bool isLoading,
  }) = _TaskPageState;
}
