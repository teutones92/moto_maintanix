import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:moto_maintanix/conf/flutter_conf.dart';
import 'package:permission_handler/permission_handler.dart';

class ImagePickerBloc extends Cubit<File?> {
  ImagePickerBloc() : super(null);

  void pickImage(ImageSource source) async {
    if (source == ImageSource.camera) {
      final PermissionStatus status = await Permission.camera.request();
      if (status.isDenied) {
        await openAppSettings();
        return;
      }
    } else {
      final PermissionStatus status = await Permission.photos.request();
      if (status.isDenied) {
        await openAppSettings();
        return;
      }
    }
    final ImagePicker picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: source);
    if (pickedFile != null) {
      emit(File(pickedFile.path));
    }
  }

  void reset() {
    emit(null);
  }
}
