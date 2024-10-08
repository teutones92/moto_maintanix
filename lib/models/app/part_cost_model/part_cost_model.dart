class PartCostModel {
  int? id;
  String? partName;
  double? partCost;

  PartCostModel({this.id, this.partName, this.partCost});

  factory PartCostModel.fromJson(Map<String, dynamic> json) {
    return PartCostModel(
      partName: json['partName'],
      partCost: json['partCost'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'partName': partName,
      'partCost': partCost,
    };
  }
}
