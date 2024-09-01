import 'package:moto_maintanix/models/repo/car_table_model/car_table_model.dart';
import 'package:moto_maintanix/models/repo/files_table_mode/files_table_mode.dart';
import 'package:moto_maintanix/models/repo/maintenances_tables/maint_cost_table/maint_cost_table.dart';
import 'package:moto_maintanix/models/repo/maintenances_tables/maint_reminder_table/maint_reminder_table.dart';
import 'package:moto_maintanix/models/repo/maintenances_tables/maint_table/maint_table.dart';
import 'package:moto_maintanix/objectbox.g.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

class ObjectBoxService {
  final Store _store;
  static late ObjectBoxService objectbox;

  ObjectBoxService._create(this._store);

  // Get the store instance to perform operations
  static Future<ObjectBoxService> _createDB() async {
    final docsDir = await getApplicationDocumentsDirectory();
    final store =
        await openStore(directory: p.join(docsDir.path, "moto_maintanix_db"));
    return ObjectBoxService._create(store);
  }

  // Initialize ObjectBoxService
  static Future<void> init() async => objectbox = await _createDB();

  //** CRUD operations **\\

  // Create or update a car register
  int createOrUpdateCarRegister(CarTableModel carItemModel) {
    return _store.box<CarTableModel>().put(carItemModel);
  }

  // Create or update a maintenance record
  int createOrUpdateCarMaintenance(MaintTable maintTable) {
    return _store.box<MaintTable>().put(maintTable);
  }

  // Create or update a maintenance cost record
  int createOrUpdateMaintCostRecord(MaintCostTable maintCostTable) {
    return _store.box<MaintCostTable>().put(maintCostTable);
  }

  // Create or update a maintenance reminder
  int createOrUpdateMaintReminder(MaintReminderTable maintReminderModel) {
    return _store.box<MaintReminderTable>().put(maintReminderModel);
  }

  // Create or update a file record in the database
  int createOrUpdateFile(FilesTableModel file) {
    return _store.box<FilesTableModel>().put(file);
  }

  // Get all car registers
  List<CarTableModel> getCarItems() {
    return _store.box<CarTableModel>().getAll();
  }

  // Get all maintenance records
  List<MaintTable> getMaintRecords(int vehicleId) {
    return _store
        .box<MaintTable>()
        .query(MaintTable_.vehicleId.equals(vehicleId))
        .build()
        .find();
  }

  // Get all maintenance cost records
  List<MaintCostTable> getMaintCostRecords(
      {required int vehicleId, required int maintId}) {
    return _store
        .box<MaintCostTable>()
        .query(
          MaintCostTable_.vehicleId.equals(vehicleId) &
              MaintCostTable_.maintId.equals(maintId),
        )
        .build()
        .find();
  }

  // Get the maintenance reminders
  List<MaintReminderTable> getMaintReminders(
      {required int vehicleId, required int maintId}) {
    return _store
        .box<MaintReminderTable>()
        .query(
          MaintReminderTable_.vehicleId.equals(vehicleId) &
              MaintReminderTable_.maintId.equals(maintId),
        )
        .build()
        .find();
  }

  // Get all files attached to a maintenance record
  List<FilesTableModel> getMaintFiles(
      {required int vehicleId, required int maintId}) {
    return _store
        .box<FilesTableModel>()
        .query(
          FilesTableModel_.vehicleId.equals(vehicleId) &
              FilesTableModel_.maintId.equals(maintId),
        )
        .build()
        .find();
  }

  // // Get a car register by id
  // CarItemModel_? getCarItem(int id) => _store.box<CarItemModel_>().get(id);

  // MaintReminderModel_? getMaintReminder(int id) =>
  //     _store.box<MaintReminderModel_>().get(id);

  // Delete a car register
  void deleteCarAndAllRegistersRelatedToIt(int id) {
    _store
        .box<MaintTable>()
        .query(MaintTable_.vehicleId.equals(id))
        .build()
        .remove();
    _store
        .box<MaintCostTable>()
        .query(MaintCostTable_.vehicleId.equals(id))
        .build()
        .remove();
    _store
        .box<MaintReminderTable>()
        .query(MaintReminderTable_.vehicleId.equals(id))
        .build()
        .remove();
    _store
        .box<FilesTableModel>()
        .query(FilesTableModel_.vehicleId.equals(id))
        .build()
        .remove();
    _store.box<CarTableModel>().remove(id);
  }

  // Delete a maintenance record
  void deleteCarMaintenance(int id) {
    _store.box<MaintTable>().remove(id);
  }

  // Delete a maintenance cost record
  void deleteMaintCostRecord(int id) {
    _store.box<MaintCostTable>().remove(id);
  }

  // Delete a maintenance reminder
  void deleteMaintReminder(int id) {
    _store.box<MaintReminderTable_>().remove(id);
  }

  // Delete a file record
  void deleteAllFiles() {
    _store.box<FilesTableModel>().removeAll();
  }
}
