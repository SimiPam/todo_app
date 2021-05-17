class TodoModelClass {
  final String title;
  final String description;
  final String selectedTime;
  final String currentDateTime;
  final String selectedDate;
  bool doneState;

  TodoModelClass({
    this.currentDateTime,
    this.selectedDate,
    this.selectedTime,
    this.title,
    this.description,
    this.doneState = false,
  });
}
