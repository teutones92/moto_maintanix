import 'package:objectbox/objectbox.dart';

@Entity()
class MaintCostTable {
  @Id(assignable: true)
  int? id;
  int vehicleId;
  int maintId;
  double cost;
  String part;

  MaintCostTable({
    this.id,
    required this.maintId,
    required this.vehicleId,
    required this.cost,
    required this.part,
  });

  factory MaintCostTable.fromJson(Map<String, dynamic> json) {
    return MaintCostTable(
      id: json['id'],
      vehicleId: json['vehicle_id'],
      maintId: json['maint_id'],
      cost: json['cost'],
      part: json['part'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'vehicle_id': vehicleId,
      'maint_id': maintId,
      'cost': cost,
      'part': part,
    };
  }
}
