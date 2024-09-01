import 'package:moto_maintanix/models/repo/maintenances_tables/maint_table/maint_table.dart';
import 'package:moto_maintanix/service/object_box_service/object_box_service.dart';

class CarMaintService {
  static List<MaintTable> getMaintList(int vehicleId) {
    return ObjectBoxService.objectbox.getMaintRecords(vehicleId);
  }

  static int addMaintRecord(MaintTable maintTable) {
    return ObjectBoxService.objectbox.createOrUpdateCarMaintenance(maintTable);
  }

  static void deleteMaintRecord(int id) {
    ObjectBoxService.objectbox.deleteCarMaintenance(id);
  }
}
