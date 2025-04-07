class Task {
  String? id;
  String? name;
  String? description;
  String? priority; // Low, Medium, High
  DateTime? deadline;
  String? status; // Unfinished, In Progress, Completed

  Task({this.id, this.name, this.description, this.priority, this.deadline, this.status});
}