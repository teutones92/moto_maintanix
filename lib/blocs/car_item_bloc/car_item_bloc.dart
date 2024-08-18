import 'package:flutter/material.dart';
import 'package:moto_maintanix/conf/flutter_conf.dart';
import 'package:moto_maintanix/models/repo/car_table/car_item_model.dart';
import 'package:moto_maintanix/service/object_box_service.dart';

class CarItemBloc extends Cubit<List<CarItemModel>> {
  CarItemBloc() : super([]);

  TextEditingController carYearCtrl = TextEditingController();
  TextEditingController carExtraNoteCtrl = TextEditingController();

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
    final data = CarItemModel(
      carType: carType.state!.id,
      brand: carBrand.state!.brand,
      model: carModel.state,
      image: imageP.state?.path ?? '',
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

    getCarList();
    carType.reset();
    carBrand.reset();
    carModel.reset();
    imageP.reset();
    carYearCtrl.clear();
    carExtraNoteCtrl.clear();
  }

  void getCarList() {
    final data = ObjectBoxService.objectbox.getCarItems();
    state.clear();
    emit(data);
  }

  // void removeCarItem(CarItemModel carItem) {
  //   state.remove(carItem);
  //   emit(state);
  // }

  // void updateCarItem(CarItemModel carItem) {
  //   final index = state.indexWhere((element) => element.id == carItem.id);
  //   state[index] = carItem;
  //   emit(state);
  // }
}
