import 'package:flutter/material.dart';
import 'package:moto_maintanix/conf/flutter_conf.dart';
import 'package:moto_maintanix/models/app/car_category_model/car_category_model.dart';

class CarCategoryBloc extends Cubit<CarCategoryModel?> {
  CarCategoryBloc() : super(null);

  late TabController tabController;

  void setCategory(CarCategoryModel carCategory, BuildContext context) {
    emit(carCategory);
    context.read<CarListItemBloc>().getCarList(context);
  }

  void reset() {
    tabController.index = 0;
    emit(null);
  }
}
