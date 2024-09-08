import 'dart:convert';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:moto_maintanix/models/repo/files_table_mode/files_table_mode.dart';
import 'package:moto_maintanix/service/car_attach_files_service/car_attach_files_service.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';

import '../../../conf/flutter_conf.dart';

class CarMaintFilesBloc extends Cubit<List<FilesTableModel>> {
  CarMaintFilesBloc() : super([]);

  List<String> imgFileExt = [
    'jpg',
    'jpeg',
    'png',
    // 'gif',
    // 'bmp',
    // 'tiff',
    // 'tif',
    // 'webp',
    // 'svg',
    // 'ico',
    // 'heic',
    // 'heif',
    // 'raw',
    // 'cr2',
    // 'nef',
    // 'orf',
    // 'sr2'
  ];

  void getFiles(int vehicleId, int maintId) {
    final files = CarAttachFilesService.getFiles(vehicleId, maintId);
    emit(files);
  }

  void pickAFile() async {
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
      ],
    ).then((value) {
      if (value != null) {
        for (var element in value.files) {
          final file = File(element.path!);
          final fileModel = FilesTableModel(
            maintId: 0,
            vehicleId: 0,
            attachedDate: DateTime.now().toString(),
            title: file.path.split('/').last,
            file: _convertToBase64(file),
            fileExtension: file.path.split('.').last,
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
        id: element.id,
        vehicleId: vehicleId,
        maintId: maintId,
        title: element.title,
        file: element.file,
        attachedDate: DateTime.now().toString(),
        fileExtension: element.fileExtension,
      );
      CarAttachFilesService.addNewRegister(file);
    }
    if (state.isEmpty) {
      _deleteAllFileByMaintID(vehicleId: vehicleId, maintId: maintId);
    }
  }

  void openFile(FilesTableModel file) async {
    final fileBytes = base64Decode(file.file);
    final path = await getTemporaryDirectory();
    final directoryPath = Directory('${path.path}/tempFiles');
    if (!await directoryPath.exists()) {
      await directoryPath.create(recursive: true);
    }
    final tempFile =
        File('${directoryPath.path}/tempFile.${file.fileExtension}');
    tempFile.writeAsBytesSync(fileBytes);
    File created;
    if (!tempFile.existsSync()) {
      created = await tempFile.create();
    } else {
      created = tempFile;
    }
    try {
      await OpenFile.open(created.path);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  void _deleteAllFileByMaintID(
          {required int vehicleId, required int maintId}) =>
      CarAttachFilesService.removeAllFileByMaintId(
          vehicleId: vehicleId, maintId: maintId);

  void clearAll() => emit([]);
}
