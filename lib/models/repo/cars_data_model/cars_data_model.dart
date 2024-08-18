class CarsDataModel {
  String brand;
  List<String> model;

  CarsDataModel({required this.brand, required this.model});

  factory CarsDataModel.fromJson(Map<String, dynamic> json) {
    return CarsDataModel(
      brand: json['brand'],
      model: List<String>.from(json['model']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'brand': brand,
      'model': model,
    };
  }
}
