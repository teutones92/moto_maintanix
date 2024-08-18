import 'package:moto_maintanix/models/repo/car_table/car_item_model.dart';
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

  int createOrUpdateCarRegister(CarItemModel carItemModel) {
    return _store.box<CarItemModel>().put(carItemModel);
  }

  void createOrUpdateMaintReminder(MaintReminderModel_ maintReminderModel) {
    _store.box<MaintReminderModel_>().put(maintReminderModel);
  }

  void deleteCarRegister(int id) {
    _store.box<CarItemModel_>().remove(id);
  }

  void deleteMaintReminder(int id) {
    _store.box<MaintReminderModel_>().remove(id);
  }

  List<CarItemModel> getCarItems() {
    return _store.box<CarItemModel>().getAll();
  }

  List<MaintReminderModel_> getMaintReminders() {
    return _store.box<MaintReminderModel_>().getAll();
  }

  CarItemModel_? getCarItem(int id) => _store.box<CarItemModel_>().get(id);

  MaintReminderModel_? getMaintReminder(int id) =>
      _store.box<MaintReminderModel_>().get(id);
}
