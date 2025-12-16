import 'package:flutter/material.dart';
import 'package:state_management/state_management.dart';

import '../../domain/entities/task.dart';
import '../view_models/tasks_view_model.dart';
import 'app_loader.dart';

class TaskList extends StatelessWidget {
  const TaskList({required this.viewModel, super.key});

  final TasksViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    final isLoading = viewModel.select((s) => s.isLoading).watch(context);
    final todo = viewModel.select((s) => s.todoTasks).watch(context);
    final archived = viewModel.select((s) => s.archivedTasks).watch(context);

    return Padding(
      padding: const .all(16.0),
      child: isLoading
          ? AppLoader()
          : TabBarView(
              children: <Widget>[
                _TaskListDetail(taskList: todo, viewModel: viewModel),
                _TaskListDetail(taskList: archived, viewModel: viewModel),
              ],
            ),
    );
  }
}

class _TaskListDetail extends StatelessWidget {
  const _TaskListDetail({required this.taskList, required this.viewModel});

  final List<Task> taskList;
  final TasksViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        for (final task in taskList)
          _TaskItem(task: task, viewModel: viewModel),
      ],
    );
  }
}

class _TaskItem extends StatelessWidget {
  const _TaskItem({required this.task, required this.viewModel});

  final Task task;
  final TasksViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(task.title),
        Spacer(),
        IconButton(
          onPressed: () => viewModel.toggleTaskStatus(task),
          icon: Icon(task.isDone ? Icons.hourglass_empty : Icons.done),
        ),
      ],
    );
  }
}
