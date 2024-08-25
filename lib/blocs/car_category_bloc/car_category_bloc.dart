import 'package:moto_maintanix/conf/flutter_conf.dart';
import 'package:moto_maintanix/models/app/car_category_model.dart';

class CarCategoryBloc extends Cubit<CarCategoryModel?> {
  CarCategoryBloc() : super(null);

  void setCategory(CarCategoryModel carCategory) {
    emit(carCategory);
  }

  void reset() {
    emit(null);
  }
}
