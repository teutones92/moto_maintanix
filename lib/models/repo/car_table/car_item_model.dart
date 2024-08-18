// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:objectbox/objectbox.dart';

@Entity()
class CarItemModel {
  @Id(assignable: true)
  int? id;
  String name;
  int carType;
  String? brand;
  String? model;
  String? year;
  String? color;
  String? plate;
  String? image;

  CarItemModel({
    this.id,
    required this.name,
    required this.carType,
    this.brand,
    this.model,
    this.year,
    this.color,
    this.plate,
    this.image,
  });

  factory CarItemModel.fromJson(Map<String, dynamic> json) {
    return CarItemModel(
      id: json['id'],
      name: json['name'],
      carType: json['car_type'],
      brand: json['brand'],
      model: json['model'],
      year: json['year'],
      color: json['color'],
      plate: json['plate'],
      image: json['image'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'car_type': carType,
      'brand': brand,
      'model': model,
      'year': year,
      'color': color,
      'plate': plate,
      'image': image,
    };
  }
}
