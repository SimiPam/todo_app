import 'package:flutter/material.dart';
import 'package:todo_app/model/todo_list.dart';
import 'package:todo_app/widgets/task_tile.dart';
import 'package:todo_app/widgets/task_widget.dart';

import 'item_widget.dart';

class TaskListBuilder extends StatefulWidget {
  final ScrollController controllerScroll;
  const TaskListBuilder({this.controllerScroll});
  @override
  _TaskListBuilderState createState() => _TaskListBuilderState();
}

class _TaskListBuilderState extends State<TaskListBuilder> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: todos.length,
      itemBuilder: (context, index) {
        return TaskWidget(
          todos: todos[index],
          onDelete: () {
            setState(() {
              todos.removeAt(index);
            });
          },
        );
      },
      controller: widget.controllerScroll,
    );
  }
}
