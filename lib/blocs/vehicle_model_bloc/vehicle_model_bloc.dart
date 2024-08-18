import 'package:moto_maintanix/conf/flutter_conf.dart';

class VehicleModelBloc extends Cubit<String> {
  VehicleModelBloc() : super('');

  void setModel(String model) {
    emit(model);
  }

  void reset() {
    emit('');
  }
}
