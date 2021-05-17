import 'package:flutter/material.dart';
import 'package:todo_app/model/todo_list.dart';
import 'package:todo_app/screens/view_task_screen.dart';
import 'package:todo_app/widgets/task_widget.dart';

Widget buildItem(item, int index) => TaskWidget(
      todos: item,
      onDelete: () {
        todos.removeAt(index);
      },
    );
