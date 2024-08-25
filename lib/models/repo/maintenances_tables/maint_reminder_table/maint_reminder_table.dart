import 'package:objectbox/objectbox.dart';

@Entity()
class MaintReminderTable {
  @Id(assignable: true)
  int? id;
  final int? userId;
  int vehicleId;
  int maintId;
  String title;
  String? description;
  String date;
  bool completed;
  bool reminderStatus;
  bool addedToCalendar;

  MaintReminderTable({
    this.id,
    this.userId,
    required this.vehicleId,
    required this.maintId,
    required this.title,
    required this.description,
    required this.date,
    required this.completed,
    required this.reminderStatus,
    required this.addedToCalendar,
  });

  factory MaintReminderTable.fromJson(Map<String, dynamic> json) {
    return MaintReminderTable(
      id: json['id'],
      userId: json['user_id'],
      title: json['title'],
      description: json['description'],
      date: json['date'],
      completed: json['completed'],
      reminderStatus: json['reminder_status'],
      addedToCalendar: json['added_to_calendar'],
      vehicleId: json['vehicle_id'],
      maintId: json['maint_id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_id': userId,
      'title': title,
      'description': description,
      'date': date,
      'completed': completed,
      'reminder_status': reminderStatus,
      'added_to_calendar': addedToCalendar,
      'vehicle_id': vehicleId,
      'maint_id': maintId,
    };
  }

  MaintReminderTable copyWith({required MaintReminderTable mrt}) {
    return MaintReminderTable(
      id: mrt.id,
      userId: mrt.userId,
      vehicleId: mrt.vehicleId,
      maintId: mrt.maintId,
      title: mrt.title,
      description: mrt.description,
      date: mrt.date,
      completed: mrt.completed,
      reminderStatus: mrt.reminderStatus,
      addedToCalendar: mrt.addedToCalendar,
    );
  }
}
