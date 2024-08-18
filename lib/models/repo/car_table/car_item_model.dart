// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:objectbox/objectbox.dart';

@Entity()
class CarItemModel {
  @Id(assignable: true)
  int? id;
  int carType;
  String? brand;
  String? model;
  String? year;
  String? notes;
  String? image;

  CarItemModel({
    this.id,
    this.notes,
    required this.carType,
    this.brand,
    this.model,
    this.year,
    this.image,
  });

  factory CarItemModel.fromJson(Map<String, dynamic> json) {
    return CarItemModel(
      id: json['id'],
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
      'notes': notes,
      'car_type': carType,
      'brand': brand,
      'model': model,
      'year': year,
      'image': image,
    };
  }
}
