import 'package:flutter/material.dart';
import 'package:my_todo_app/constants/colors.dart';
import 'package:my_todo_app/models/todo.dart';

class ToDoTile extends StatefulWidget {
  ToDoTile({
    required this.todo,
    required this.onDeleteCallback,
    required this.onTaskChecked,
  });

  final ToDo todo;
  final Function(String id) onDeleteCallback;
  final Function(ToDo todo) onTaskChecked;

  @override
  State<ToDoTile> createState() => _ToDoTileState();
}

class _ToDoTileState extends State<ToDoTile> {
  @override
  Widget build(BuildContext context) {
    return DismissibleTile(
      todo: widget.todo,
      onDeleteCallback: widget.onDeleteCallback,
      onTaskChecked: widget.onTaskChecked,
    );
  }
}

class DismissibleTile extends StatelessWidget {
  const DismissibleTile({
    required this.todo,
    required this.onDeleteCallback,
    required this.onTaskChecked,
  });

  final ToDo todo;
  final Function(String id) onDeleteCallback;
  final Function(ToDo todo) onTaskChecked;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(todo.id.toString()),
      onDismissed: (direction) {
        onDeleteCallback(todo.id!);
      },
      direction: DismissDirection.endToStart,
      background: DismissibleBackground(),
      child: TaskTile(
        todo: todo,
        onTaskChecked: onTaskChecked,
      ),
    );
  }
}

class DismissibleBackground extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red, // Background color when swiping
      alignment: Alignment.centerRight,
      margin: EdgeInsets.only(bottom: 20),
      padding: EdgeInsets.only(right: 16),
      child: Icon(
        Icons.delete,
        color: Colors.white,
        size: 40,
      ),
    );
  }
}

class TaskTile extends StatelessWidget {
  const TaskTile({
    required this.todo,
    required this.onTaskChecked,
  });

  final ToDo todo;
  final Function(ToDo todo) onTaskChecked;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: ListTile(
        onTap: () {
          onTaskChecked(todo);
        },
        contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        tileColor: todo.isDone! ? taskDoneColor : taskColor,
        leading: TaskCheckbox(
          todo: todo,
          onTaskChecked: onTaskChecked,
        ),
        title: TaskText(todo: todo),
      ),
    );
  }
}

class TaskCheckbox extends StatelessWidget {
  const TaskCheckbox({
    required this.todo,
    required this.onTaskChecked,
  });

  final ToDo todo;
  final Function(ToDo todo) onTaskChecked;

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      onChanged: (value) {
        onTaskChecked(todo);
      },
      activeColor: checkBoxColor,
      value: todo.isDone!,
    );
  }
}

class TaskText extends StatelessWidget {
  const TaskText({
    required this.todo,
  });

  final ToDo todo;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        todo.taskText!,
        style: TextStyle(
          color: todo.isDone! ? Colors.white : Colors.black,
          fontWeight: FontWeight.w500,
          fontSize: 25,
          decoration:
              todo.isDone! ? TextDecoration.lineThrough : TextDecoration.none,
        ),
      ),
    );
  }
}
