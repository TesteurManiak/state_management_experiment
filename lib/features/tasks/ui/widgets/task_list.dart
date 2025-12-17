import 'package:flutter/material.dart';
import 'package:state_management/state_management.dart';

import '../../domain/entities/task.dart';
import '../notifiers/tasks_notifier.dart';
import 'app_loader.dart';

class TaskList extends StatelessWidget {
  const TaskList({required this.notifier, super.key});

  final TasksNotifier notifier;

  @override
  Widget build(BuildContext context) {
    final isLoading = notifier.select((s) => s.isLoading).watch(context);
    final todo = notifier.select((s) => s.todoTasks).watch(context);
    final archived = notifier.select((s) => s.archivedTasks).watch(context);

    return Padding(
      padding: const .all(16.0),
      child: isLoading
          ? AppLoader()
          : TabBarView(
              children: <Widget>[
                _TaskListDetail(taskList: todo, notifier: notifier),
                _TaskListDetail(taskList: archived, notifier: notifier),
              ],
            ),
    );
  }
}

class _TaskListDetail extends StatelessWidget {
  const _TaskListDetail({required this.taskList, required this.notifier});

  final List<Task> taskList;
  final TasksNotifier notifier;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        for (final task in taskList) _TaskItem(task: task, notifier: notifier),
      ],
    );
  }
}

class _TaskItem extends StatelessWidget {
  const _TaskItem({required this.task, required this.notifier});

  final Task task;
  final TasksNotifier notifier;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(task.title),
        Spacer(),
        IconButton(
          onPressed: () => notifier.toggleTaskStatus(task),
          icon: Icon(task.isDone ? Icons.hourglass_empty : Icons.done),
        ),
      ],
    );
  }
}
