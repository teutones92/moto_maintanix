import 'package:objectbox/objectbox.dart';

@Entity()
class MaintTable {
  @Id(assignable: true)
  int? id;
  String maintDate; // mm/dd/yyyy
  int vehicleId;
  String? maintType;
  String? maintDescription;
  String? otherNotes;
  String? maintStatus;
  String? attachedFiles;

  MaintTable({
    this.id,
    required this.maintDate,
    required this.vehicleId,
    this.maintType,
    this.maintDescription,
    this.otherNotes,
    this.maintStatus,
    this.attachedFiles,
  });

  factory MaintTable.fromJson(Map<String, dynamic> json) {
    return MaintTable(
      id: json['id'],
      vehicleId: json['vehicle_id'],
      maintDate: json['maint_date'],
      maintType: json['maint_type'],
      maintDescription: json['maint_description'],
      otherNotes: json['other_notes'],
      maintStatus: json['maint_status'],
      attachedFiles: json['attached_files'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'vehicle_id': vehicleId,
      'maint_date': maintDate,
      'maint_type': maintType,
      'maint_description': maintDescription,
      'other_notes': otherNotes,
      'maint_status': maintStatus,
      'attached_files': attachedFiles,
    };
  }
}
