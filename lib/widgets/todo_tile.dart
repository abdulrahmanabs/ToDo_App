import 'package:flutter/material.dart';
import 'package:my_todo_app/constants/colors.dart';
import 'package:my_todo_app/models/todo.dart';

class ToDoTile extends StatefulWidget {
  ToDoTile({required this.todo, required this.onDeleteCallback});
  ToDo todo;
  final onDeleteCallback;

  @override
  State<ToDoTile> createState() => _ToDoTileState();
}

class _ToDoTileState extends State<ToDoTile> {
  void CheckTask() {
    setState(() {
      widget.todo.isDone = !widget.todo.isDone!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: ListTile(
        onTap: () {
          CheckTask();
        },
        contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        tileColor: Colors.white,
        leading: Checkbox(
          onChanged: (value) {
            CheckTask();
          },
          activeColor: purpleColor,
          value: widget.todo.isDone!,
        ),
        title: Center(
          child: Text(
            widget.todo.taskText!,
            style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 25,
                decoration: widget.todo.isDone!
                    ? TextDecoration.lineThrough
                    : TextDecoration.none),
          ),
        ),
        trailing: GestureDetector(
          onTap: () {
            widget.onDeleteCallback(widget.todo.id);
          },
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
            width: 45,
            height: 45,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5), color: redColor),
            child: Icon(
              Icons.delete,
              size: 35,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
