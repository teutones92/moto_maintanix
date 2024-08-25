import 'package:moto_maintanix/models/repo/maintenances_tables/maint_cost_table/maint_cost_table.dart';
import 'package:moto_maintanix/service/object_box_service.dart';

class CarMaintCostService {
  static List<MaintCostTable> getCarCostMaintList(
      {required int vehicleId, required int maintId}) {
    return ObjectBoxService.objectbox
        .getMaintCostRecords(vehicleId: vehicleId, maintId: maintId);
  }

  static void addCarCostMaintRecord(MaintCostTable maintCostTable) {
    ObjectBoxService.objectbox.createOrUpdateMaintCostRecord(maintCostTable);
  }

  static void deleteCarCostMaintRecord(int id) {
    ObjectBoxService.objectbox.deleteMaintCostRecord(id);
  }
}
