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
      } else if (int.tryParse(value) != null) {
        for (final maint in getMaintList(vehicleId)) {
          if (maint.maintDate.toString().contains(value) ||
              maint.nextMaintDate.toString().contains(value)) {
            list.add(maint);
          }
        }
      } else {
        for (final maint in getMaintList(vehicleId)) {
          if (maint.maintType.toLowerCase().contains(value.toLowerCase())) {
            list.add(maint);
          }
        }
      }
      emit(list);
    });
  }

  void _sortByDate() {
    final sortedList = state;
    sortedList.sort((a, b) => a.nextMaintDate.compareTo(b.nextMaintDate));
    emit([]);
    emit(sortedList);
  }

  void _sortByType() async {
    final sortedList = state;
    sortedList.sort((a, b) => a.maintType.compareTo(b.maintType));
    emit([]);
    emit(sortedList);
  }

  void filterMaintList(int i) {
    if (i == 0) {
      _sortByDate();
    } else {
      _sortByType();
    }
  }
}
