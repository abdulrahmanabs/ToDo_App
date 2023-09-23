import 'package:flutter/material.dart';
import 'package:my_todo_app/constants/colors.dart';
import 'package:my_todo_app/models/todo.dart';
import 'package:my_todo_app/widgets/todo_tile.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String? taskText;
  final addTaskTextController = TextEditingController();
  List<ToDo>? Tasks;

  void deleteTask(String id) {
    setState(() {
      ToDo.todos.removeWhere((element) => element.id == id);
    });
  }

  void AddTask() {
    if (addTaskTextController.text == "") return;
    setState(() {
      Tasks!.add(ToDo(
          id: (Tasks!.length + 1).toString(),
          isDone: false,
          taskText: taskText));
      taskText = "";
      addTaskTextController.clear();
    });
  }

  void Search(String searchWord) {
    setState(() {
      if (searchWord.isEmpty) {
        // If the search query is empty, show all tasks
        Tasks = ToDo.todos;
      } else {
        // Filter tasks based on the search query
        Tasks = ToDo.todos
            .where((element) => element.taskText!
                .toLowerCase()
                .contains(searchWord.toLowerCase()))
            .toList();
      }
    });
  }

  @override
  void initState() {
    Tasks = ToDo.todos;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: buildAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Stack(
          children: [
            Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                SearchBox(onSearchBoxChanged: Search),
                Expanded(
                  child: ListView(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 50, bottom: 20),
                        child: Text(
                          "All ToDos",
                          style: TextStyle(
                              fontWeight: FontWeight.w800,
                              fontSize: 25,
                              color: purpleColor),
                        ),
                      ),
                      for (ToDo todo in Tasks!.reversed)
                        ToDoTile(
                          todo: todo,
                          onDeleteCallback: deleteTask,
                        )
                    ],
                  ),
                )
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 30, top: 10),
                child: Row(children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 16.0),
                      child: Container(
                          height: 70,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8)),
                          child: Center(
                            child: TextField(
                              style: TextStyle(fontSize: 25),
                              controller: addTaskTextController,
                              onChanged: (value) {
                                taskText = value;
                              },
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Add new task",
                                  hintStyle: TextStyle(fontSize: 20),
                                  contentPadding: EdgeInsets.only(
                                      top: 10, bottom: 10, left: 20)),
                            ),
                          )),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      AddTask();
                    },
                    child: Icon(
                      Icons.add,
                      size: 50,
                    ),
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(75, 75),
                      backgroundColor: purpleColor,
                    ),
                  )
                ]),
              ),
            )
          ],
        ),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      elevation: 0,
      title: Row(
        children: [
          Icon(
            Icons.check_circle,
            color: Colors.green, // Example of using a custom color
          ),
          SizedBox(width: 8), // Adding spacing
          Text(
            "To-Do App",
            style: TextStyle(
              fontWeight: FontWeight.bold, // Customizing font weight
              fontSize: 32, // Customizing font size
              color: Colors.purple, // Using a consistent color
            ),
          ),
        ],
        mainAxisAlignment: MainAxisAlignment.center,
      ),
      backgroundColor: Colors.white, // Customizing the background color
    );
  }
}

class SearchBox extends StatelessWidget {
  SearchBox({required this.onSearchBoxChanged});
  final onSearchBoxChanged;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      margin: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextField(
        onChanged: (value) {
          onSearchBoxChanged(value);
        },
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: "Search",
          prefixIcon: Icon(Icons.search),
        ),
      ),
    );
  }
}
