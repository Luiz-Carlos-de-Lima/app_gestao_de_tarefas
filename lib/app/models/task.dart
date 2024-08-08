class Task {
  String title;
  String description;
  String status;

  Task({
    required this.title,
    required this.description,
    this.status = 'pendente',
  });

  factory Task.fromJson({required Map mapTask}) {
    return Task(title: mapTask['title'], description: mapTask['description'], status: mapTask['status']);
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'status': status,
    };
  }
}
