import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/database/todo_db.dart';
import 'package:todo_app/theme/sizes.dart';
import 'package:todo_app/widgets/task_widget.dart';
import 'package:todo_app/model/todo_model.dart';

class TaskListBuilder extends StatefulWidget {
  final ScrollController controllerScroll;
  final List<TodoModelClass> todoes;
  final bool isLoading;
  const TaskListBuilder({this.controllerScroll, this.todoes, this.isLoading});
  @override
  _TaskListBuilderState createState() => _TaskListBuilderState();
}

class _TaskListBuilderState extends State<TaskListBuilder> {
  // List<TodoModelClass> todoes;
  // bool isLoading = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // refreshNotes();
  }

  @override
  void dispose() {
    // TodoDatabase.instance.close();

    super.dispose();
  }

  // Future refreshNotes() async {
  //   setState(() => isLoading = true);
  //   todoes = await TodoDatabase.instance.readAllNotes();
  //   setState(() => isLoading = false);
  // }

  Future firstTodo() async {
    final task = TodoModelClass(
      title: "Add A New Task",
      description: "none",
      currentDateTime: DateTime.now(),
      // selectedDate: DateTime.now(),
      // selectedTime: TimeOfDay.now(),
    );
    await TodoDatabase.instance.create(task);
  }

  @override
  Widget build(BuildContext context) {
    Widget tame;
    widget.isLoading
        ? tame = Center(child: CircularProgressIndicator())
        : tame = widget.todoes.isEmpty
            ? Center(
                child: Text(
                  'Add New Note',
                  style: GoogleFonts.poppins(
                    color: Colors.grey[400],
                    height: 0.6,
                    decorationColor: Colors.black,
                    decorationStyle: TextDecorationStyle.solid,
                    fontSize: Sizes.dimens_24,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              )
            : ListView.builder(
                itemCount: widget.todoes.length,
                itemBuilder: (context, index) {
                  return TaskWidget(
                    todos: widget.todoes[index],
                    onChange: (isChecked) async {
                      setState(() {
                        widget.todoes[index].toggleDone();
                      });
                      await TodoDatabase.instance.update(widget.todoes[index]);
                    },
                    onDelete: () async {
                      await TodoDatabase.instance
                          .delete(widget.todoes[index].id);
                      setState(() {
                        widget.todoes.removeAt(index);
                      });
                    },
                  );
                },
                controller: widget.controllerScroll,
              );

    return tame;
  }
}
