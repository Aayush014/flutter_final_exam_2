import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Database Services/db_helper.dart';
import '../Model/todo_model.dart';

class TodoController extends GetxController {
  final TextEditingController textController = TextEditingController();
  final TextEditingController editController = TextEditingController();
  var todos = <Todo>[].obs;
  final DatabaseHelper dbHelper = DatabaseHelper();

  @override
  void onInit() {
    super.onInit();
    loadTodos();
  }

  Future<void> loadTodos() async {
    List<Todo> loadedTodos = await dbHelper.getTodos();
    todos.assignAll(loadedTodos);
    update();
  }

  void addTodo(String title) async {
    String currentTime = TimeOfDay.now().format(Get.context!);
    Todo newTodo = Todo(
      title: title,
      time: currentTime,
    );
    int id = await dbHelper.insertTodo(newTodo);
    newTodo.id = id;
    todos.add(newTodo);
    update();
  }

  void toggleTodoStatus(int index) async {
    var todo = todos[index];
    todo.isDone = !todo.isDone;
    await dbHelper.updateTodo(todo);
    todos[index] = todo;
    update();
  }

  void deleteTodo(int index) async {
    await dbHelper.deleteTodo(todos[index].id!);
    todos.removeAt(index);
    update();
  }

  void editTodoTitle(int index, String newTitle) async {
    var todo = todos[index];
    todo.title = newTitle;
    await dbHelper.updateTodo(todo);
    todos[index] = todo;
    update();
  }

  void createNewTask(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: TextField(
          textCapitalization: TextCapitalization.sentences,
          controller: textController,
          decoration: const InputDecoration(
            hintText: "Create a new task",
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              addTodo(textController.text);
              Navigator.of(context).pop();
              textController.clear();
            },
            child: const Text("Save"),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              textController.clear();
            },
            child: const Text("Cancel"),
          ),
        ],
      ),
    );
  }

  void editTask(BuildContext context, int index) {
    editController.text = todos[index].title;
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: TextField(
          controller: editController,
          decoration: const InputDecoration(
            hintText: "Edit Task",
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              String updatedTaskName = editController.text.trim();
              if (updatedTaskName.isNotEmpty) {
                editTodoTitle(index, updatedTaskName);
                Navigator.of(context).pop();
                editController.clear();
              }
            },
            child: const Text("Save"),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              editController.clear();
            },
            child: const Text("Cancel"),
          ),
        ],
      ),
    );
  }
}
