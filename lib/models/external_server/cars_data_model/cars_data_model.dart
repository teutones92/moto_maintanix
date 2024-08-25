class CarsDataModel {
  String brand;
  List<String> models;

  CarsDataModel({required this.brand, required this.models});

  factory CarsDataModel.fromJson(Map<String, dynamic> json) {
    return CarsDataModel(
      brand: json['brand'],
      models: List<String>.from(json['models']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'brand': brand,
      'models': models,
    };
  }
}
