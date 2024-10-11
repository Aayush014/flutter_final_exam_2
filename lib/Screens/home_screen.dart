import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_final_exam_2/Utils/color_palate.dart';
import 'package:get/get.dart';

import '../Controller/todo_controller.dart';
import '../Firebase Services/google_sign_in_services.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TodoController controller = Get.put(TodoController());
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: primaryColor,
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                GoogleAuthServices.googleAuthServices.currentUser()?.photoURL ??
                    "https://t4.ftcdn.net/jpg/00/65/77/27/360_F_65772719_A1UV5kLi5nCEWI0BNLLiFaBPEkUbv5Fv.jpg",
              ),
            ),
          )
        ],
        title: Text(
          "${(GoogleAuthServices.googleAuthServices.currentUser()?.displayName?.split(' ')[0] ?? 'User')}'s TODO",
          style: TextStyle(color: tileColor, fontWeight: FontWeight.bold),
        ),
      ),
      body: GetBuilder<TodoController>(
        builder: (controller) {
          return Padding(
            padding: const EdgeInsets.only(top: 15),
            child: ListView.builder(
              padding: const EdgeInsets.only(bottom: 100),
              itemCount: controller.todos.length,
              itemBuilder: (context, index) {
                final todo = controller.todos[index];
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 7, horizontal: 20),
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    decoration: BoxDecoration(
                      color: todo.isDone ? primaryColor : tileColor,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: ListTile(
                      onLongPress: () {
                        controller.editTask(context, index);
                      },
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            todo.title,
                            style: TextStyle(
                              decorationColor: Colors.black,
                              decorationThickness: 3,
                              color: todo.isDone ? Colors.white : Colors.black,
                              decoration: todo.isDone
                                  ? TextDecoration.lineThrough
                                  : TextDecoration.none,
                            ),
                          ),
                          Text(
                            "Added at: ${todo.time}", // Display the time here
                            style: TextStyle(
                                fontSize: 12,
                                color:
                                    todo.isDone ? Colors.white : Colors.grey),
                          ),
                        ],
                      ),
                      leading: Checkbox(
                        checkColor: todo.isDone ? Colors.black : Colors.white,
                        activeColor: bgColor,
                        value: todo.isDone,
                        onChanged: (value) {
                          controller.toggleTodoStatus(index);
                        },
                      ),
                      trailing: CupertinoButton(
                        padding: EdgeInsets.zero,
                        child: Icon(
                          Icons.delete,
                          color: todo.isDone ? Colors.white : Colors.black,
                        ),
                        onPressed: () {
                          controller.deleteTodo(index);
                        },
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: primaryColor,
        onPressed: () {
          controller.createNewTask(context);
        },
        child: Icon(
          CupertinoIcons.add,
          color: Theme.of(context).colorScheme.onSurface,
        ),
      ),
    );
  }
}
