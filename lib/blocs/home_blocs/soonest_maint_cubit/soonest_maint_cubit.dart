import 'package:moto_maintanix/conf/flutter_conf.dart';
import 'package:moto_maintanix/service/car_maint_service/car_maint_service.dart';

class SoonestMaintCubit extends Cubit<String> {
  SoonestMaintCubit() : super('');

  void _setSoonestMaint(String maintDate) {
    emit(maintDate);
  }

  void getSoonestMaintFromDB(int vehicleId) {
    final maintDate = CarMaintService.getMaintList(vehicleId);
    String newestDate = '';
    for (var element in maintDate) {
      if (newestDate.isEmpty) {
        newestDate = element.nextMaintDate;
      } else {
        if (DateTime.parse(element.nextMaintDate)
            .isBefore(DateTime.parse(newestDate))) {
          newestDate = element.nextMaintDate;
        }
      }
    }
    _setSoonestMaint(newestDate);
  }
}
