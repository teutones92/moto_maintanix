import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:moto_maintanix/conf/flutter_conf.dart';
import 'package:moto_maintanix/models/app/car_category_model/car_category_model.dart';
import 'package:moto_maintanix/models/external_server/cars_data_model/cars_data_model.dart';
import 'package:moto_maintanix/models/repo/car_table_model/car_table_model.dart';
import 'package:moto_maintanix/service/object_box_service/object_box_service.dart';

class CarListItemBloc extends Cubit<List<CarTableModel>> {
  CarListItemBloc() : super([]);

  TextEditingController carYearCtrl = TextEditingController();
  TextEditingController carExtraNoteCtrl = TextEditingController();
  late CarCategoryBloc carType;
  late VehicleBrandBloc carBrand;
  late VehicleModelBloc carModel;
  late ImagePickerBloc imageP;

  void setDataFromDB(BuildContext context, CarTableModel carItem) {
    carYearCtrl.text = carItem.year!;
    carExtraNoteCtrl.text = carItem.notes!;
    carType.setCategory(
        CarCategoryModel.list
            .firstWhere((element) => element.id == carItem.carType),
        context);
    carBrand.setBrand(CarsDataModel(brand: carItem.brand, models: []));
    carModel.setModel(carItem.model);
    imageP.setImage(carItem.image);
  }

  void saveCar(BuildContext context, int? id) {
    if (carType.state == null ||
        carBrand.state == null ||
        carModel.state.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please select car type, brand and model'),
        ),
      );
      return;
    }
    final data = CarTableModel(
      id: id,
      carType: carType.state!.id,
      brand: carBrand.state!.brand,
      model: carModel.state,
      image: imageP.state != null ? base64Encode(imageP.state!) : '',
      year: carYearCtrl.text,
      notes: carExtraNoteCtrl.text,
    );
    ObjectBoxService.objectbox.createOrUpdateCarRegister(data) > 0
        ? Navigator.pop(context)
        : ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Failed to save car data'),
            ),
          );

    clearAll();
    getCarList(context);
  }

  List<CarTableModel> getCarList(BuildContext context) {
    carType = context.read<CarCategoryBloc>();
    carBrand = context.read<VehicleBrandBloc>();
    carModel = context.read<VehicleModelBloc>();
    imageP = context.read<ImagePickerBloc>();
    final List<CarTableModel> defaultList = [];
    final data = ObjectBoxService.objectbox.getCarItems();
    // state.clear();
    if (data.isNotEmpty) {
      context
          .read<SelectVehicleBloc>()
          .selectVehicle(context, 0, data.first.id!);
    }
    final catState = context.read<CarCategoryBloc>().state;
    // print(catState?.id);
    if (catState == null || catState.id == -1) {
      emit(data);
      return data;
    } else {
      for (var element in data) {
        if (element.carType == catState.id) {
          defaultList.add(element);
        }
      }
    }
    emit(defaultList);
    return defaultList;
  }

  void deleteVehicle(BuildContext context, CarTableModel carItem) async {
    ObjectBoxService.objectbox.deleteCarAndAllRegistersRelatedToIt(carItem.id!);
    getCarList(context);
    Navigator.pop(context);
    Navigator.pop(context);
    clearAll();
  }

  void clearAll() {
    carType.reset();
    carBrand.reset();
    carModel.reset();
    imageP.reset();
    carYearCtrl.clear();
    carExtraNoteCtrl.clear();
  }

  void onSearchVehicle(BuildContext context, String text) {
    final List<CarTableModel> data = getCarList(context);
    final List<CarTableModel> defaultList = [];
    for (var element in data) {
      if (element.brand.toLowerCase().contains(text.toLowerCase()) ||
          element.model.toLowerCase().contains(text.toLowerCase()) ||
          element.year.toString().toLowerCase().contains(text.toLowerCase())) {
        defaultList.add(element);
      }
    }
    if (text.isEmpty) {
      getCarList(context);
      return;
    }
    emit(defaultList);
  }
}
