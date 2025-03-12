import 'package:flutter/material.dart';
import 'package:state_management_experiment/core/mixins/hook.dart';

import '../../domain/entities/task.dart';
import '../view_models/tasks_view_model.dart';
import 'app_loader.dart';

class TaskList extends StatefulWidget {
  const TaskList({super.key});

  @override
  State<TaskList> createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> with HookMixin {
  late final viewModel = useNotifier(TasksViewModel());

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      viewModel.fetchTasks();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ValueListenableBuilder(
        valueListenable: viewModel.select((state) => state.isLoading),
        builder: (context, isLoading, _) {
          return isLoading
              ? AppLoader()
              : TabBarView(
                  children: <Widget>[
                    ValueListenableBuilder(
                      valueListenable:
                          viewModel.select((state) => state.todoTasks),
                      builder: (_, value, __) => _TaskListDetail(
                        taskList: value,
                        viewModel: viewModel,
                      ),
                    ),
                    ValueListenableBuilder(
                      valueListenable:
                          viewModel.select((state) => state.archivedTasks),
                      builder: (_, value, __) => _TaskListDetail(
                        taskList: value,
                        viewModel: viewModel,
                      ),
                    ),
                  ],
                );
        },
      ),
    );
  }
}

class _TaskListDetail extends StatelessWidget {
  const _TaskListDetail({
    required this.taskList,
    required this.viewModel,
  });

  final List<Task> taskList;
  final TasksViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        for (final task in taskList)
          _TaskItem(
            task: task,
            viewModel: viewModel,
          )
      ],
    );
  }
}

class _TaskItem extends StatelessWidget {
  const _TaskItem({
    required this.task,
    required this.viewModel,
  });

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
        )
      ],
    );
  }
}
