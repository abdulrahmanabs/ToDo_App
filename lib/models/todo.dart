class ToDo {
  ToDo({required this.id, required this.isDone, required this.taskText});
  String? id, taskText;
  bool? isDone;

  static List<ToDo> todos = [
    ToDo(id: "1", isDone: false, taskText: "Upload Abstraction Video"),
    ToDo(id: "2", isDone: false, taskText: "Update github repo readme"),
    ToDo(id: "3", isDone: false, taskText: "Clean the room"),
  ];
}
