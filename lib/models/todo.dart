class ToDo {
  ToDo({required this.id, required this.isDone, required this.taskText});
  String? id, taskText;
  bool? isDone;

  static List<ToDo> todos = [
    ToDo(id: "1", isDone: false, taskText: "hellow"),
    ToDo(id: "2", isDone: true, taskText: "meaw"),
    ToDo(id: "3", isDone: true, taskText: "few"),
    ToDo(id: "4", isDone: false, taskText: "shew"),
  ];
}
