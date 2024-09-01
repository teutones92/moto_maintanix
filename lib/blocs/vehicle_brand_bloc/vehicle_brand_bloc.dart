import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moto_maintanix/models/external_server/cars_data_model/cars_data_model.dart';
import 'package:moto_maintanix/service/car_data_service/car_data_service.dart';

class VehicleBrandBloc extends Cubit<CarsDataModel?> {
  VehicleBrandBloc() : super(null);
  void setBrand(CarsDataModel brand) {
    emit(brand);
  }

  void reset() {
    emit(null);
  }
}

class VehicleBrandListBloc extends Cubit<List<CarsDataModel>> {
  VehicleBrandListBloc() : super([]);

  late List<CarsDataModel> tList;
  void getListOfBrand() async {
    tList = await CarDataService.getCarsData();
    emit(tList);
  }

  Timer? _debounce;

  void searchBrand(String brand) {
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      final List<CarsDataModel> searchList = tList
          .where((element) =>
              element.brand.toLowerCase().contains(brand.toLowerCase()))
          .toList();
      emit(searchList);
    });
    if (brand.isEmpty) {
      emit(tList);
    }
  }

  void reset() {
    emit([]);
  }
}
