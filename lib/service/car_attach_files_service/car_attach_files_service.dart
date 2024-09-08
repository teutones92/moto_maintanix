import 'package:moto_maintanix/models/repo/files_table_mode/files_table_mode.dart';
import 'package:moto_maintanix/service/object_box_service/object_box_service.dart';

class CarAttachFilesService {
  static int addNewRegister(FilesTableModel file) {
    return ObjectBoxService.objectbox.createOrUpdateFile(file);
  }

  static List<FilesTableModel> getFiles(int vehicleId, int maintId) {
    return ObjectBoxService.objectbox
        .getMaintFiles(vehicleId: vehicleId, maintId: maintId);
  }

  static void removeAllFileByMaintId(
          {required int vehicleId, required int maintId}) =>
      ObjectBoxService.objectbox.deleteAllFiles(vehicleId, maintId);
}
