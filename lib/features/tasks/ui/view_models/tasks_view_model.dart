import 'package:state_management/state_management.dart';

import '../../domain/entities/task.dart';
import '../states/task_page_state.dart';

class TasksViewModel extends ViewModel<TaskPageState> {
  TasksViewModel() : super(const TaskPageState(isLoading: true));

  @override
  Future<void> init() => fetchTasks();

  Future<void> fetchTasks() async {
    state = state.copyWith(isLoading: true);
    await Future.delayed(const Duration(milliseconds: 500));
    state = state.copyWith(
      todoTasks: [
        Task(title: 'Task 1', isDone: false),
        Task(title: 'Task 2', isDone: false),
        Task(title: 'Task 3', isDone: false),
      ],
      archivedTasks: [
        Task(title: 'Task 4', isDone: true),
        Task(title: 'Task 5', isDone: true),
        Task(title: 'Task 6', isDone: true),
      ],
      isLoading: false,
    );
  }

  void toggleTaskStatus(Task task) {
    final func = task.isDone ? todoTask : archiveTask;
    func(task);
  }

  void todoTask(Task task) {
    state = state.copyWith(
      archivedTasks: state.archivedTasks.where((t) => t != task).toList(),
      todoTasks: [...state.todoTasks, task.copyWith(isDone: false)],
    );
  }

  void archiveTask(Task task) {
    state = state.copyWith(
      todoTasks: state.todoTasks.where((t) => t != task).toList(),
      archivedTasks: [...state.archivedTasks, task.copyWith(isDone: true)],
    );
  }
}
