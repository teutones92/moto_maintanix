// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:objectbox/objectbox.dart';

@Entity()
class CarTableModel {
  @Id(assignable: true)
  int? id;
  final int? userId;

  int carType;
  String brand;
  String model;
  String? year;
  String? notes;
  String? image;

  CarTableModel({
    this.id,
    this.userId,
    this.notes,
    required this.carType,
    required this.brand,
    required this.model,
    this.year,
    this.image,
  });

  factory CarTableModel.fromJson(Map<String, dynamic> json) {
    return CarTableModel(
      id: json['id'],
      userId: json['user_id'],
      notes: json['notes'],
      carType: json['car_type'],
      brand: json['brand'],
      model: json['model'],
      year: json['year'],
      image: json['image'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_id': userId,
      'notes': notes,
      'car_type': carType,
      'brand': brand,
      'model': model,
      'year': year,
      'image': image,
    };
  }
}
