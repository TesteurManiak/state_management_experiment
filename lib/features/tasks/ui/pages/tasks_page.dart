import 'package:flutter/material.dart';
import 'package:state_management_experiment/core/mixins/hook.dart';

import '../view_models/tasks_view_model.dart';
import '../widgets/task_list.dart';

class TasksPage extends StatefulWidget {
  const TasksPage({super.key});

  @override
  State<TasksPage> createState() => _TasksPageState();
}

class _TasksPageState extends State<TasksPage> with HookMixin {
  late final viewNotifier = useNotifier(TasksNotifier());

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Tabs'),
          bottom: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.directions_car)),
              Tab(icon: Icon(Icons.directions_transit)),
            ],
          ),
        ),
        body: TaskList(viewNotifier: viewNotifier),
      ),
    );
  }
}
