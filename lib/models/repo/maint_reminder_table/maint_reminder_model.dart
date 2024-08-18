import 'package:objectbox/objectbox.dart';

@Entity()
class MaintReminderModel {
  @Id(assignable: true)
  int? id;
  String title;
  String? description;
  String date;
  bool completed;
  bool reminderStatus;
  int vehicleId;

  MaintReminderModel({
    this.id,
    required this.title,
    this.description,
    required this.date,
    required this.completed,
    required this.reminderStatus,
    required this.vehicleId,
  });

  factory MaintReminderModel.fromJson(Map<String, dynamic> json) {
    return MaintReminderModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      date: json['date'],
      completed: json['completed'],
      reminderStatus: json['remainder_status'],
      vehicleId: json['vehicle_id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'date': date,
      'completed': completed,
      'reminder_status': reminderStatus,
      'vehicle_id': vehicleId,
    };
  }
}
