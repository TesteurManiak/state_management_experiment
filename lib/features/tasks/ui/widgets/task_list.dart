import 'package:flutter/material.dart';
import 'package:state_management/state_management.dart';

import '../../domain/entities/task.dart';
import '../view_models/tasks_view_model.dart';
import 'app_loader.dart';

class TaskList extends StatelessWidget {
  const TaskList({required this.viewNotifier, super.key});

  final TasksNotifier viewNotifier;

  @override
  Widget build(BuildContext context) {
    final isLoading = viewNotifier.select((s) => s.isLoading).watch(context);
    final todo = viewNotifier.select((s) => s.todoTasks).watch(context);
    final archived = viewNotifier.select((s) => s.archivedTasks).watch(context);

    return Padding(
      padding: const .all(16.0),
      child: isLoading
          ? AppLoader()
          : TabBarView(
              children: <Widget>[
                _TaskListDetail(taskList: todo, viewNotifier: viewNotifier),
                _TaskListDetail(taskList: archived, viewNotifier: viewNotifier),
              ],
            ),
    );
  }
}

class _TaskListDetail extends StatelessWidget {
  const _TaskListDetail({required this.taskList, required this.viewNotifier});

  final List<Task> taskList;
  final TasksNotifier viewNotifier;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        for (final task in taskList)
          _TaskItem(task: task, viewNotifier: viewNotifier),
      ],
    );
  }
}

class _TaskItem extends StatelessWidget {
  const _TaskItem({required this.task, required this.viewNotifier});

  final Task task;
  final TasksNotifier viewNotifier;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(task.title),
        Spacer(),
        IconButton(
          onPressed: () => viewNotifier.toggleTaskStatus(task),
          icon: Icon(task.isDone ? Icons.hourglass_empty : Icons.done),
        ),
      ],
    );
  }
}
