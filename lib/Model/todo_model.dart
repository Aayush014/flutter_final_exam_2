class Todo {
  int? id;
  String title;
  bool isDone;
  String time; // Added time field

  Todo({
    this.id,
    required this.title,
    this.isDone = false,
    required this.time, // Time is required now
  });
}
