import 'package:flutter/material.dart';
import 'package:moto_maintanix/conf/flutter_conf.dart';
import 'package:moto_maintanix/models/repo/maintenances_tables/maint_table/maint_table.dart';
import 'package:moto_maintanix/service/car_maint_service.dart';

class CarListMaintBloc extends Cubit<List<MaintTable>> {
  CarListMaintBloc() : super([]);

  TextEditingController maintTypeController = TextEditingController();
  final DateTime maintDate = DateTime.now();
  ValueNotifier<String> attachedFile = ValueNotifier<String>('');

  void getMaintList(int vehicleId) {
    final maintCostList = CarMaintService.getMaintList(vehicleId);
    emit(maintCostList);
  }
}
