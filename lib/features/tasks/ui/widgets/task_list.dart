import 'package:flutter/material.dart';
import 'package:state_management/state_management.dart';
import 'package:state_management_experiment/features/tasks/ui/pages/tasks_page.dart';

import '../../domain/entities/task.dart';
import 'app_loader.dart';

class TaskList extends StatelessWidget {
  const TaskList({super.key});

  @override
  Widget build(BuildContext context) {
    final isLoading = tasksNotifier().select((s) => s.isLoading).watch(context);
    final todo = tasksNotifier().select((s) => s.todoTasks).watch(context);
    final archived = tasksNotifier()
        .select((s) => s.archivedTasks)
        .watch(context);

    return Padding(
      padding: const .all(16.0),
      child: isLoading
          ? AppLoader()
          : TabBarView(
              children: <Widget>[
                _TaskListDetail(taskList: todo),
                _TaskListDetail(taskList: archived),
              ],
            ),
    );
  }
}

class _TaskListDetail extends StatelessWidget {
  const _TaskListDetail({required this.taskList});

  final List<Task> taskList;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [for (final task in taskList) _TaskItem(task: task)],
    );
  }
}

class _TaskItem extends StatelessWidget {
  const _TaskItem({required this.task});

  final Task task;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(task.title),
        Spacer(),
        IconButton(
          onPressed: () => tasksNotifier().toggleTaskStatus(task),
          icon: Icon(task.isDone ? Icons.hourglass_empty : Icons.done),
        ),
      ],
    );
  }
}
