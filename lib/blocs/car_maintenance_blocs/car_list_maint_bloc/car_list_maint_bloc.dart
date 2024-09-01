import 'dart:async';

import 'package:flutter/material.dart';
import 'package:moto_maintanix/conf/flutter_conf.dart';
import 'package:moto_maintanix/models/repo/maintenances_tables/maint_table/maint_table.dart';
import 'package:moto_maintanix/service/car_maint_service/car_maint_service.dart';

class CarListMaintBloc extends Cubit<List<MaintTable>> {
  CarListMaintBloc() : super([]);

  Timer? _debounce;

  TextEditingController maintTypeController = TextEditingController();
  final DateTime maintDate = DateTime.now();
  ValueNotifier<String> attachedFile = ValueNotifier<String>('');

  List<MaintTable> getMaintList(int vehicleId) {
    final maintCostList = CarMaintService.getMaintList(vehicleId);
    emit(maintCostList);
    return maintCostList;
  }

  void searchMaintList(String value, int vehicleId) async {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    final List<MaintTable> list = [];
    _debounce = Timer(const Duration(milliseconds: 500), () {
      if (value.isEmpty) {
        getMaintList(vehicleId);
        return;
      } else {
        for (final maint in getMaintList(vehicleId)) {
          if (maint.maintType.toLowerCase().contains(value.toLowerCase())) {
            list.add(maint);
            emit(list);
          } else {
            emit([]);
          }
        }
      }
    });
  }
}
