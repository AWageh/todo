class TaskModel {
  String id;
  String title;
  String description;
  bool status;
  int date;

  TaskModel(
      {this.id = '',
      required this.title,
      required this.date,
      required this.description,
      required this.status});

  // TaskModel fromjson(Map<String, dynamic> json) {
  //   TaskModel taskModel = TaskModel(
  //       id: json['id'],
  //       title: json['titile'],
  //       date: json['data'],
  //       description: json['description'],
  //       status: json['status']);
  //   return taskModel;
  // }

  TaskModel.fromjson(Map<String, dynamic> json)
      : this(
            id: json['id'],
            title: json['titile'],
            date: json['data'],
            description: json['description'],
            status: json['status']);

  Map<String, dynamic> tojson() {
    return {
      "id": id,
      "titile": title,
      "data": date,
      "description": description,
      "status": status,
    };
  }
}
