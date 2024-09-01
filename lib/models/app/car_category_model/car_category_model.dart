class CarCategoryModel {
  int id;
  String name;
  String image;

  CarCategoryModel({required this.id, required this.name, required this.image});

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'image': image,
    };
  }

  factory CarCategoryModel.fromJson(Map<String, dynamic> json) {
    return CarCategoryModel(
      id: json['id'],
      name: json['name'],
      image: json['image'],
    );
  }

  static List<CarCategoryModel> list = [
    CarCategoryModel(
      id: 0,
      name: 'Convertible',
      image: 'assets/cars_images/convertible.webp',
    ),
    CarCategoryModel(
      id: 1,
      name: 'Coupe',
      image: 'assets/cars_images/coupe.webp',
    ),
    CarCategoryModel(
      id: 2,
      name: 'Electric',
      image: 'assets/cars_images/electric.webp',
    ),
    CarCategoryModel(
      id: 3,
      name: 'Hatchback',
      image: 'assets/cars_images/hatchback.webp',
    ),
    CarCategoryModel(
      id: 4,
      name: 'Hybrid',
      image: 'assets/cars_images/hybrid.webp',
    ),
    CarCategoryModel(
      id: 5,
      name: 'Minivan',
      image: 'assets/cars_images/minivan.webp',
    ),
    CarCategoryModel(
      id: 6,
      name: 'Plug-in Hybrid',
      image: 'assets/cars_images/plug-in-hybrid.webp',
    ),
    CarCategoryModel(
      id: 7,
      name: 'Sedan',
      image: 'assets/cars_images/sedan.webp',
    ),
    CarCategoryModel(
      id: 8,
      name: 'SUV',
      image: 'assets/cars_images/suv.webp',
    ),
    CarCategoryModel(
      id: 9,
      name: 'Truck',
      image: 'assets/cars_images/truck.webp',
    ),
    CarCategoryModel(
      id: 10,
      name: 'Wagon',
      image: 'assets/cars_images/wagon.webp',
    ),
  ];
}
