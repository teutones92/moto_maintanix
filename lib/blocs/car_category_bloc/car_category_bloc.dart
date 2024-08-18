import 'package:moto_maintanix/conf/flutter_conf.dart';
import 'package:moto_maintanix/models/app/car_category_model.dart';

class CarCategoryBloc extends Cubit<CarCategoryModel?> {
  CarCategoryBloc() : super(null);

  void addCarCategory(CarCategoryModel carCategory) {
    emit(carCategory);
  }

  void removeCarCategory() {
    emit(null);
  }

  void updateCarCategory(CarCategoryModel carCategory) {
    emit(carCategory);
  }

  void selectCarCategory(CarCategoryModel car) {}
}
