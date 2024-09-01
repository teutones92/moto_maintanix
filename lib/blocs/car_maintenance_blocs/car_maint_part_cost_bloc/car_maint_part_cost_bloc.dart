import 'package:flutter/material.dart';
import 'package:moto_maintanix/conf/flutter_conf.dart';
import 'package:moto_maintanix/models/app/part_cost_model/part_cost_model.dart';
import 'package:moto_maintanix/models/repo/maintenances_tables/maint_cost_table/maint_cost_table.dart';
import 'package:moto_maintanix/service/car_maint_cost_service/car_maint_cost_service.dart';

class CarMaintPartCostBloc extends Cubit<List<MaintCostTable>> {
  CarMaintPartCostBloc() : super([]);

  // This is the controller for the maintenance part cost list
  final ValueNotifier<List<PartCostModel>> maintPartCostList =
      ValueNotifier<List<PartCostModel>>([]);

  void getMaintCostList({required int vehicleId, required int maintId}) {
    final maintCostList = CarMaintCostService.getCarCostMaintList(
        vehicleId: vehicleId, maintId: maintId);
    for (var e in maintCostList) {
      maintPartCostList.value.add(
        PartCostModel(
          id: e.id,
          partName: e.part,
          partCost: e.cost,
        ),
      );
    }
    emit(maintCostList);
  }

  void saveMaintCost(int vehicleId, int maintId) {
    if (maintPartCostList.value.isEmpty) {
      return;
    }
    final maintCostTableList = maintPartCostList.value
        .map((partCost) => MaintCostTable(
              id: partCost.id,
              maintId: maintId,
              vehicleId: vehicleId,
              part: partCost.partName ?? '',
              cost: partCost.partCost ?? 0.0,
            ))
        .toList();
    for (var element in maintCostTableList) {
      CarMaintCostService.addCarCostMaintRecord(element);
    }
  }

  // This method is used to add a new part cost item to the list of widgets
  void addNewPartCostItem() {
    final partCostList = maintPartCostList.value;
    partCostList.add(PartCostModel());
    maintPartCostList.value = List.from(partCostList);
  }

  void removePartCost(int index) {
    final partCostList = maintPartCostList.value;
    partCostList.removeAt(index);
    maintPartCostList.value = List.from(partCostList);
  }

  void resetNotifierValue() {
    maintPartCostList.value = [];
  }
}
