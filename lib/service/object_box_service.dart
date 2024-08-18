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
  static void init() async => objectbox = await _createDB();

  void createOrUpdateCarRegister(CarItemModel_ carItemModel) {
    _store.box<CarItemModel_>().put(carItemModel);
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

  List<CarItemModel_> getCarItems() {
    return _store.box<CarItemModel_>().getAll();
  }

  List<MaintReminderModel_> getMaintReminders() {
    return _store.box<MaintReminderModel_>().getAll();
  }

  CarItemModel_? getCarItem(int id) => _store.box<CarItemModel_>().get(id);

  MaintReminderModel_? getMaintReminder(int id) =>
      _store.box<MaintReminderModel_>().get(id);
}
