//declare  the DB table name
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

final String table = 'todos';

class Todo {
  static final List<String> values = [
    /// Add all fields
    id, doneState, title, description, currentDateTime,
  ];

//the column name for the table
  static final String id = 'id';
  static final String doneState = 'doneState';
  // static final String selectedDate = 'selectedDate';
  static final String title = 'title';
  static final String description = 'description';
  // static final String selectedTime = 'selectedTime';
  static final String currentDateTime = 'currentDateTime';
}

class TodoModelClass {
  final String title;
  final String description;
  // final TimeOfDay selectedTime;
  final DateTime currentDateTime;
  // final DateTime selectedDate;
  final int id;
  bool doneState;

  TodoModelClass({
    this.id,
    this.currentDateTime,
    // this.selectedDate,
    // this.selectedTime,
    this.title,
    this.description,
    this.doneState = false,
  });

  void toggleDone() {
    doneState = !doneState;
  }

  TodoModelClass copy({
    int id,
    String title,
    String description,
    bool doneState,
    DateTime currentDateTime,
    // DateTime selectedDate,
    // TimeOfDay selectedTime,
  }) =>
      TodoModelClass(
        id: id ?? this.id,
        title: title ?? this.title,
        description: description ?? this.description,
        doneState: doneState ?? this.doneState,
        currentDateTime: currentDateTime ?? this.currentDateTime,
        // selectedDate: selectedDate ?? this.selectedDate,
        // selectedTime: selectedTime ?? this.selectedTime,
      );

  static TodoModelClass fromJson(Map<String, Object> json) => TodoModelClass(
        id: json[Todo.id] as int,
        doneState: json[Todo.doneState] == 1,
        title: json[Todo.title] as String,
        description: json[Todo.description] as String,
        currentDateTime: DateTime.parse(json[Todo.currentDateTime] as String),
        // selectedTime: TimeOfDay.fromDateTime(
        //     DateFormat.jm().parse(json[Todo.selectedTime] as String)),
        // selectedDate: DateTime.parse(json[Todo.selectedDate] as String),
      );

  Map<String, Object> toJson() => {
        Todo.id: id,
        Todo.title: title,
        Todo.doneState: doneState ? 1 : 0,
        Todo.description: description,
        // Todo.selectedDate: selectedDate.toIso8601String(),
        // Todo.selectedTime: selectedTime.toString(),
        Todo.currentDateTime: currentDateTime.toIso8601String(),
      };
}
