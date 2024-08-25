import 'dart:convert';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:moto_maintanix/models/repo/files_table_mode/files_table_mode.dart';
import 'package:moto_maintanix/service/car_attach_files_service.dart';

import '../../../conf/flutter_conf.dart';

class CarMaintFilesBloc extends Cubit<List<FilesTableModel>> {
  CarMaintFilesBloc() : super([]);

  void getFiles(int vehicleId, int maintId) {
    final files = CarAttachFilesService.getFiles(vehicleId, maintId);
    emit(files);
  }

  void pickAFile() async {
    clearAll();
    await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowMultiple: true,
        allowedExtensions: [
          'jpg',
          'jpeg',
          'png',
          'pdf',
          'doc',
          'docx',
          'xls',
          'xlsx',
        ]).then((value) {
      if (value != null) {
        for (var element in value.files) {
          final file = File(element.path!);
          final fileModel = FilesTableModel(
            maintId: 0,
            vehicleId: 0,
            attachedDate: DateTime.now().toString(),
            title: file.path.split('/').last,
            file: _convertToBase64(file),
          );
          final List<FilesTableModel> newState = List.from(state);
          newState.add(fileModel);
          emit(newState);
        }
      }
    });
  }

  String _convertToBase64(File file) {
    final converted = base64Encode(file.readAsBytesSync());
    return converted;
  }

  void saveMaintFile(int vehicleId, int maintId) {
    for (var element in state) {
      final file = FilesTableModel(
        vehicleId: vehicleId,
        maintId: maintId,
        title: element.title,
        file: element.file,
        attachedDate: DateTime.now().toString(),
      );
      CarAttachFilesService.addNewRegister(file);
    }
  }

  void removeAttachedFile(int index) {
    final files = state;
    files.removeAt(index);
    emit(files);
  }

  void clearAll() => emit([]);
}
