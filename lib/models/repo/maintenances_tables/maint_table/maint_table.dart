import 'package:objectbox/objectbox.dart';

@Entity()
class MaintTable {
  @Id(assignable: true)
  int? id;
  final int? userId;

  int vehicleId;
  String maintType;
  String? maintDescription;
  String maintDate; // mm/dd/yyyy
  String nextMaintDate; // mm/dd/yyyy
  int? carOdometer;
  String? finishedTime;
  String? otherNotes;

  MaintTable({
    this.id,
    this.userId,
    required this.vehicleId,
    required this.maintType,
    this.maintDescription,
    required this.maintDate,
    required this.nextMaintDate,
    this.carOdometer,
    this.otherNotes,
    this.finishedTime,
  });

  factory MaintTable.fromJson(Map<String, dynamic> json) {
    return MaintTable(
      id: json['id'],
      userId: json['user_id'],
      vehicleId: json['vehicle_id'],
      maintType: json['maint_type'],
      maintDescription: json['maint_description'],
      maintDate: json['maint_date'],
      nextMaintDate: json['next_maint_date'],
      carOdometer: json['car_odometer'],
      finishedTime: json['finished_time'],
      otherNotes: json['other_notes'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_id': userId,
      'vehicle_id': vehicleId,
      'maint_type': maintType,
      'maint_description': maintDescription,
      'maint_date': maintDate,
      'next_maint_date': nextMaintDate,
      'car_odometer': carOdometer,
      'finished_time': finishedTime,
      'other_notes': otherNotes,
    };
  }
}
