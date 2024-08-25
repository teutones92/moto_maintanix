import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:image_picker/image_picker.dart';
import 'package:moto_maintanix/conf/flutter_conf.dart';
import 'package:permission_handler/permission_handler.dart';

class ImagePickerBloc extends Cubit<Uint8List?> {
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
      pickedFile.readAsBytes().then((value) {
        emit(value);
        // emit(_convertToBase64(File(pickedFile.path)));
      });
    }
  }

  String _convertToBase64(File file) {
    final bytes = file.readAsBytesSync();
    return base64Encode(bytes);
  }

  void setImage(String? image) {
    if (image != null) {
      emit(base64Decode(image));
    }
  }

  void reset() {
    emit(null);
  }
}
