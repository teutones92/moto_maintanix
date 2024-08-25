import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:moto_maintanix/conf/flutter_conf.dart';
import 'package:moto_maintanix/models/app/car_category_model.dart';
import 'package:moto_maintanix/models/external_server/cars_data_model/cars_data_model.dart';
import 'package:moto_maintanix/models/repo/car_table_model/car_table_model.dart';
import 'package:moto_maintanix/service/object_box_service.dart';

class CarListItemBloc extends Cubit<List<CarTableModel>> {
  CarListItemBloc() : super([]);

  TextEditingController carYearCtrl = TextEditingController();
  TextEditingController carExtraNoteCtrl = TextEditingController();

  void setDataFromDB(BuildContext context, CarTableModel carItem) {
    final carType = context.read<CarCategoryBloc>();
    final carBrand = context.read<VehicleBrandBloc>();
    final carModel = context.read<VehicleModelBloc>();
    final imageP = context.read<ImagePickerBloc>();
    carYearCtrl.text = carItem.year!;
    carExtraNoteCtrl.text = carItem.notes!;
    carType.setCategory(CarCategoryModel.list
        .firstWhere((element) => element.id == carItem.carType));
    carBrand.setBrand(CarsDataModel(brand: carItem.brand, models: []));
    carModel.setModel(carItem.model);
    imageP.setImage(carItem.image);
  }

  void saveCar(BuildContext context) {
    final carType = context.read<CarCategoryBloc>();
    final carBrand = context.read<VehicleBrandBloc>();
    final carModel = context.read<VehicleModelBloc>();
    final imageP = context.read<ImagePickerBloc>();
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

    getCarList(context);
    clearAll(context);
  }

  void getCarList(BuildContext context) {
    final data = ObjectBoxService.objectbox.getCarItems();
    state.clear();
    if (data.isNotEmpty) {
      context
          .read<SelectVehicleBloc>()
          .selectVehicle(context, 0, data.first.id!);
    }
    emit(data);
  }

  void deleteVehicle(BuildContext context, CarTableModel carItem) async {
    ObjectBoxService.objectbox.deleteCarAndAllRegistersRelatedToIt(carItem.id!);
    getCarList(context);
    Navigator.pop(context);
    Navigator.pop(context);
    clearAll(context);
  }

  void clearAll(BuildContext context) {
    final carType = context.read<CarCategoryBloc>();
    final carBrand = context.read<VehicleBrandBloc>();
    final carModel = context.read<VehicleModelBloc>();
    final imageP = context.read<ImagePickerBloc>();
    carType.reset();
    carBrand.reset();
    carModel.reset();
    imageP.reset();
    carYearCtrl.clear();
    carExtraNoteCtrl.clear();
  }

  // void updateCarItem(CarTableModel carItem) {
  //   final index = state.indexWhere((element) => element.id == carItem.id);
  //   state[index] = carItem;
  //   emit(state);
  // }
}
