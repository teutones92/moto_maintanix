import 'package:objectbox/objectbox.dart';

@Entity()
class FilesTableModel {
  @Id(assignable: true)
  int? id;
  final int vehicleId;
  final int? userId;
  final int maintId;
  final String title;
  final String file;
  final String attachedDate;

  FilesTableModel({
    this.id,
    required this.vehicleId,
    this.userId,
    required this.maintId,
    required this.title,
    required this.file,
    required this.attachedDate,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'vehicleId': vehicleId,
      'userId': userId,
      'maintId': maintId,
      'title': title,
      'file': file,
      'attachedDate': attachedDate,
    };
  }

  factory FilesTableModel.fromMap(Map<String, dynamic> map) {
    return FilesTableModel(
      id: map['id'],
      vehicleId: map['vehicleId'],
      userId: map['userId'],
      maintId: map['maintId'],
      title: map['title'],
      file: map['file'],
      attachedDate: map['attachedDate'],
    );
  }
}
